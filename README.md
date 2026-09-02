# Web GTM tag Avo Inspector template

Use this template to let Avo Inspector monitor the health of your tracking and help you improve it.

Learn more about Avo Inspector [here](https://www.avo.app/docs/data-design/start-using-inspector)

> Note: No user data is sent to Avo.

## Gateways

Avo Inspector is moving to a multi-gate model: one Inspector API key per *gateway* (e.g. this web GTM container), rather than one Inspector source per destination. This tag has two optional parameters, **Output reference** and **Origin hint**, that let a gateway-scoped key tell observations apart.

This tag fires on `dataLayer` events in the web container. An "output" here is a client-side destination tag (e.g. a Meta Pixel or GA4 event tag) that fires on the same event.

**Output reference** determines which checkpoint a tag instance observes:

- Leave it empty to observe at the **gateway (container) level**.
- Set it to a destination's reference from Avo (e.g. `meta-x7k2q`) to observe **that output's checkpoint**.

To observe an output's checkpoint, fire this tag on the **same trigger** as that destination tag, with the output's reference set in **Output reference**.

Both fields are optional and independent: **Output reference** alone determines the checkpoint; **Origin hint** can be set or omitted at either checkpoint.

Hints are passed to the Avo Inspector JS SDK as top-level fields on each observation — never inside the event schema.

On first load, this tag replays existing `dataLayer` events using the **initializing** tag instance's **Output reference** / **Origin hint** — the same tag instance whose script sets up Avo Inspector on the page, matching how filters are replayed today.

**Output reference** and **Origin hint** require Avo Inspector JS SDK 3.3.0 or later, which this tag loads from `https://cdn.avo.app/inspector/inspector-gtm-v2.min.js`. If events from a configured tag instance do not show these fields, confirm the page is loading the current SDK build — a stale cached bundle ignores the extra argument silently.

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
| set | empty | none |
| empty | set | the App version value (overrides the SDK's configured version) |
| empty | empty | the SDK's configured version |

This template's own configured version is a fixed placeholder, so with **Origin hint** set and **App version** left empty, the event carries no app version at all.

## How to publish an update

https://developers.google.com/tag-platform/tag-manager/templates/gallery#update_your_template