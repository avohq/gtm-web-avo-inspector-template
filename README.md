# Web GTM tag Avo Inspector template

Use this template to let Avo Inspector monitor the health of your tracking and help you improve it.

Learn more in the [Avo Inspector documentation](https://www.avo.app/docs/inspector/start-using-inspector)

> Note: No user data is sent to Avo.

## Gateways

Avo Inspector is moving to a multi-gate model: one Inspector API key per *gateway* (e.g. this web GTM container), rather than one Inspector source per destination. This tag has three optional parameters, **Output reference**, **Origin hint** and **App version**, that let a gateway-scoped key tell observations apart.

This tag fires on `dataLayer` events in the web container. An "output" here is a client-side destination tag (e.g. a Meta Pixel or GA4 event tag) that fires on the same event.

**Output reference** determines which checkpoint a tag instance observes:

- Leave it empty to observe at the **gateway (container) level**.
- Set it to a destination's reference from Avo (e.g. `meta-x7k2q`) to observe **that output's checkpoint**.

To observe an output's checkpoint, fire this tag on the **same trigger** as that destination tag, with the output's reference set in **Output reference**.

All three parameters are optional: **Output reference** alone determines the checkpoint, and **Origin hint** / **App version** can be set or omitted at either checkpoint.

Hints are passed to the Avo Inspector JS SDK as top-level fields on each observation — never inside the event schema.

On first load, the tag instance that ends up loading the SDK replays the events already in the `dataLayer` using **its own** **Output reference** / **Origin hint** / **App version**, matching how filters are replayed today. An instance that fired before the SDK finished loading and is configured with the *same* three parameters is already covered by that replay, so it stays silent rather than reporting the same observation twice. Every instance with a *different* configuration observes **its own triggering event** with **its own** parameters instead of replaying the `dataLayer` again — so an output-level tag firing on the same events as a gateway-level tag is neither skipped nor double-reported.

> "Same configuration" here means the same **Output reference**, **Origin hint** and **App version**. The event and property filters are deliberately not part of that comparison, so two instances that differ *only* in their include/exclude lists count as identical and the replay applies the initializing instance's filters to both. On first load only, an event that one instance's filters would have kept can therefore be dropped by the other's. Give such instances distinct hint parameters if that matters to you.

**Output reference**, **Origin hint** and **App version** require Avo Inspector JS SDK 3.3.0 or later. The tag passes all three in the third argument of `inspector.trackSchemaFromEvent`, a parameter that 3.3.0 adds; earlier builds take two arguments and ignore a third silently. They also require the SDK build that posts to `/inspector/v2/track` (see [How these reach Avo](#how-these-reach-avo)) — an older build reaches an endpoint that discards the two gateway fields.

The tag injects `https://cdn.avo.app/inspector/inspector-gtm-v2.min.js`, which is only a queueing stub — it forwards every argument it is given, so the third one survives the queue regardless of build. The build that consumes the queue is `https://cdn.avo.app/inspector/inspector-v2.min.js`, and that is the one which must be current. To check what is deployed:

```sh
curl -s https://cdn.avo.app/inspector/inspector-v2.min.js | grep -c outputReference
curl -s https://cdn.avo.app/inspector/inspector-v2.min.js | grep -c 'inspector/v2/track'
```

Either command printing `0` means the deployed build is too old: the tag's parameters will not reach Avo no matter how they are configured. **Publish this template to the gallery only after a build satisfying both checks is live**, otherwise the three parameters appear in the tag UI while doing nothing.

## Origin hint

**Origin hint** is a value identifying which source produced the event, e.g. `{{DLV - platform}}`. Use the same Data Layer Variable consistently across every Avo tag in the container, then map each value to a source in Avo.

- Values must be **low-cardinality** (e.g. `android`, `ios`, `web`) — never a user identifier, session ID, or anything else unique per user or per event.
- The tag does not validate this at runtime; it only trims and stringifies the value you provide, so getting this right is on the tag configuration, not the code.

> A `dataLayer` property literally named `outputReference` or `originHint` (unrelated business data) is unaffected by this feature. It still appears in the event schema exactly as before — the top-level `outputReference`/`originHint` fields described here come only from this tag's **Output reference** / **Origin hint** parameters, never from event data, and neither one overwrites or is affected by the other even though they share a key name.

## App version

**App version (optional)** is a value identifying which version of the source app produced the event, e.g. `{{DLV - app_version}}`. Like Origin hint, it is trimmed and sent as a top-level field alongside the event schema, never inside the event's own properties.

How it combines with **Origin hint** and the Inspector JS SDK's own configured version:

| Origin hint | App version | Version reported for the event |
| --- | --- | --- |
| set | set | the App version value |
| set | empty | literal JSON `null` |
| empty | set | the App version value (overrides the SDK's configured version) |
| empty | empty | the SDK's configured version |

**Origin hint** makes an event source-scoped: it did not come from this container, so the SDK's own configured version — a fixed `1.0.0` placeholder in this template — never applies to it. That is why the second row sends `"appVersion": null` rather than falling back to anything, and why it is `null` on the wire rather than an omitted key or an empty string.

## How these reach Avo

The Avo Inspector JS SDK posts observations to `POST https://api.avo.app/inspector/v2/track`, the unified Inspector ingestion endpoint that every Avo Inspector sender uses. Each sender identifies itself with an `X-Avo-Client` request header so its traffic can be attributed without decoding a body. **This tag sets that value to `gtm-web`**: on first load it writes `inspector.__CLIENT__` on the window, alongside the API key, environment, version and app name, before the SDK initializes. A page that embeds the SDK directly leaves the key unset and the SDK defaults to `web`, so web GTM traffic and hand-rolled browser traffic stay tellable apart.

The move to `/inspector/v2/track` and the `X-Avo-Client` header are part of the Inspector JS SDK, not this template — the template only declares which client it is. The CDN check in [Gateways](#gateways) is how you tell whether the deployed build has them; a build older than that still posts to `/inspector/v1/track`, which discards both gateway fields and drops events with a `null` app version — which is exactly why that build has to be live before this template is published.

What `/inspector/v2/track` does with the three parameters:

- **Output reference** and **Origin hint** are decoded and stored, so an observation is recorded at the checkpoint you configure rather than always at the gateway (container) level.
- A literal `null` **App version** — the second row of the table above, **Origin hint** set with **App version** empty — is accepted. Avo records the event as unversioned instead of discarding it, so that combination is a supported configuration and does not need an **App version** added to work.
- v2 does not sample: it pins the sampling rate it returns to `1.0`, and stored counts are exact rather than extrapolated from a sampled subset. The SDK still applies whatever rate the response hands it — that rate is now always `1.0`.

To check what a specific tag instance sends, open the browser network tab with the container in GTM Preview mode and inspect the `POST https://api.avo.app/inspector/v2/track` request: the `X-Avo-Client` header should read `gtm-web`, and the body should carry the `outputReference` / `originHint` / `appVersion` you configured as top-level fields next to `eventProperties`.

### Browser senders are blocked until Avo's CORS allowlist is updated

`/inspector/v2/track` requires the `api-key`, `env` and `X-Avo-Client` request headers. Custom headers make a CORS preflight unavoidable, and the Inspector write API's preflight currently answers with `Access-Control-Allow-Headers: content-type, content-encoding` — none of the three. A browser therefore refuses to send the request and nothing reaches Avo.

**Until that allowlist is updated on Avo's side, this tag cannot work end to end in production.** The fix is a separate, already-planned change to the Inspector write API; there is deliberately no fallback to the old endpoint and no feature flag in this template, because Avo is standardizing on one endpoint. This is the second precondition for publishing, next to the CDN build check above.

## How to publish an update

https://developers.google.com/tag-platform/tag-manager/templates/gallery#update_your_template
