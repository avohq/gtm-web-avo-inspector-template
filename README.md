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

**Output reference**, **Origin hint** and **App version** require Avo Inspector JS SDK 3.3.0 or later. The tag passes all three in the third argument of `inspector.trackSchemaFromEvent`, a parameter that 3.3.0 adds; earlier builds take two arguments and ignore a third silently.

The tag injects `https://cdn.avo.app/inspector/inspector-gtm-v2.min.js`, which is only a queueing stub — it forwards every argument it is given, so the third one survives the queue regardless of build. The build that consumes the queue is `https://cdn.avo.app/inspector/inspector-v2.min.js`, and that is the one which must be 3.3.0 or later. To check which is deployed:

```sh
curl -s https://cdn.avo.app/inspector/inspector-v2.min.js | grep -c outputReference
```

`0` means the fields are not supported yet and the tag's parameters will not reach Avo no matter how they are configured. **Publish this template only after that build is live**, otherwise the three parameters appear in the tag UI while doing nothing.

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

## Backend support for these parameters

**Output reference and Origin hint are not honored by the Avo Inspector backend yet, and a `null` App version is dropped.** A non-null **App version** works end to end today: the fourth row of the table above, an empty **Origin hint** with **App version** set, already overrides the configured version in Avo. The tag sends the correct payload for all three, and the other cases start working unchanged once the backend catches up, with no tag reconfiguration needed. Until that ships:

- The Inspector JS SDK posts to `/inspector/v1/track`, whose parser discards `outputReference` and `originHint`. Observations are recorded at the gateway (container) level regardless of what you configure here.
- That same parser **drops any event whose `appVersion` is `null`**. The request still returns HTTP 200, so nothing surfaces as an error — the event simply never appears in Avo.

The practical consequence: **set App version whenever Origin hint is set.** An **Origin hint** with an empty **App version** is exactly the `appVersion: null` case above, so those events are silently discarded until the backend is updated.

Avo Inspector JS SDK 3.3.0 logs a console warning the first time it sends a `null` app version, once per page load, when the environment is `dev` — which is what this tag uses in GTM Preview mode. Because it fires once per page, a second misconfigured tag instance produces no additional line, and in production the SDK's logging is off, so nothing surfaces there at all. To check a specific instance, open the browser network tab with the container in GTM Preview mode and confirm the `POST https://api.avo.app/inspector/v1/track` body carries a non-null `appVersion`.

## How to publish an update

https://developers.google.com/tag-platform/tag-manager/templates/gallery#update_your_template
