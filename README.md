# Web GTM tag Avo Inspector template

Use this template to let Avo Inspector monitor the health of your tracking and help you improve it.

Learn more in the [Avo Inspector documentation](https://www.avo.app/docs/data-design/start-using-inspector)

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

On first load, the tag instance that ends up loading the SDK replays the events already in the `dataLayer` using **its own** **Output reference** / **Origin hint** / **App version**, matching how filters are replayed today. Every other tag instance that fired before the SDK finished loading observes **its own triggering event** with **its own** parameters instead of replaying the `dataLayer` again — so a second instance (for example an output-level tag firing on the same events) is neither skipped nor double-reported.

**Output reference**, **Origin hint** and **App version** require Avo Inspector JS SDK 3.3.0 or later, which this tag loads from `https://cdn.avo.app/inspector/inspector-gtm-v2.min.js`. That URL must serve the 3.3.0 build for any of the three to reach Avo. If events from a configured tag instance do not show these fields, confirm the page is loading the current SDK build — a stale cached bundle ignores the extra argument silently.

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

**These three parameters are not honored by the Avo Inspector backend yet.** The tag sends the correct payload today and will start working unchanged once the backend catches up — no tag reconfiguration will be needed then — but until that ships:

- The Inspector JS SDK posts to `/inspector/v1/track`, whose parser discards `outputReference` and `originHint`. Observations are recorded at the gateway (container) level regardless of what you configure here.
- That same parser **drops any event whose `appVersion` is `null`**. The request still returns HTTP 200, so nothing surfaces as an error — the event simply never appears in Avo.

The practical consequence: **set App version whenever Origin hint is set.** An **Origin hint** with an empty **App version** is exactly the `appVersion: null` case above, so those events are silently discarded until the backend is updated. Avo Inspector JS SDK 3.3.0 logs a console warning whenever it sends a `null` app version in the `dev` environment, which is the environment this tag uses in GTM Preview mode — so a misconfigured tag instance shows up in the Preview console before it ships.

## How to publish an update

https://developers.google.com/tag-platform/tag-manager/templates/gallery#update_your_template
