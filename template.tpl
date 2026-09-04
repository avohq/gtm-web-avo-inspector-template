___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Avo Inspector",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Avo",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAM9SURBVHgB7ZkxTBNRGMf/FQgJpmcCJiS2MSZG0jKa2E7oACYmRkPLKFAWQoyAI0IcHBB0UyhxlLYSJygxYRKNJi7t4OBATZw0bbrQ5doFF33flR5X4Oi7906vJPdLmutd7i7f/3vfe+/7vvNc7gn8wSnmDE45rgCncQU4jSvAaVwBTtMKm1G8Xvj8PgSDQf1aoVBAIV9Anh2P48peJ3r2uvTzYmsFXzuK4ME2AUPRCKKRQYRDIdN7SEA2m8XS8kqdmBuVSxgvXdXPyfj7HVvgQVpAOBzC88UF+H2+hvfSPf4ICY1gNZHEy+U4yuUyZJAS8HhuFmOx0bpr5Nnt7Q/YyX3Xr/lZSIVD1+pGh54bGOjH8EgMKEEYYQFrqUSdQZn90KCjGTQC5P2x2AgURdHO322m8en2C+ALhBBahcjzNeNVVcXMozncY548yXiCRmcpHsfdwShyuZx2TVG8uMlGQhTLAmjoa2FDxg+PxrCeTlt5hSbkDhNh9bnjsCSAhtwY8zOzc3WxbpWnC4v6SIhiScD01AN9tdlIb+I9m6wyqGoZ8wvPIIMlASHDpF1iS6Ad0LxZ39iEKNwCaL03et9sVxVB5l3cAoKBgP5fNnTshFtAryG3yRfyaBa4Bfh8F/T/+bx94SMLtwBjznKO7aLNArcAWvKaEW4BO4YNh1akZoFbQM6w4w70i+cudsMtgDYcyn0ISuS8rPKyC55awgxLO/FqMqUdKYN8ODUJOyDjh6KDEMWagERCHwVK6k4qH3mg+vkNqytksCSAVqLl+Ip+/molzor3AEQg49dSSanwISzXA69ZLVvL4ymU1pLJI2VlI8hoMl5UvJGWzq7zT2ARqnmpdULpRXt7O6739WltlN3SrtZCMYO8PjExXm0C+Kuep5D8OP8WF3+16fcV2yrYUn6AB4/MF5rpyUmtRjBSa51QoaPu7969LBEkbx+eM3QvFfW3vnUfbav4/0Nbhepb8viUodA5aJ2YP0deX02kqouCJrIbokj3hWg+0G+IjI42bmxtsOLlwHB5PP/iIx+JoAnu9VaTvnJZRSaTNTX6cGux0vIbn8/+BA8e9yulw7gCnMYV4DSuAKdxBTjNXy3yL/9pRPhYAAAAAElFTkSuQmCC"
  },
  "description": "Sends your events metadata to Avo Inspector to monitor and improve the data quality. Optional Output reference, Origin hint and App version parameters let one gateway-scoped Inspector API key tell observations apart. Find more at https://www.avo.app/docs/inspector/start-using-inspector.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "eventsToExclude",
    "displayName": "Event names to ignore",
    "simpleValueType": true,
    "defaultValue": "[\"click\", \"file_download\", \"first_visit\", \"form_start\", \"form_submit\", \"page_view\", \"scroll\", \"session_start\", \"user_engagement\", \"video_complete\", \"video_progress\", \"video_start\", \"view_search_results\", \"app_remove\", \"app_store_refund\", \"app_store_subscription_cancel\", \"app_store_subscription_renew\", \"error\", \"first_open\", \"in_app_purchase\", \"view_complete\"]",
    "canBeEmptyString": false,
    "help": "JSON Array of event names that will not be reported to Avo Inspector",
    "textAsList": false,
    "valueHint": "JSON Array of event names that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "eventsToInclude",
    "displayName": "Event names to force include (highest filter priority)",
    "simpleValueType": true,
    "defaultValue": "[]",
    "canBeEmptyString": false,
    "help": "JSON Array of event names that will be force included in Avo Inspector, even if they match exclude rules",
    "textAsList": false,
    "valueHint": "JSON Array of event names that will be force included in Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "eventPrefixesToExclude",
    "displayName": "Event prefixes to ignore",
    "simpleValueType": true,
    "canBeEmptyString": false,
    "defaultValue": "[\"gtm.\", \"gtag.\", \"firebase_\", \"ga_\", \"google_\", \"_\"]",
    "help": "JSON Array of prefixes for event names that will not be reported to Avo Inspector",
    "valueHint": "JSON Array of event name prefixes that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "propertiesToExclude",
    "displayName": "Property names to ignore",
    "simpleValueType": true,
    "canBeEmptyString": false,
    "defaultValue": "[\"userId\", \"segmentAnonymousId\", \"event\", \"language\",       \"page_location\", \"page_referrer\", \"page_title\", \"screen_resolution\",       \"engagement_time_msec\", \"gclid\", \"session_id\", \"session_number\"]",
    "help": "JSON Array of property names that will not be reported to Avo Inspector",
    "valueHint": "JSON Array of property names that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "propertiesToInclude",
    "displayName": "Property names to force include (highest filter priority)",
    "simpleValueType": true,
    "defaultValue": "[]",
    "canBeEmptyString": false,
    "help": "JSON Array of property names that will be force included in Avo Inspector, even if they match exclude rules",
    "textAsList": false,
    "valueHint": "JSON Array of property names that will be force included in Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "propertyPrefixesToExclude",
    "displayName": "Property prefixes to ignore",
    "simpleValueType": true,
    "canBeEmptyString": false,
    "defaultValue": "[\"gtm.\", \"gtag.\", \"firebase_\", \"ga_\", \"google_\", \"_\"]",
    "help": "JSON Array of prefixes for property names that will not be reported to Avo Inspector",
    "valueHint": "JSON Array of property name prefixes that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "inspectorApiKey",
    "displayName": "Inspector API Key",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "outputReference",
    "displayName": "Output reference (optional)",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "help": "Paste the output's reference from Avo (e.g. meta-x7k2q) when this tag observes one destination's payload; leave empty to observe at the gateway level."
  },
  {
    "type": "TEXT",
    "name": "originHint",
    "displayName": "Origin hint (optional)",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "help": "Value identifying which source the event came from, e.g. {{DLV - platform}}; use the same field in every Avo tag in the container and map each value to a source in Avo; low-cardinality values only, never a user identifier."
  },
  {
    "type": "TEXT",
    "name": "appVersion",
    "displayName": "App version (optional)",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "help": "Version of the source app that produced the event, e.g. {{DLV - app_version}}. With Origin hint set, this is the version reported for the event (null when left empty); without Origin hint it overrides the default version only when provided. Set this whenever Origin hint is set: until the Inspector backend is updated, events that arrive with a null app version are discarded."
  },
  {
    "type": "TEXT",
    "name": "appName",
    "displayName": "Application name",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "publicEncryptionKey",
    "displayName": "Public Encryption Key (optional)",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "help": "Optional ECIES public encryption key for property value validation. Without a key, property values are not sent. \u003ca href=\"https://www.avo.app/docs/inspector/inspector-debugger#generating-encryption-keys\"\u003eLearn more\u003c/a\u003e"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const JSON = require('JSON');
const log = require('logToConsole');
const copyFromWindow = require('copyFromWindow');
const copyFromDataLayer = require('copyFromDataLayer');
const callInWindow = require('callInWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const getType = require('getType');
const Object = require('Object');
const getContainerVersion = require('getContainerVersion');
const templateStorage = require('templateStorage');

const LOG_PREFIX = '[Avo Inspector] ';
const INSTANCE_STORAGE_KEY = 'Avo Inspector Init';

const isPreview = getContainerVersion().previewMode;

const arrayIncludes = (arr, searchString) => {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === searchString) {
      return true;
    }
  }
  return false;
};

const stringStartsWith = (str, startStr) => {
  return str.indexOf(startStr) === 0;
};

// Check if a string starts with any of the prefixes in the array
const startsWithOneOfPrefixes = (str, prefixes) => {
  for (var i = 0; i < prefixes.length; i++) {
    if (stringStartsWith(str, prefixes[i])) {
      return true;
    }
  }
  return false;
};

// --- Gateway coordinate fields (outputReference, originHint, appVersion) ---
// Normalizes a tag-parameter value into a string safe to forward to the Avo
// Inspector JS SDK, or '' when there is nothing sendable. Caller omits the key
// entirely when the result is ''.
function toHintString(value) {
  var t = getType(value);
  if (t === 'string') {
    return value.trim();
  } else if (t === 'number' || t === 'boolean') {
    return '' + value;
  }
  // undefined, null, object, array -> nothing sendable. These values are
  // forwarded to the Avo Inspector JS SDK, which accepts strings only and
  // omits anything else; numbers and booleans are stringified above because
  // GTM tag parameters are untyped, but the remaining types have no
  // meaningful string form, so forwarding them would be misleading.
  return '';
}

// Normalizes rawValue via toHintString and sets hints[key] only when the
// result is non-empty; omits the key entirely otherwise (never null/'').
// Centralizes the "trim/stringify, then omit-if-empty" rule shared by all
// hint fields so adding a field is one call, not one more block.
function setHintField(hints, key, rawValue) {
  var value = toHintString(rawValue);
  if (value !== '') {
    hints[key] = value;
  }
}

// Signature of this tag instance's hint configuration. templateStorage is
// shared by every instance of this template on the page, so the instance that
// loads the SDK stores its own signature there; instances whose injectScript
// callback arrives later compare it with theirs to find out whether the
// dataLayer replay already covered them (see onsuccess). Built from the
// normalized values so '  web ' and 'web' count as the same configuration.
const hintSignature = toHintString(data.outputReference) + '|' +
  toHintString(data.originHint) + '|' +
  toHintString(data.appVersion);

const onfailure = () => {
  log(LOG_PREFIX + 'Error: failed to load Avo Inspector');
  return data.gtmOnFailure();
};

const onsuccess = () => {
   const initializedBy = templateStorage.getItem(INSTANCE_STORAGE_KEY);
   if (!initializedBy) {
    templateStorage.setItem(INSTANCE_STORAGE_KEY, hintSignature);
    setInWindow('inspector.__API_KEY__', data.inspectorApiKey, true);
    setInWindow('inspector.__ENV__', isPreview ? 'dev' : 'prod', true);
    setInWindow('inspector.__VERSION__', "1.0.0", true);
    setInWindow('inspector.__APP_NAME__', data.appName, true);

    if (data.publicEncryptionKey) {
      setInWindow('inspector.__PUBLIC_ENCRYPTION_KEY__', data.publicEncryptionKey, true);
    }

    var _inspector = copyFromWindow("inspector");

    _inspector.load();
    // Replay the dataLayer events that fired before the SDK finished loading,
    // with this (initializing) instance's hints. This instance's own
    // triggering event is part of that replay, so it is never observed twice.
    var dataLayerArray = copyFromWindow('dataLayer');
    for (var i = 0; i < dataLayerArray.length; i++) {
        var dataLayerEvent = dataLayerArray[i];
        if (dataLayerEvent.event) {
            inspectEventFromDataLayer(dataLayerEvent.event, dataLayerEvent["gtm.uniqueEventId"]);
        }
    }
  } else if (initializedBy !== hintSignature) {
    // Another tag instance loaded the SDK first and replayed the dataLayer
    // with ITS hints while this instance was still waiting for the script, so
    // this instance's triggering event has not been observed with THIS
    // instance's hints yet. Observe it now, exactly as the already-initialized
    // branch at the bottom of this file does. Deliberately no replay and no
    // setItem: the other instance owns the stored signature, and replaying the
    // whole dataLayer here would report events this instance never triggered.
    // An instance whose signature matches falls through and does nothing: the
    // replay already covered it with identical hints.
    var ownEventName = copyFromDataLayer("event");
    var ownEventId = copyFromDataLayer("gtm.uniqueEventId");
    inspectEventFromDataLayer(ownEventName, ownEventId);
  }

  data.gtmOnSuccess();
  return;
};

const inspectEventFromDataLayer = (eventName, eventId) => {
  if (isPreview) {
    log(LOG_PREFIX, 'Inspecting', eventName, eventId);
  }
  if (checkInput(eventName, eventId)) {
    var dataLayerEvent = getDataLayerEventWithUniqueId(eventId);

    if (checkDataLayerEventMatchCallingEvent(dataLayerEvent, eventName)) {
      handleEvent(dataLayerEvent);
    } else if (isPreview) {
      log(LOG_PREFIX + 'Event ' + eventName + ' filtered out and not sent to Avo Inspector because of the data layer content');
    }
  } else if (isPreview) {
    log(LOG_PREFIX + 'Event ' + eventName + ' filtered out and not sent to Avo Inspector because of event name');
  }
};

const checkInput = (eventName, uniqueEventId) => {  
  var eventsToExclude = JSON.parse(data.eventsToExclude);
  var eventsToInclude = JSON.parse(data.eventsToInclude);
  var eventPrefixesToExclude = data.eventPrefixesToExclude ? JSON.parse(data.eventPrefixesToExclude) : [];
  
  // Check if event is force included (highest priority)
  if (arrayIncludes(eventsToInclude, eventName)) {
    return getType(uniqueEventId) !== "undefined" && getType(eventName) !== "undefined";
  }
  
  // Check if event is explicitly excluded
  if (arrayIncludes(eventsToExclude, eventName)) {
    return false;
  }
  
  // Check if event starts with any excluded prefix
  if (eventPrefixesToExclude.length > 0 && startsWithOneOfPrefixes(eventName, eventPrefixesToExclude)) {
    return false;
  }
  
  return getType(uniqueEventId) !== "undefined" && getType(eventName) !== "undefined";
};

function getDataLayerEventWithUniqueId(uniqueEventId) {
  var dataLayer = copyFromWindow("dataLayer");
  var matchingEvent = null;
  for (var i = dataLayer.length - 1; i >= 0; i--) {
    var event = dataLayer[i];
    if (event["gtm.uniqueEventId"] === uniqueEventId) {
      matchingEvent = event;
      break;
    }
  }
  return matchingEvent;
}

function checkDataLayerEventMatchCallingEvent(dataLayerEvent, eventName) {
  if (getType(dataLayerEvent) !== "undefined" && getType(dataLayerEvent) !== "null") {
    var dataLayerEventName = dataLayerEvent.event;
    if (getType(dataLayerEventName) === "undefined" || getType(dataLayerEventName) === "null") {
      return false;
    }
    if (dataLayerEventName === eventName) {
      return true;
    }
  }
  return false;
}

function handleEvent(dataLayerEvent) {    
  var propertiesToExclude = JSON.parse(data.propertiesToExclude);
  var propertiesToInclude = JSON.parse(data.propertiesToInclude);
  var propertyPrefixesToExclude = data.propertyPrefixesToExclude ? JSON.parse(data.propertyPrefixesToExclude) : [];
  var eventProperties = {};
  
  Object.keys(dataLayerEvent).forEach((key) => {
    // Check if property is force included (highest priority)
    if (arrayIncludes(propertiesToInclude, key)) {
      eventProperties[key] = dataLayerEvent[key];
      return;
    }
    
    // Check if property is explicitly excluded
    if (arrayIncludes(propertiesToExclude, key)) {
      if (isPreview) {
        log(LOG_PREFIX + 'Property ' + key + ' filtered out and not sent to Avo Inspector because it is in the exclusion list');
      }
      return;
    }
    
    // Check if property starts with any excluded prefix
    if (propertyPrefixesToExclude.length > 0 && startsWithOneOfPrefixes(key, propertyPrefixesToExclude)) {
      if (isPreview) {
        log(LOG_PREFIX + 'Property ' + key + ' filtered out and not sent to Avo Inspector because of its prefix');
      }
      return;
    }
    
    // Include the property if it passed all filters
    eventProperties[key] = dataLayerEvent[key];
  });
  
  var hints = {};
  setHintField(hints, 'outputReference', data.outputReference);
  setHintField(hints, 'originHint', data.originHint);
  setHintField(hints, 'appVersion', data.appVersion);

  if (Object.keys(hints).length > 0) {
    callInWindow('inspector.trackSchemaFromEvent', dataLayerEvent.event, eventProperties, hints);
  } else {
    callInWindow('inspector.trackSchemaFromEvent', dataLayerEvent.event, eventProperties);
  }
  return;
}

const alreadyInit = templateStorage.getItem(INSTANCE_STORAGE_KEY);
if (!alreadyInit) {
  injectScript("https://cdn.avo.app/inspector/inspector-gtm-v2.min.js", onsuccess, onfailure, 'inspector_cache');
} else {
  var eventName = copyFromDataLayer("event");
  var eventId = copyFromDataLayer("gtm.uniqueEventId");
  inspectEventFromDataLayer(eventName, eventId);
  data.gtmOnSuccess();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__API_KEY__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__VERSION__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__APP_NAME__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.load"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.trackSchemaFromEvent"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__ENV__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__PUBLIC_ENCRYPTION_KEY__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "gtm.uniqueEventId"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.avo.app/inspector/inspector-gtm-v2.min.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_template_storage",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Backward compatibility - neither hint param set leaves the call unchanged
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertApi('injectScript').wasNotCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.path).isEqualTo('inspector.trackSchemaFromEvent');
    assertThat(call.length).isEqualTo(3);
    assertThat(call.args.length).isEqualTo(2);
    assertApi('callInWindow').wasCalledWith('inspector.trackSchemaFromEvent', 'test_event', { event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' });

- name: outputReference set, originHint unset omits originHint key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-x7k2q';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(Object.keys(call.args[2]).indexOf('originHint')).isEqualTo(-1);

- name: outputReference empty string omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = '';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(3);

- name: outputReference whitespace-only omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = '   ';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(3);

- name: outputReference null omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = null;

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(3);

- name: outputReference as an empty object omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = {};

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(3);

- name: outputReference as an empty array omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = [];

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(3);

- name: originHint as a plain string is trimmed and sent
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = '  android  ';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('android');
    assertThat(Object.keys(call.args[2]).indexOf('outputReference')).isEqualTo(-1);

- name: originHint as a number is stringified
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = 123;

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('123');

- name: originHint as a boolean is stringified
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = true;

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('true');

- name: Both outputReference and originHint set are both present
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-x7k2q';
    mockData.originHint = 'android';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(call.args[2].originHint).isEqualTo('android');

- name: Only originHint set leaves outputReference absent
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = 'android';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('android');
    assertThat(Object.keys(call.args[2]).indexOf('outputReference')).isEqualTo(-1);

- name: Neither outputReference nor originHint ever appears as a propertyName in eventProperties
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-x7k2q';
    mockData.originHint = 'android';
    mockData.appVersion = '5.1.0';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    const eventProperties = call.args[1];
    assertThat(Object.keys(eventProperties).indexOf('outputReference')).isEqualTo(-1);
    assertThat(Object.keys(eventProperties).indexOf('originHint')).isEqualTo(-1);
    assertThat(Object.keys(eventProperties).indexOf('appVersion')).isEqualTo(-1);
    assertThat(call.args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(call.args[2].originHint).isEqualTo('android');
    assertThat(call.args[2].appVersion).isEqualTo('5.1.0');

- name: Event data property literally named outputReference coexists with the tag-config outputReference
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, outputReference: 42 }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-config-value';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    const eventProperties = call.args[1];
    assertThat(eventProperties.outputReference).isEqualTo(42);
    assertThat(call.args[2].outputReference).isEqualTo('meta-config-value');

- name: Two tag instances differing only in originHint produce identical eventProperties
  code: |-
    const JSON = require('JSON');
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockDataA = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockDataA.originHint = 'ios';
    runCode(mockDataA);

    const mockDataB = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockDataB.originHint = 'android';
    runCode(mockDataB);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(2);
    const callA = capturedCalls[0];
    const callB = capturedCalls[1];
    assertThat(JSON.stringify(callA.args[1])).isEqualTo(JSON.stringify(callB.args[1]));
    assertThat(callA.args[2].originHint).isEqualTo('ios');
    assertThat(callB.args[2].originHint).isEqualTo('android');

- name: Two tag instances differing only in outputReference produce identical eventProperties
  code: |-
    const JSON = require('JSON');
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockDataA = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockDataA.outputReference = 'meta-aaa';
    runCode(mockDataA);

    const mockDataB = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockDataB.outputReference = 'meta-bbb';
    runCode(mockDataB);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(2);
    const callA = capturedCalls[0];
    const callB = capturedCalls[1];
    assertThat(JSON.stringify(callA.args[1])).isEqualTo(JSON.stringify(callB.args[1]));
    assertThat(callA.args[2].outputReference).isEqualTo('meta-aaa');
    assertThat(Object.keys(callA.args[2]).indexOf('originHint')).isEqualTo(-1);
    assertThat(callB.args[2].outputReference).isEqualTo('meta-bbb');
    assertThat(Object.keys(callB.args[2]).indexOf('originHint')).isEqualTo(-1);

- name: originHint and appVersion set are both present
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = 'ios';
    mockData.appVersion = '5.1.0';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('ios');
    assertThat(call.args[2].appVersion).isEqualTo('5.1.0');
    assertThat(Object.keys(call.args[2]).indexOf('outputReference')).isEqualTo(-1);

- name: appVersion set without originHint is sent alone
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.appVersion = '  2.0.0  ';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].appVersion).isEqualTo('2.0.0');
    assertThat(Object.keys(call.args[2]).indexOf('originHint')).isEqualTo(-1);
    assertThat(Object.keys(call.args[2]).indexOf('outputReference')).isEqualTo(-1);

- name: appVersion whitespace-only omits the key
  code: |-
    mockObject('templateStorage', { getItem: function(key) { return true; }, setItem: function(key, value) {} });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [{ event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' }];
      }
    });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.originHint = 'ios';
    mockData.appVersion = '   ';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].originHint).isEqualTo('ios');
    assertThat(Object.keys(call.args[2]).indexOf('appVersion')).isEqualTo(-1);

- name: First load - the initializing instance replays the dataLayer with its own hints
  code: |-
    var storedSignature = null;
    mockObject('templateStorage', {
      getItem: function(key) { return storedSignature; },
      setItem: function(key, value) { storedSignature = value; }
    });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [
          { event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' },
          { event: 'other_event', 'gtm.uniqueEventId': 2, baz: 'qux' }
        ];
      }
      if (key === 'inspector') {
        return { load: function() {} };
      }
    });
    mock('setInWindow', function(key, value, overrideExisting) { return true; });
    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) { onSuccess(); });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-x7k2q';
    mockData.originHint = 'web';
    mockData.appVersion = '1.2.3';

    runCode(mockData);

    assertApi('injectScript').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertThat(storedSignature).isEqualTo('meta-x7k2q|web|1.2.3');
    assertThat(capturedCalls.length).isEqualTo(2);
    assertThat(capturedCalls[0].args[0]).isEqualTo('test_event');
    assertThat(capturedCalls[0].length).isEqualTo(4);
    assertThat(capturedCalls[0].args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(capturedCalls[0].args[2].originHint).isEqualTo('web');
    assertThat(capturedCalls[0].args[2].appVersion).isEqualTo('1.2.3');
    assertThat(capturedCalls[1].args[0]).isEqualTo('other_event');
    assertThat(capturedCalls[1].length).isEqualTo(4);
    assertThat(capturedCalls[1].args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(capturedCalls[1].args[2].originHint).isEqualTo('web');
    assertThat(capturedCalls[1].args[2].appVersion).isEqualTo('1.2.3');

- name: Later instance with a different hint signature observes its own triggering event
  code: |-
    var getItemCalls = 0;
    mockObject('templateStorage', {
      getItem: function(key) {
        getItemCalls = getItemCalls + 1;
        // Read 1 is the top-level check, before any instance has initialized,
        // so this instance injects the script too. By the time the script
        // calls back, another tag instance has stored ITS hint signature.
        return getItemCalls === 1 ? null : 'other-output|other-origin|9.9.9';
      },
      setItem: function(key, value) { fail('a later instance must not overwrite the stored signature'); }
    });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [
          { event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' },
          { event: 'other_event', 'gtm.uniqueEventId': 2, baz: 'qux' }
        ];
      }
      if (key === 'inspector') {
        return { load: function() {} };
      }
    });
    mock('setInWindow', function(key, value, overrideExisting) { return true; });
    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) { onSuccess(); });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = 'meta-x7k2q';
    mockData.originHint = 'web';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    // The SDK is already loaded and configured, so this instance must not
    // re-initialize it.
    assertApi('setInWindow').wasNotCalled();
    // Exactly this instance's own triggering event, with its own hints, and no
    // second replay of the dataLayer: other_event stays untouched.
    assertThat(capturedCalls.length).isEqualTo(1);
    const call = capturedCalls[0];
    assertThat(call.args[0]).isEqualTo('test_event');
    assertThat(call.length).isEqualTo(4);
    assertThat(call.args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(call.args[2].originHint).isEqualTo('web');

- name: Later instance with the same hint signature does not observe anything again
  code: |-
    var getItemCalls = 0;
    mockObject('templateStorage', {
      getItem: function(key) {
        getItemCalls = getItemCalls + 1;
        // The instance that initialized stored a signature that normalizes to
        // the same value as this instance's parameters.
        return getItemCalls === 1 ? null : 'meta-x7k2q|web|';
      },
      setItem: function(key, value) { fail('a later instance must not overwrite the stored signature'); }
    });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [
          { event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' },
          { event: 'other_event', 'gtm.uniqueEventId': 2, baz: 'qux' }
        ];
      }
      if (key === 'inspector') {
        return { load: function() {} };
      }
    });
    mock('setInWindow', function(key, value, overrideExisting) { return true; });
    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) { onSuccess(); });

    const mockData = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    mockData.outputReference = '  meta-x7k2q  ';
    mockData.originHint = 'web';

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertApi('setInWindow').wasNotCalled();
    // The dataLayer replay already covered every event with identical hints,
    // so observing anything here would double-report.
    assertThat(capturedCalls.length).isEqualTo(0);

- name: Two instances both inject before either callback runs, matching GTM's queue
  code: |-
    // The three scenarios above drive one runCode at a time and vary
    // templateStorage to stand in for the other instance. This one runs the
    // real ordering instead: GTM loads injectScript asynchronously and queues
    // every callback registered against the same cacheToken, so on a cold page
    // both instances execute their top-level code, both see empty storage, and
    // both inject before either onSuccess fires.
    var store = {};
    mockObject('templateStorage', {
      getItem: function(key) { return store[key]; },
      setItem: function(key, value) { store[key] = value; }
    });
    mock('copyFromWindow', function(key) {
      if (key === 'dataLayer') {
        return [
          { event: 'test_event', 'gtm.uniqueEventId': 1, foo: 'bar' },
          { event: 'other_event', 'gtm.uniqueEventId': 2, baz: 'qux' }
        ];
      }
      if (key === 'inspector') {
        return { load: function() {} };
      }
    });
    mock('setInWindow', function(key, value, overrideExisting) { return true; });

    // Queue the callbacks instead of running them, the way GTM does.
    var pendingCallbacks = [];
    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) {
      pendingCallbacks.push(onSuccess);
    });

    const gatewayInstance = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    gatewayInstance.outputReference = 'meta-x7k2q';
    gatewayInstance.originHint = 'web';

    const outputInstance = { eventsToExclude: '[]', eventsToInclude: '[]', propertiesToExclude: '[]', propertiesToInclude: '[]' };
    outputInstance.outputReference = 'ga4-9f3';
    outputInstance.originHint = 'web';

    runCode(gatewayInstance);
    runCode(outputInstance);

    // Both instances injected, neither callback has fired, nothing observed.
    assertThat(pendingCallbacks.length).isEqualTo(2);
    assertThat(capturedCalls.length).isEqualTo(0);

    // The script loads once and GTM drains the queue in registration order.
    pendingCallbacks[0]();
    pendingCallbacks[1]();

    // First callback initializes and replays the whole dataLayer with ITS
    // hints. Second callback finds a signature that is not its own, so it
    // observes only its own triggering event and does not replay again.
    assertThat(store['Avo Inspector Init']).isEqualTo('meta-x7k2q|web|');
    assertThat(capturedCalls.length).isEqualTo(3);

    assertThat(capturedCalls[0].args[0]).isEqualTo('test_event');
    assertThat(capturedCalls[0].args[2].outputReference).isEqualTo('meta-x7k2q');
    assertThat(capturedCalls[1].args[0]).isEqualTo('other_event');
    assertThat(capturedCalls[1].args[2].outputReference).isEqualTo('meta-x7k2q');

    // The output-level instance reports its own event under its own reference.
    // This is the assertion the feature exists for: one gateway key, two tag
    // instances on the same event, two distinct checkpoints.
    assertThat(capturedCalls[2].args[0]).isEqualTo('test_event');
    assertThat(capturedCalls[2].args[2].outputReference).isEqualTo('ga4-9f3');
    assertThat(capturedCalls[2].args[2].originHint).isEqualTo('web');

setup: |-
  // Runs before every scenario. Holds only what no scenario varies: the
  // container is not in preview mode, the tag is triggered by test_event with
  // gtm.uniqueEventId 1, and every inspector.trackSchemaFromEvent call is
  // captured in capturedCalls together with its argument count, so a scenario
  // can tell the two-argument (no hints) call from the three-argument one.
  // templateStorage and copyFromWindow stay in the scenarios: those are the
  // mocks the scenarios differ on.
  mock('getContainerVersion', function() { return { previewMode: false }; });
  mock('copyFromDataLayer', function(key) {
    if (key === 'event') return 'test_event';
    if (key === 'gtm.uniqueEventId') return 1;
  });

  var capturedCalls = [];
  mock('callInWindow', function(path, eventName, eventProperties, hints) {
    if (path !== 'inspector.trackSchemaFromEvent') { return; }
    var hasHints = hints !== undefined;
    capturedCalls.push({
      path: path,
      args: hasHints ? [eventName, eventProperties, hints] : [eventName, eventProperties],
      length: hasHints ? 4 : 3
    });
  });


___NOTES___

Created on 27/08/2023, 20:48:29



