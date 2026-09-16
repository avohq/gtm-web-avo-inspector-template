# Web GTM tag Avo Inspector template

Use this template to let Avo Inspector monitor the health of your tracking and help you improve it.

Learn more in the [Avo Inspector documentation](https://www.avo.app/docs/inspector/start-using-inspector)

> Note: No user data is sent to Avo.

## Gateways

Avo Inspector is moving to a multi-gate model: one Inspector API key per *gateway* (e.g. this web GTM container), rather than one Inspector source per destination. This tag has three optional parameters, **Output reference**, **Origin hint** and **Origin app version**, that let a gateway-scoped key tell observations apart.

This tag fires on `dataLayer` events in the web container. An "output" here is a client-side destination tag (e.g. a Meta Pixel or GA4 event tag) that fires on the same event.

**Output reference** determines which checkpoint a tag instance observes:

- Leave it empty to observe at the **gateway (container) level**.
- Set it to a destination's reference from Avo (e.g. `meta-x7k2q`) to observe **that output's checkpoint**.

To observe an output's checkpoint, fire this tag on the **same trigger** as that destination tag, with the output's reference set in **Output reference**.

All three parameters are optional: **Output reference** alone determines the checkpoint, and **Origin hint** / **Origin app version** can be set or omitted at either checkpoint.

Hints are passed to the Avo Inspector JS SDK as top-level fields on each observation — never inside the event schema.

On first load, the tag instance that ends up loading the SDK replays the events already in the `dataLayer` using **its own** **Output reference** / **Origin hint** / **Origin app version**, matching how filters are replayed today. An instance that fired before the SDK finished loading and is configured with the *same* three parameters is already covered by that replay, so it stays silent rather than reporting the same observation twice. Every instance with a *different* configuration observes **its own triggering event** with **its own** parameters instead of replaying the `dataLayer` again — so an output-level tag firing on the same events as a gateway-level tag is neither skipped nor double-reported.

> "Same configuration" here means the same **Output reference**, **Origin hint** and **Origin app version**. The event and property filters are deliberately not part of that comparison, so two instances that differ *only* in their include/exclude lists count as identical and the replay applies the initializing instance's filters to both. On first load only, an event that one instance's filters would have kept can therefore be dropped by the other's. Give such instances distinct hint parameters if that matters to you.

**Output reference**, **Origin hint** and **Origin app version** require Avo Inspector JS SDK 3.2.1 or later. The tag passes all three in the third argument of `inspector.trackSchemaFromEvent`, which 3.2.1 accepts only from this template (see [How these reach Avo](#how-these-reach-avo)); earlier builds take two arguments and ignore a third silently. They also require the SDK build that posts to `/inspector/v2/track` (see [How these reach Avo](#how-these-reach-avo)) — an older build reaches an endpoint that discards the two gateway fields.

The tag injects `https://cdn.avo.app/inspector/inspector-gtm-v3.min.js`, which is only a queueing stub — it forwards every argument it is given, so the third one survives the queue regardless of build. The stub loads `https://cdn.avo.app/inspector/inspector-v3.min.js`, the build that consumes the queue, and that is the one which must be current. To check what is deployed:

```sh
curl -s https://cdn.avo.app/inspector/inspector-gtm-v3.min.js | grep -c 'inspector/inspector-v3.min.js'
curl -s https://cdn.avo.app/inspector/inspector-v3.min.js | grep -c outputReference
curl -s https://cdn.avo.app/inspector/inspector-v3.min.js | grep -c 'inspector/v2/track'
```

Any command printing `0` means the stub or the build is missing or too old: the tag's parameters will not reach Avo no matter how they are configured. **Publish this template to the gallery only after all three checks pass**, otherwise the three parameters appear in the tag UI while doing nothing.

Both v3 files are new CDN objects that only this template version loads. Containers still on the previous template version, and pages that embed the SDK with a script tag, keep loading `inspector-gtm-v2.min.js` / `inspector-v2.min.js` and stay on that build until they update the template (or their script tag). Do not overwrite the v2 objects with the 3.3.0 build: that would move those users too.

## Origin hint

**Origin hint** is a value identifying which source produced the event, e.g. `{{DLV - platform}}`. Use the same Data Layer Variable consistently across every Avo tag in the container, then map each value to a source in Avo.

- Values must be **low-cardinality** (e.g. `android`, `ios`, `web`) — never a user identifier, session ID, or anything else unique per user or per event.
- The tag does not validate this at runtime; it only trims and stringifies the value you provide, so getting this right is on the tag configuration, not the code.

> A `dataLayer` property literally named `outputReference` or `originHint` (unrelated business data) is unaffected by this feature. It still appears in the event schema exactly as before — the top-level `outputReference`/`originHint` fields described here come only from this tag's **Output reference** / **Origin hint** parameters, never from event data, and neither one overwrites or is affected by the other even though they share a key name.

## Origin app version

**Origin app version (optional)** is a value identifying which version of the source app produced the event, e.g. `{{DLV - app_version}}`. It is named to pair with **Origin hint** (which source, and that source's version) and sets the event's `appVersion` field, which keeps its own name. Like Origin hint, it is trimmed and sent as a top-level field alongside the event schema, never inside the event's own properties.

How it combines with **Origin hint** and the Inspector JS SDK's own configured version:

| Origin hint | Origin app version | Version reported for the event |
| --- | --- | --- |
| set | set | the Origin app version value |
| set | empty | literal JSON `null` |
| empty | set | the Origin app version value (overrides the SDK's configured version) |
| empty | empty | the SDK's configured version |

**Origin hint** makes an event source-scoped: it did not come from this container, so the SDK's own configured version — a fixed `1.0.0` placeholder in this template — never applies to it. That is why the second row sends `"appVersion": null` rather than falling back to anything, and why it is `null` on the wire rather than an omitted key or an empty string.

## How these reach Avo

With this tag, the Avo Inspector JS SDK posts observations to `POST https://api.avo.app/inspector/v2/track`, the unified Inspector ingestion endpoint. Each sender identifies itself with an `X-Avo-Client` request header so its traffic can be attributed without decoding a body. **This tag sets that value to `gtm-web`**: on first load it writes `inspector.__CLIENT__` on the window, alongside the API key, environment, version and app name, before the SDK initializes. The SDK switches to v2 only when that value is exactly `gtm-web`. A page that embeds the SDK directly leaves the key unset and keeps posting to `/inspector/v1/track` exactly as before, so hand-rolled browser traffic is unaffected by this template.

The move to `/inspector/v2/track` and the `X-Avo-Client` header are part of the Inspector JS SDK, not this template — the template only declares which client it is. The CDN check in [Gateways](#gateways) is how you tell whether the deployed build has them; a build older than that still posts to `/inspector/v1/track`, which discards both gateway fields and drops events with a `null` app version — which is exactly why that build has to be live before this template is published.

What `/inspector/v2/track` does with the three parameters:

- **Output reference** and **Origin hint** are decoded and stored, so an observation is recorded at the checkpoint you configure rather than always at the gateway (container) level.
- A literal `null` **Origin app version** — the second row of the table above, **Origin hint** set with **Origin app version** empty — is accepted. Avo records the event as unversioned instead of discarding it, so that combination is a supported configuration and does not need an **Origin app version** added to work.
- v2 does not sample: it pins the sampling rate it returns to `1.0`, and stored counts are exact rather than extrapolated from a sampled subset. The SDK still applies whatever rate the response hands it — that rate is now always `1.0`.

To check what a specific tag instance sends, open the browser network tab with the container in GTM Preview mode and inspect the `POST https://api.avo.app/inspector/v2/track` request: the `X-Avo-Client` header should read `gtm-web`, and the body should carry the `outputReference` / `originHint` / `appVersion` you configured as top-level fields next to `eventProperties`.

### Browser senders are blocked until Avo's CORS allowlist is updated

`/inspector/v2/track` requires the `api-key`, `env` and `X-Avo-Client` request headers. Custom headers make a CORS preflight unavoidable, and the Inspector write API's preflight currently answers with `Access-Control-Allow-Headers: content-type, content-encoding` — none of the three. A browser therefore refuses to send the request and nothing reaches Avo.

**Until that allowlist is updated on Avo's side, this tag cannot work end to end in production.** The fix is a separate, already-planned change to the Inspector write API; there is deliberately no fallback to the old endpoint and no feature flag in this template, because Avo is standardizing on one endpoint. This is the second precondition for publishing, next to the CDN check above.

## How to publish an update

Before publishing this version: upload `inspector-v3.min.js` and `inspector-gtm-v3.min.js` to `https://cdn.avo.app/inspector/`, confirm the [CDN checks](#gateways) pass, and confirm the [CORS allowlist](#browser-senders-are-blocked-until-avos-cors-allowlist-is-updated) is live. Then follow:

https://developers.google.com/tag-platform/tag-manager/templates/gallery#update_your_template
