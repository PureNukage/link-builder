{
    "id": "89956944-19e2-4086-80d2-309f3934462b",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "GameAnalyticsExt",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        "android.permission.INTERNET",
        "android.permission.ACCESS_NETWORK_STATE"
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "GameAnalyticsExt",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "GameAnalyticsExt",
    "copyToTargets": 35184372089070,
    "date": "2017-12-18 02:08:48",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "815fe17c-187f-41f7-a636-68576f58f313",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 32,
            "filename": "GameAnalytics.js",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 5,
            "order": [
                
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "f601fad4-e3c8-4730-b74d-470a34e9c01f",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "397a146a-cac9-4e88-b33b-e7a6530663a7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_ERRORSEVERITY_DEBUG",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "2429a5a6-c974-4356-90d2-578ccc8820ad",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_ERRORSEVERITY_INFO",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "d6ae6b27-ae36-4d31-96eb-66f02282d85d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_ERRORSEVERITY_WARNING",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "f97047d9-0e15-47e9-9243-b80f841aef57",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_ERRORSEVERITY_ERROR",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "1a622ddd-857d-479e-ab30-6442d9824155",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_ERRORSEVERITY_CRITICAL",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "c6dc09d4-b2e7-4a4a-b12c-6c3178632308",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_RESOURCEFLOWTYPE_SOURCE",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "ee98fb93-a95b-47cf-8d07-2dd89c636145",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_RESOURCEFLOWTYPE_SINK",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "ba1bfd6d-776c-42da-8587-7000093056a4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_GENDER_MALE",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "83ab00a7-8cd7-439f-814d-27a9cf918d14",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_GENDER_FEMALE",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "926c31d9-38de-4950-8eae-cf7eefb700a2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_PROGRESSIONSTATUS_START",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "34e35553-f231-4cda-86a8-e30e42adf313",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_PROGRESSIONSTATUS_COMPLETE",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "d66380fc-cbf7-4ab8-837a-2a2224781873",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GA_PROGRESSIONSTATUS_FAIL",
                    "hidden": false,
                    "value": "3"
                }
            ],
            "copyToTargets": 35184372089070,
            "filename": "GameAnalyticsExt.ext",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "3e3664e0-ec65-4be6-af95-653a604d7a73",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 8,
            "filename": "GameAnalyticsAndroid.ext",
            "final": "",
            "functions": [
                {
                    "id": "7956467a-8e05-429f-81fa-bedfe0067e8b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addBusinessEventWithReceipt",
                    "help": "addBusinessEventWithReceiptAndroid(currency:string, amount:double, itemType:string, itemId:string, cartType:string, receipt:string, store:string, signature:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addBusinessEventWithReceiptAndroid",
                    "returnType": 2
                },
                {
                    "id": "dc5ba5d1-e81c-4c68-86e3-066bc01b9ca3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_android(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledInfoLog_android",
                    "returnType": 2
                },
                {
                    "id": "090cf480-382f-416e-8d80-f47fed1b6495",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_android(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledVerboseLog_android",
                    "returnType": 2
                },
                {
                    "id": "7e7f668d-2f29-4b34-9dc2-9e20343d728e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions01_android",
                    "returnType": 2
                },
                {
                    "id": "03883952-b132-434d-89f6-7e42cb2b12d2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions02_android",
                    "returnType": 2
                },
                {
                    "id": "c40673b4-cee4-4e47-8878-9598d573dcee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions03_android",
                    "returnType": 2
                },
                {
                    "id": "d66c2ac4-c122-4584-8968-ee35f750ca13",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableResourceCurrencies_android",
                    "returnType": 2
                },
                {
                    "id": "e6ec7f8b-cb46-4617-a439-bed7580474af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableResourceItemTypes_android",
                    "returnType": 2
                },
                {
                    "id": "d4ace72d-61aa-48b1-b916-2576a620942a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_android(build:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureBuild_android",
                    "returnType": 2
                },
                {
                    "id": "c61edf3a-56e1-4e23-bc5b-bcb8bb11ebdb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_android(id:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureUserId_android",
                    "returnType": 2
                },
                {
                    "id": "1795d069-0e9b-4b4a-8888-87b2f7604331",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_android(key:string, secret:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "native_ga_initialize_android",
                    "returnType": 2
                },
                {
                    "id": "0f8eea6e-2164-463d-add2-a244bdd9edf2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_android(version:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureSdkGameEngineVersion_android",
                    "returnType": 2
                },
                {
                    "id": "5c026fcc-91ef-4812-ba2a-158a1fdf8e38",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_android(version:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureGameEngineVersion_android",
                    "returnType": 2
                },
                {
                    "id": "275a451d-8de0-4f86-8664-f1051bc1c267",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_android(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addProgressionEvent_android",
                    "returnType": 2
                },
                {
                    "id": "a14a02e1-8379-4599-9b3c-857bdff1499f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_android(eventId:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addDesignEvent_android",
                    "returnType": 2
                },
                {
                    "id": "600f19f9-c306-4c73-a9a9-a7c7348c50e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_android(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addDesignEventWithValue_android",
                    "returnType": 2
                },
                {
                    "id": "209b972f-86cd-4e90-8a62-2667e501677f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_android(severity:double, message:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addErrorEvent_android",
                    "returnType": 2
                },
                {
                    "id": "85730404-3ca3-410f-aef4-d602d10b7c93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_android(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledManualSessionHandling_android",
                    "returnType": 2
                },
                {
                    "id": "597150ce-233f-4bed-9a58-ae341fd954ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_android(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension01_android",
                    "returnType": 2
                },
                {
                    "id": "d17dbbc6-dac8-485b-ab4c-f5eea15567a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_android(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension02_android",
                    "returnType": 2
                },
                {
                    "id": "9947e0b2-421f-4612-9f82-c84a924853bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_android(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension03_android",
                    "returnType": 2
                },
                {
                    "id": "95f49490-802a-4430-b070-c58772d885dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_android(id:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setFacebookId_android",
                    "returnType": 2
                },
                {
                    "id": "2c70ff66-568c-4203-9d96-bb9ce7c5b431",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_android(gender:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setGender_android",
                    "returnType": 2
                },
                {
                    "id": "75d2a8b6-18ce-49db-ad9e-be3329534177",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_android(year:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setBirthYear_android",
                    "returnType": 2
                },
                {
                    "id": "5d51b40d-c26b-4ea7-bd2e-b2d64f3fb13a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "startSession",
                    "help": "startSession_android()",
                    "hidden": false,
                    "kind": 4,
                    "name": "startSession_android",
                    "returnType": 2
                },
                {
                    "id": "b908089b-0fa7-4931-bed5-e4058750d7ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "endSession",
                    "help": "endSession_android()",
                    "hidden": false,
                    "kind": 4,
                    "name": "endSession_android",
                    "returnType": 2
                },
                {
                    "id": "9d51bdbf-0b72-46e1-bcb6-a0352a00919e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addBusinessEventJson_android",
                    "returnType": 2
                },
                {
                    "id": "7bee277f-26d6-4d63-a2cd-45c58c7b347d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addResourceEventJson_android",
                    "returnType": 2
                },
                {
                    "id": "c0490bfa-ef25-47db-a608-d615b5fdc7e7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_android(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addProgressionEventWithScoreJson_android",
                    "returnType": 2
                },
                {
                    "id": "8de1f407-a9ea-4f08-8c48-8b415caedbc9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_android(key:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsValueAsString_android",
                    "returnType": 1
                },
                {
                    "id": "3b51860a-6ce0-4941-aa38-6042d52f31d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_android(key:string, defaultValue:string",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_android",
                    "returnType": 1
                },
                {
                    "id": "7998c618-5c39-468f-a483-d79fa0785f70",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_android()",
                    "hidden": false,
                    "kind": 4,
                    "name": "isRemoteConfigsReady_android",
                    "returnType": 2
                },
                {
                    "id": "2e220a2e-4d4b-45c6-b8e0-6f1a4379ab88",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_android()",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsContentAsString_android",
                    "returnType": 1
                },
                {
                    "id": "c36feef1-2c69-4cda-9a8b-a4be64e0ee18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledEventSubmission_android(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledEventSubmission_android",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 4,
            "order": [
                "7956467a-8e05-429f-81fa-bedfe0067e8b",
                "dc5ba5d1-e81c-4c68-86e3-066bc01b9ca3",
                "090cf480-382f-416e-8d80-f47fed1b6495",
                "7e7f668d-2f29-4b34-9dc2-9e20343d728e",
                "03883952-b132-434d-89f6-7e42cb2b12d2",
                "c40673b4-cee4-4e47-8878-9598d573dcee",
                "d66c2ac4-c122-4584-8968-ee35f750ca13",
                "e6ec7f8b-cb46-4617-a439-bed7580474af",
                "d4ace72d-61aa-48b1-b916-2576a620942a",
                "c61edf3a-56e1-4e23-bc5b-bcb8bb11ebdb",
                "1795d069-0e9b-4b4a-8888-87b2f7604331",
                "0f8eea6e-2164-463d-add2-a244bdd9edf2",
                "5c026fcc-91ef-4812-ba2a-158a1fdf8e38",
                "275a451d-8de0-4f86-8664-f1051bc1c267",
                "a14a02e1-8379-4599-9b3c-857bdff1499f",
                "600f19f9-c306-4c73-a9a9-a7c7348c50e2",
                "209b972f-86cd-4e90-8a62-2667e501677f",
                "85730404-3ca3-410f-aef4-d602d10b7c93",
                "597150ce-233f-4bed-9a58-ae341fd954ff",
                "d17dbbc6-dac8-485b-ab4c-f5eea15567a7",
                "9947e0b2-421f-4612-9f82-c84a924853bc",
                "95f49490-802a-4430-b070-c58772d885dd",
                "2c70ff66-568c-4203-9d96-bb9ce7c5b431",
                "75d2a8b6-18ce-49db-ad9e-be3329534177",
                "5d51b40d-c26b-4ea7-bd2e-b2d64f3fb13a",
                "b908089b-0fa7-4931-bed5-e4058750d7ae",
                "9d51bdbf-0b72-46e1-bcb6-a0352a00919e",
                "7bee277f-26d6-4d63-a2cd-45c58c7b347d",
                "c0490bfa-ef25-47db-a608-d615b5fdc7e7",
                "8de1f407-a9ea-4f08-8c48-8b415caedbc9",
                "3b51860a-6ce0-4941-aa38-6042d52f31d6",
                "7998c618-5c39-468f-a483-d79fa0785f70",
                "2e220a2e-4d4b-45c6-b8e0-6f1a4379ab88",
                "c36feef1-2c69-4cda-9a8b-a4be64e0ee18"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "b37d8fd0-b7b6-42b6-a37c-59cbf6c4f95c",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 4,
            "filename": "GameAnalyticsIOS.ext",
            "final": "",
            "functions": [
                {
                    "id": "ab51fdd2-5c62-41ff-86cc-825e1d590271",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addBusinessEventWithReceipt",
                    "help": "addBusinessEventWithReceiptIOS(currency:string, amount:double, itemType:string, itemId:string, cartType:string, receipt:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addBusinessEventWithReceiptIOS",
                    "returnType": 2
                },
                {
                    "id": "cdf18457-5c90-45b0-92d6-78135b1a5f7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addBusinessEventAndAutoFetchReceipt",
                    "help": "addBusinessEventAndAutoFetchReceipt(currency:string, amount:double, itemType:string, itemId:string, cartType:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addBusinessEventAndAutoFetchReceipt",
                    "returnType": 2
                },
                {
                    "id": "24a1d518-0faf-40e8-8406-b4f4a52bb314",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_ios(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledInfoLog_ios",
                    "returnType": 2
                },
                {
                    "id": "e9f1f0a0-b23b-4b5b-8bea-5246434bf4ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_ios(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledVerboseLog_ios",
                    "returnType": 2
                },
                {
                    "id": "1f670d94-d315-4916-a87a-005300a7465e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions01_ios",
                    "returnType": 2
                },
                {
                    "id": "ede8548c-75f4-4c64-bcda-c7810e4c561c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions01_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions02_ios",
                    "returnType": 1
                },
                {
                    "id": "db156cb6-ff7b-4f90-8ab2-3043b2509edc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableCustomDimensions03_ios",
                    "returnType": 2
                },
                {
                    "id": "b6ab8ecc-71a2-47f5-97a0-c9d639f92a21",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableResourceCurrencies_ios",
                    "returnType": 2
                },
                {
                    "id": "6ada8219-2184-4034-9083-00c27a5d4a71",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureAvailableResourceItemTypes_ios",
                    "returnType": 2
                },
                {
                    "id": "32f776e9-17a6-4183-ac77-954262999702",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_ios(build:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureBuild_ios",
                    "returnType": 2
                },
                {
                    "id": "7c97d252-7023-42aa-87c7-baf27726d917",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_ios(id:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureUserId_ios",
                    "returnType": 2
                },
                {
                    "id": "cfa35150-99c5-4d3f-97ac-72c0ca53f1bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_ios(key:string, secret:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "native_ga_initialize_ios",
                    "returnType": 2
                },
                {
                    "id": "e7aa0371-383d-465a-bba7-51fd4b3153f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_ios(version:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureSdkGameEngineVersion_ios",
                    "returnType": 2
                },
                {
                    "id": "25e55fae-e0b8-4874-a41e-bb5780c6b1a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_ios(version:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "configureGameEngineVersion_ios",
                    "returnType": 2
                },
                {
                    "id": "4724bea9-d133-4294-90cb-2bb19af60d32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_ios(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addProgressionEvent_ios",
                    "returnType": 2
                },
                {
                    "id": "e85ec790-97d7-4381-9e4b-4f60603e76eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_ios(eventId:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addDesignEvent_ios",
                    "returnType": 2
                },
                {
                    "id": "06fcc1e2-b702-405d-b725-9c19bc4a2be1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_ios(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addDesignEventWithValue_ios",
                    "returnType": 2
                },
                {
                    "id": "0a60fb41-8dc0-4833-a9ce-51489f9f7da6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_ios(severity:double, message:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addErrorEvent_ios",
                    "returnType": 2
                },
                {
                    "id": "59e04037-0e33-41fd-a37d-587e31743cf6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_ios(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledManualSessionHandling_ios",
                    "returnType": 2
                },
                {
                    "id": "bc738177-af8e-4593-a7de-2da760059d9f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_ios(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension01_ios",
                    "returnType": 2
                },
                {
                    "id": "ae687598-6cb6-4848-8b59-2e525e02fae5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_ios(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension02_ios",
                    "returnType": 2
                },
                {
                    "id": "b366062b-bacf-458f-bdff-0dffbab4bfc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_ios(dimension:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setCustomDimension03_ios",
                    "returnType": 2
                },
                {
                    "id": "7689cd20-3828-4256-ba0d-a1422af461f1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_ios(id:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setFacebookId_ios",
                    "returnType": 2
                },
                {
                    "id": "418511aa-bceb-45d0-8ac0-4b95ae650331",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_ios(gender:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setGender_ios",
                    "returnType": 2
                },
                {
                    "id": "e8209116-6b15-408c-a04f-267c8988de62",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_ios(year:double)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setBirthYear_ios",
                    "returnType": 2
                },
                {
                    "id": "886ebb4b-52c8-4654-9777-f179b121e067",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "startSession",
                    "help": "startSession_ios()",
                    "hidden": false,
                    "kind": 4,
                    "name": "startSession_ios",
                    "returnType": 2
                },
                {
                    "id": "47708037-6e60-4a31-9efd-34d7eaae4a6a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "endSession",
                    "help": "endSession_ios()",
                    "hidden": false,
                    "kind": 4,
                    "name": "endSession_ios",
                    "returnType": 2
                },
                {
                    "id": "2655cf61-d13f-4aaa-bb31-42c395005f28",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addBusinessEventJson_ios",
                    "returnType": 2
                },
                {
                    "id": "3febbd28-b5b3-4a5e-a4f1-ee9ab17ee92e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addResourceEventJson_ios",
                    "returnType": 2
                },
                {
                    "id": "83681d52-09cc-4749-80c4-6185d5cd87aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_ios(json:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "addProgressionEventWithScoreJson_ios",
                    "returnType": 2
                },
                {
                    "id": "b8b47674-c2f1-46bd-9b28-4103af685268",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_ios(key:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsValueAsString_ios",
                    "returnType": 1
                },
                {
                    "id": "b8f919a5-432b-4f06-b70a-4d47e8aad2e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_ios(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_ios",
                    "returnType": 1
                },
                {
                    "id": "724156e8-82c1-45e0-b2e5-9d55a874c95f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_ios()",
                    "hidden": false,
                    "kind": 4,
                    "name": "isRemoteConfigsReady_ios",
                    "returnType": 2
                },
                {
                    "id": "27ccf6b8-a948-4daf-8998-104a117ca17a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_ios()",
                    "hidden": false,
                    "kind": 4,
                    "name": "getRemoteConfigsContentAsString_ios",
                    "returnType": 1
                },
                {
                    "id": "53b5380f-6035-4a93-adb2-11e349d81a95",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledManualSessionHandling_ios(flag:bool)",
                    "hidden": false,
                    "kind": 4,
                    "name": "setEnabledEventSubmission_ios",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 4,
            "order": [
                "ab51fdd2-5c62-41ff-86cc-825e1d590271",
                "cdf18457-5c90-45b0-92d6-78135b1a5f7a",
                "24a1d518-0faf-40e8-8406-b4f4a52bb314",
                "e9f1f0a0-b23b-4b5b-8bea-5246434bf4ee",
                "1f670d94-d315-4916-a87a-005300a7465e",
                "ede8548c-75f4-4c64-bcda-c7810e4c561c",
                "db156cb6-ff7b-4f90-8ab2-3043b2509edc",
                "b6ab8ecc-71a2-47f5-97a0-c9d639f92a21",
                "6ada8219-2184-4034-9083-00c27a5d4a71",
                "32f776e9-17a6-4183-ac77-954262999702",
                "7c97d252-7023-42aa-87c7-baf27726d917",
                "cfa35150-99c5-4d3f-97ac-72c0ca53f1bc",
                "e7aa0371-383d-465a-bba7-51fd4b3153f8",
                "25e55fae-e0b8-4874-a41e-bb5780c6b1a1",
                "4724bea9-d133-4294-90cb-2bb19af60d32",
                "e85ec790-97d7-4381-9e4b-4f60603e76eb",
                "06fcc1e2-b702-405d-b725-9c19bc4a2be1",
                "0a60fb41-8dc0-4833-a9ce-51489f9f7da6",
                "59e04037-0e33-41fd-a37d-587e31743cf6",
                "bc738177-af8e-4593-a7de-2da760059d9f",
                "ae687598-6cb6-4848-8b59-2e525e02fae5",
                "b366062b-bacf-458f-bdff-0dffbab4bfc3",
                "7689cd20-3828-4256-ba0d-a1422af461f1",
                "418511aa-bceb-45d0-8ac0-4b95ae650331",
                "e8209116-6b15-408c-a04f-267c8988de62",
                "886ebb4b-52c8-4654-9777-f179b121e067",
                "47708037-6e60-4a31-9efd-34d7eaae4a6a",
                "2655cf61-d13f-4aaa-bb31-42c395005f28",
                "3febbd28-b5b3-4a5e-a4f1-ee9ab17ee92e",
                "83681d52-09cc-4749-80c4-6185d5cd87aa",
                "b8b47674-c2f1-46bd-9b28-4103af685268",
                "b8f919a5-432b-4f06-b70a-4d47e8aad2e5",
                "724156e8-82c1-45e0-b2e5-9d55a874c95f",
                "27ccf6b8-a948-4daf-8998-104a117ca17a",
                "53b5380f-6035-4a93-adb2-11e349d81a95"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "33139043-bffa-443f-8689-a8c7ba40f38e",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 32,
            "filename": "GameAnalyticsExt.js",
            "final": "",
            "functions": [
                {
                    "id": "8d4517c3-83fe-4171-bda8-ed5070b148fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_html(flag:bool)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setEnabledInfoLog_html",
                    "returnType": 2
                },
                {
                    "id": "32833320-db8d-4987-bef7-e69586bdd5d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_html(flag:bool)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setEnabledVerboseLog_html",
                    "returnType": 2
                },
                {
                    "id": "759a45a2-3e79-4df4-9af5-dc163ce199e7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureAvailableCustomDimensions01_html",
                    "returnType": 2
                },
                {
                    "id": "b5a72666-c433-4445-bd4b-62043f09fda0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureAvailableCustomDimensions02_html",
                    "returnType": 2
                },
                {
                    "id": "b7f48d7a-ad5a-4c20-a649-e78691f1cfc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureAvailableCustomDimensions03_html",
                    "returnType": 2
                },
                {
                    "id": "58b531ff-52ce-41f7-8394-7221c734a85c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureAvailableResourceCurrencies_html",
                    "returnType": 2
                },
                {
                    "id": "e054d9f0-25f5-4866-9437-657955e2063b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureAvailableResourceItemTypes_html",
                    "returnType": 2
                },
                {
                    "id": "84ab7f1d-ddac-4a42-9d03-3b8217ce0010",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_html(build:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureBuild_html",
                    "returnType": 1
                },
                {
                    "id": "45782cf6-a108-429c-880a-ec440756f7a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId(id:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureUserId_html",
                    "returnType": 2
                },
                {
                    "id": "82cf237b-09fc-471c-8e61-c70ede83e750",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_html(key:string, secret:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "native_ga_initialize_html",
                    "returnType": 2
                },
                {
                    "id": "ecb3b25c-7c44-4585-8b26-610528458809",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_html(version:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureSdkGameEngineVersion_html",
                    "returnType": 2
                },
                {
                    "id": "981acbae-5162-46ee-8997-dc66c7482945",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_html(version:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "configureGameEngineVersion_html",
                    "returnType": 2
                },
                {
                    "id": "c6ad809b-8e51-4adf-95e7-84d468ba560c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_html(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addProgressionEvent_html",
                    "returnType": 2
                },
                {
                    "id": "20d08410-cda4-40cc-a1e7-ad32f2ce9e3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_html(eventId:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addDesignEvent_html",
                    "returnType": 2
                },
                {
                    "id": "59cf3eb6-e076-4023-b770-bbe812117e69",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addDesignEventWithValue_html",
                    "returnType": 2
                },
                {
                    "id": "aab5655a-868e-49c0-8e9e-982fbd0e5b34",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_html(severity:double, message:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addErrorEvent_html",
                    "returnType": 2
                },
                {
                    "id": "23b80fde-340f-4bd1-bfcb-1a27364651a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_html(flag:bool)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setEnabledManualSessionHandling_html",
                    "returnType": 2
                },
                {
                    "id": "42f997d2-20f6-416a-a0df-0f7be8d9a46c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_html(dimension:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setCustomDimension01_html",
                    "returnType": 2
                },
                {
                    "id": "4a11165d-fc7a-4685-b7e5-083603445c60",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_html(dimension:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setCustomDimension02_html",
                    "returnType": 2
                },
                {
                    "id": "e35cb266-441b-4d0f-9d8f-e4f14e8c0ccb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_html(dimension:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setCustomDimension03_html",
                    "returnType": 2
                },
                {
                    "id": "fd0310b4-6977-4e6d-b754-4ea9a06b4303",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId(id:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setFacebookId_html",
                    "returnType": 2
                },
                {
                    "id": "47290d2c-3fa0-4a4c-b2fc-64318b91607d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_html(gender:double)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setGender_html",
                    "returnType": 2
                },
                {
                    "id": "1021b2fb-39cd-4b1c-92f0-814c110671ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_html(year:double)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setBirthYear_html",
                    "returnType": 2
                },
                {
                    "id": "47665034-59ac-4e22-afa1-f061654d343d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "startSession",
                    "help": "startSession_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "startSession_html",
                    "returnType": 2
                },
                {
                    "id": "7247c8d8-81dc-406f-a3b5-08341be88d74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "endSession",
                    "help": "endSession_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "endSession_html",
                    "returnType": 2
                },
                {
                    "id": "238a76e5-7a5f-46cc-9f55-e2762f1dfc9c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onStop",
                    "help": "onStop_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "onStop_html",
                    "returnType": 2
                },
                {
                    "id": "5b0281ad-7bc6-4eca-9eb9-52234886a853",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onResume",
                    "help": "onResume_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "onResume_html",
                    "returnType": 2
                },
                {
                    "id": "c39f6982-e511-4733-80d2-b0d01217846f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addBusinessEventJson_html",
                    "returnType": 2
                },
                {
                    "id": "204ece19-45df-417f-a554-3deeb649005d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addResourceEventJson_html",
                    "returnType": 2
                },
                {
                    "id": "15df41d8-b851-43d3-a0cc-1222851c7bd9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_html(json:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "addProgressionEventWithScoreJson_html",
                    "returnType": 2
                },
                {
                    "id": "5af38b66-0ca2-4f04-89d5-f511ba99789a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_html(key:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "getRemoteConfigsValueAsString_html",
                    "returnType": 1
                },
                {
                    "id": "8775a739-658e-48f7-9437-65867b0f7bc0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_html(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 5,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_html",
                    "returnType": 1
                },
                {
                    "id": "91f72cfc-b2c3-4b97-a9e3-5eca79d47cf2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "isRemoteConfigsReady_html",
                    "returnType": 2
                },
                {
                    "id": "09de9e89-05c8-4824-8606-0b1d06b09a73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_html()",
                    "hidden": false,
                    "kind": 5,
                    "name": "getRemoteConfigsContentAsString_html",
                    "returnType": 1
                },
                {
                    "id": "1cf3d2f8-7ce3-43c8-8a28-ef676ea2071a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledEventSubmission_html(flag:bool)",
                    "hidden": false,
                    "kind": 5,
                    "name": "setEnabledEventSubmission_html",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 5,
            "order": [
                "8d4517c3-83fe-4171-bda8-ed5070b148fc",
                "32833320-db8d-4987-bef7-e69586bdd5d3",
                "759a45a2-3e79-4df4-9af5-dc163ce199e7",
                "b5a72666-c433-4445-bd4b-62043f09fda0",
                "b7f48d7a-ad5a-4c20-a649-e78691f1cfc3",
                "58b531ff-52ce-41f7-8394-7221c734a85c",
                "e054d9f0-25f5-4866-9437-657955e2063b",
                "84ab7f1d-ddac-4a42-9d03-3b8217ce0010",
                "45782cf6-a108-429c-880a-ec440756f7a0",
                "82cf237b-09fc-471c-8e61-c70ede83e750",
                "ecb3b25c-7c44-4585-8b26-610528458809",
                "981acbae-5162-46ee-8997-dc66c7482945",
                "c6ad809b-8e51-4adf-95e7-84d468ba560c",
                "20d08410-cda4-40cc-a1e7-ad32f2ce9e3a",
                "59cf3eb6-e076-4023-b770-bbe812117e69",
                "aab5655a-868e-49c0-8e9e-982fbd0e5b34",
                "23b80fde-340f-4bd1-bfcb-1a27364651a1",
                "42f997d2-20f6-416a-a0df-0f7be8d9a46c",
                "4a11165d-fc7a-4685-b7e5-083603445c60",
                "e35cb266-441b-4d0f-9d8f-e4f14e8c0ccb",
                "fd0310b4-6977-4e6d-b754-4ea9a06b4303",
                "47290d2c-3fa0-4a4c-b2fc-64318b91607d",
                "1021b2fb-39cd-4b1c-92f0-814c110671ac",
                "47665034-59ac-4e22-afa1-f061654d343d",
                "7247c8d8-81dc-406f-a3b5-08341be88d74",
                "238a76e5-7a5f-46cc-9f55-e2762f1dfc9c",
                "5b0281ad-7bc6-4eca-9eb9-52234886a853",
                "c39f6982-e511-4733-80d2-b0d01217846f",
                "204ece19-45df-417f-a554-3deeb649005d",
                "15df41d8-b851-43d3-a0cc-1222851c7bd9",
                "5af38b66-0ca2-4f04-89d5-f511ba99789a",
                "8775a739-658e-48f7-9437-65867b0f7bc0",
                "91f72cfc-b2c3-4b97-a9e3-5eca79d47cf2",
                "09de9e89-05c8-4824-8606-0b1d06b09a73",
                "1cf3d2f8-7ce3-43c8-8a28-ef676ea2071a"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "7bb0dc52-0269-4ac4-894b-2087a0089b9e",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 2,
            "filename": "libGameAnalytics.dylib",
            "final": "",
            "functions": [
                {
                    "id": "f0317bed-e51f-4321-8982-bfa696f1c9b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_mac(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledInfoLog_mac",
                    "returnType": 2
                },
                {
                    "id": "1c2a2ea4-3c3c-4062-994e-6e1372ce72ef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_mac(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledVerboseLog_mac",
                    "returnType": 2
                },
                {
                    "id": "8dfb1aa4-aee4-44bc-9581-5be1400895df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions01_mac",
                    "returnType": 2
                },
                {
                    "id": "26ba44f4-236b-4134-9a7b-edd2f6310a06",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions02_mac",
                    "returnType": 2
                },
                {
                    "id": "934e0d99-d74a-4798-9c63-f6b2b2256dc5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions03_mac",
                    "returnType": 2
                },
                {
                    "id": "efec75da-ee49-44aa-8b52-fca84f956520",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceCurrencies_mac",
                    "returnType": 2
                },
                {
                    "id": "d8c06cd2-5828-46f4-993d-e08d94ac6f9e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceItemTypes_mac",
                    "returnType": 2
                },
                {
                    "id": "163c5996-d3e6-4138-a515-8ea9c72a23f1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_mac(build:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureBuild_mac",
                    "returnType": 2
                },
                {
                    "id": "8e2a903b-b4f5-478d-b236-b8cbe367fd3f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_mac(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureUserId_mac",
                    "returnType": 2
                },
                {
                    "id": "e8a24ef6-44a5-488a-9435-a8aca64b99d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize(key:string, secret:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "native_ga_initialize_mac",
                    "returnType": 2
                },
                {
                    "id": "1d8c5203-8565-43fc-8d04-5b91d82e4871",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_mac(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureSdkGameEngineVersion_mac",
                    "returnType": 1
                },
                {
                    "id": "0d70a578-b593-4526-8bd2-0e849a4d74f5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_mac(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureGameEngineVersion_mac",
                    "returnType": 2
                },
                {
                    "id": "9ad170f4-f6b5-432f-8e1f-6ac81ffcebe5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_mac(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEvent_mac",
                    "returnType": 2
                },
                {
                    "id": "a2cf26b2-02f2-4cf1-a3b5-97de111b64a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_mac(eventId:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEvent_mac",
                    "returnType": 2
                },
                {
                    "id": "552b1486-11a3-4a25-966e-3047adcace64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_mac(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEventWithValue_mac",
                    "returnType": 2
                },
                {
                    "id": "0b4be90c-ae1c-419b-82d5-21a7755a901b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent(severity:double, message:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addErrorEvent_mac",
                    "returnType": 2
                },
                {
                    "id": "d295d6a4-d8a3-4089-a887-92762647e609",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_mac(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledManualSessionHandling_mac",
                    "returnType": 2
                },
                {
                    "id": "880c118f-d4d6-4327-8559-05e5637e8187",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_mac(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension01_mac",
                    "returnType": 2
                },
                {
                    "id": "0fd01abd-a43c-4017-bee4-bccbb1d697a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_mac(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension02_mac",
                    "returnType": 2
                },
                {
                    "id": "f74990d8-8143-41c1-917e-108839dbc924",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_mac(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension03_mac",
                    "returnType": 2
                },
                {
                    "id": "305a4549-b567-4fde-89be-e3246ac2b927",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_mac(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setFacebookId_mac",
                    "returnType": 2
                },
                {
                    "id": "26cfd874-b2e3-46a0-bd5f-928d1926c6f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_mac(gender:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setGender_mac",
                    "returnType": 2
                },
                {
                    "id": "a1298ecf-6aef-49df-94a1-bd7b90284457",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_mac(year:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setBirthYear_mac",
                    "returnType": 2
                },
                {
                    "id": "afacb1c4-b7b2-4ff6-99f1-66c19d00548b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsStartSession",
                    "help": "startSession_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "startSession_mac",
                    "returnType": 2
                },
                {
                    "id": "aaac9ebc-6dc8-40d3-a38b-06b6ac302ca0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsEndSession",
                    "help": "endSession_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "endSession_mac",
                    "returnType": 2
                },
                {
                    "id": "d9fc0aa6-93db-48c7-8c42-242508fc5068",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onQuit",
                    "help": "onStop_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onStop_mac",
                    "returnType": 2
                },
                {
                    "id": "26ced540-c733-4e7a-b0b3-4e7000675b01",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onResume",
                    "help": "onResume_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onResume_mac",
                    "returnType": 2
                },
                {
                    "id": "92679658-bc6a-4fc4-8064-8ce0697e894a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addBusinessEventJson_mac",
                    "returnType": 2
                },
                {
                    "id": "4496e132-5f46-4e27-8f6c-5b25b8a72e65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addResourceEventJson_mac",
                    "returnType": 2
                },
                {
                    "id": "2daf5744-cc0b-427c-b32a-9d20e346b159",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_mac(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEventWithScoreJson_mac",
                    "returnType": 2
                },
                {
                    "id": "b414ab92-814b-4c3a-9211-62bdd01dcf4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_mac(key:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsString_mac",
                    "returnType": 1
                },
                {
                    "id": "d845f4f6-a5c1-4fe1-8900-ac023dc793d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "GameAnalyticsExt_Function32",
                    "returnType": 1
                },
                {
                    "id": "7ed8f4ce-629a-4972-9760-50e80889d7a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_mac(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_mac",
                    "returnType": 1
                },
                {
                    "id": "c80d9c95-ed5e-4026-ae88-0744aac44eb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "isRemoteConfigsReady_mac",
                    "returnType": 2
                },
                {
                    "id": "83df6bb9-2a79-46a0-9026-a4d6ca89a667",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_mac()",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsContentAsString_mac",
                    "returnType": 1
                },
                {
                    "id": "abd0b52e-fda5-4a10-a161-509da444d215",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledEventSubmission_mac(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledEventSubmission_mac",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "f0317bed-e51f-4321-8982-bfa696f1c9b5",
                "1c2a2ea4-3c3c-4062-994e-6e1372ce72ef",
                "8dfb1aa4-aee4-44bc-9581-5be1400895df",
                "26ba44f4-236b-4134-9a7b-edd2f6310a06",
                "934e0d99-d74a-4798-9c63-f6b2b2256dc5",
                "efec75da-ee49-44aa-8b52-fca84f956520",
                "d8c06cd2-5828-46f4-993d-e08d94ac6f9e",
                "163c5996-d3e6-4138-a515-8ea9c72a23f1",
                "8e2a903b-b4f5-478d-b236-b8cbe367fd3f",
                "e8a24ef6-44a5-488a-9435-a8aca64b99d9",
                "1d8c5203-8565-43fc-8d04-5b91d82e4871",
                "0d70a578-b593-4526-8bd2-0e849a4d74f5",
                "9ad170f4-f6b5-432f-8e1f-6ac81ffcebe5",
                "a2cf26b2-02f2-4cf1-a3b5-97de111b64a8",
                "552b1486-11a3-4a25-966e-3047adcace64",
                "0b4be90c-ae1c-419b-82d5-21a7755a901b",
                "d295d6a4-d8a3-4089-a887-92762647e609",
                "880c118f-d4d6-4327-8559-05e5637e8187",
                "0fd01abd-a43c-4017-bee4-bccbb1d697a3",
                "f74990d8-8143-41c1-917e-108839dbc924",
                "305a4549-b567-4fde-89be-e3246ac2b927",
                "26cfd874-b2e3-46a0-bd5f-928d1926c6f3",
                "a1298ecf-6aef-49df-94a1-bd7b90284457",
                "afacb1c4-b7b2-4ff6-99f1-66c19d00548b",
                "aaac9ebc-6dc8-40d3-a38b-06b6ac302ca0",
                "d9fc0aa6-93db-48c7-8c42-242508fc5068",
                "26ced540-c733-4e7a-b0b3-4e7000675b01",
                "92679658-bc6a-4fc4-8064-8ce0697e894a",
                "4496e132-5f46-4e27-8f6c-5b25b8a72e65",
                "2daf5744-cc0b-427c-b32a-9d20e346b159",
                "b414ab92-814b-4c3a-9211-62bdd01dcf4e",
                "d845f4f6-a5c1-4fe1-8900-ac023dc793d6",
                "7ed8f4ce-629a-4972-9760-50e80889d7a0",
                "c80d9c95-ed5e-4026-ae88-0744aac44eb3",
                "83df6bb9-2a79-46a0-9026-a4d6ca89a667",
                "abd0b52e-fda5-4a10-a161-509da444d215"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "b4360a5d-f22e-4199-a5d4-92b7edfba6eb",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 64,
            "filename": "GameAnalytics.dll",
            "final": "",
            "functions": [
                {
                    "id": "67fab848-6a05-417f-a709-86749e0575a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_windows(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledInfoLog_windows",
                    "returnType": 2
                },
                {
                    "id": "6ad4f172-d587-4ace-9571-85c3509b3adb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_windows(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledVerboseLog_windows",
                    "returnType": 2
                },
                {
                    "id": "7d34b5cc-4581-48b0-9c37-ac60222997f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions01_windows",
                    "returnType": 2
                },
                {
                    "id": "3bbe716b-015d-48ad-abd7-696a9abc3bf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions02_windows",
                    "returnType": 2
                },
                {
                    "id": "09b4e5f6-2701-48cf-a410-fba563c4a368",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions03_windows",
                    "returnType": 2
                },
                {
                    "id": "3edad644-23c5-451b-ad57-052684c5831f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceCurrencies_windows",
                    "returnType": 2
                },
                {
                    "id": "783da68d-d872-4915-8277-04eab21b9a1e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceItemTypes_windows",
                    "returnType": 2
                },
                {
                    "id": "42bdd2b9-3ad0-4062-8899-1a70db39aec1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_windows(build:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureBuild_windows",
                    "returnType": 2
                },
                {
                    "id": "21e28031-67fd-465a-aaac-92783b44b3ee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_windows(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureUserId_windows",
                    "returnType": 2
                },
                {
                    "id": "9f410760-6937-4be9-8794-3e415b2da38a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_windows(key:string, secret:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "native_ga_initialize_windows",
                    "returnType": 2
                },
                {
                    "id": "13f9bcde-23a4-4d7a-b204-f4400dd28461",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_windows(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureSdkGameEngineVersion_windows",
                    "returnType": 2
                },
                {
                    "id": "33e9f039-2e0b-48e9-ad99-78f686f7be82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_windows(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureGameEngineVersion_windows",
                    "returnType": 2
                },
                {
                    "id": "375cad3b-a901-4429-9989-57069eaab3ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_windows(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEvent_windows",
                    "returnType": 2
                },
                {
                    "id": "b9640eeb-9e1e-4c87-9901-377d0479dd0a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_windows(eventId:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEvent_windows",
                    "returnType": 2
                },
                {
                    "id": "b83ea08d-82b2-44ed-9fc9-5acbd08420f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_windows(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEventWithValue_windows",
                    "returnType": 2
                },
                {
                    "id": "3ae35e91-c4a2-4662-bff2-d01df9590721",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_windows(severity:double, message:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addErrorEvent_windows",
                    "returnType": 2
                },
                {
                    "id": "ee62f72f-bf88-4d65-8131-9cae540c4441",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_windows(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledManualSessionHandling_windows",
                    "returnType": 2
                },
                {
                    "id": "57484f03-78f5-47b5-83d5-e5c3ecc6148a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_windows(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension01_windows",
                    "returnType": 2
                },
                {
                    "id": "80e3c106-b5a6-4955-9110-ec01e4c9bd38",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_windows(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension02_windows",
                    "returnType": 2
                },
                {
                    "id": "b816d0e3-22b3-4ab6-9da9-eb9ae437c7ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_windows(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension03_windows",
                    "returnType": 2
                },
                {
                    "id": "53a93653-7ace-40da-a0a3-eed8014d3e2c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_windows(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setFacebookId_windows",
                    "returnType": 2
                },
                {
                    "id": "c4f81f2b-dc20-4ad4-b30f-50128ab35965",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_windows(gender:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setGender_windows",
                    "returnType": 2
                },
                {
                    "id": "194c1ecd-c4bf-4a75-a487-faa02ac3a3d2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_windows(year:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setBirthYear_windows",
                    "returnType": 2
                },
                {
                    "id": "94170a16-0c2e-4bad-ad80-deb0e8ec2597",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsStartSession",
                    "help": "startSession_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "startSession_windows",
                    "returnType": 2
                },
                {
                    "id": "3c298a30-15d2-4c3f-8df6-4e8d8622ec86",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsEndSession",
                    "help": "endSession_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "endSession_windows",
                    "returnType": 2
                },
                {
                    "id": "4ffe52b5-8c0f-4075-aadd-8780b61ebbb7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onQuit",
                    "help": "onStop_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onStop_windows",
                    "returnType": 2
                },
                {
                    "id": "6db5f2b8-45bf-44f0-8153-caecd0de2248",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onResume",
                    "help": "onResume_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onResume_windows",
                    "returnType": 2
                },
                {
                    "id": "81615a02-417d-4043-96cd-acaabb1c1096",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addBusinessEventJson_windows",
                    "returnType": 2
                },
                {
                    "id": "d3eff5bb-37df-4220-ac04-3069f23348e3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addResourceEventJson_windows",
                    "returnType": 2
                },
                {
                    "id": "de078132-6d78-4584-b309-8065efc548f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_windows(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEventWithScoreJson_windows",
                    "returnType": 2
                },
                {
                    "id": "f2426575-cc0c-4b99-81d4-98fba4110ec3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_windows(key:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsString_windows",
                    "returnType": 1
                },
                {
                    "id": "2962769e-6c33-49aa-ba9b-eefd7f8a951d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_windows(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_windows",
                    "returnType": 1
                },
                {
                    "id": "4f8d2047-84d5-4dbb-8d5a-99b83813cc27",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "isRemoteConfigsReady_windows",
                    "returnType": 2
                },
                {
                    "id": "9ec5aa4f-2615-402e-a401-28e50028d2ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_windows()",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsContentAsString_windows",
                    "returnType": 1
                },
                {
                    "id": "c3c51a61-9935-4be0-a47f-c4378b667b79",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledEventSubmission_windows(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledEventSubmission_windows",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "67fab848-6a05-417f-a709-86749e0575a3",
                "6ad4f172-d587-4ace-9571-85c3509b3adb",
                "7d34b5cc-4581-48b0-9c37-ac60222997f9",
                "3bbe716b-015d-48ad-abd7-696a9abc3bf5",
                "09b4e5f6-2701-48cf-a410-fba563c4a368",
                "3edad644-23c5-451b-ad57-052684c5831f",
                "783da68d-d872-4915-8277-04eab21b9a1e",
                "42bdd2b9-3ad0-4062-8899-1a70db39aec1",
                "21e28031-67fd-465a-aaac-92783b44b3ee",
                "9f410760-6937-4be9-8794-3e415b2da38a",
                "13f9bcde-23a4-4d7a-b204-f4400dd28461",
                "33e9f039-2e0b-48e9-ad99-78f686f7be82",
                "375cad3b-a901-4429-9989-57069eaab3ec",
                "b9640eeb-9e1e-4c87-9901-377d0479dd0a",
                "b83ea08d-82b2-44ed-9fc9-5acbd08420f9",
                "3ae35e91-c4a2-4662-bff2-d01df9590721",
                "ee62f72f-bf88-4d65-8131-9cae540c4441",
                "57484f03-78f5-47b5-83d5-e5c3ecc6148a",
                "80e3c106-b5a6-4955-9110-ec01e4c9bd38",
                "b816d0e3-22b3-4ab6-9da9-eb9ae437c7ac",
                "53a93653-7ace-40da-a0a3-eed8014d3e2c",
                "c4f81f2b-dc20-4ad4-b30f-50128ab35965",
                "194c1ecd-c4bf-4a75-a487-faa02ac3a3d2",
                "94170a16-0c2e-4bad-ad80-deb0e8ec2597",
                "3c298a30-15d2-4c3f-8df6-4e8d8622ec86",
                "4ffe52b5-8c0f-4075-aadd-8780b61ebbb7",
                "6db5f2b8-45bf-44f0-8153-caecd0de2248",
                "81615a02-417d-4043-96cd-acaabb1c1096",
                "d3eff5bb-37df-4220-ac04-3069f23348e3",
                "de078132-6d78-4584-b309-8065efc548f9",
                "f2426575-cc0c-4b99-81d4-98fba4110ec3",
                "2962769e-6c33-49aa-ba9b-eefd7f8a951d",
                "4f8d2047-84d5-4dbb-8d5a-99b83813cc27",
                "9ec5aa4f-2615-402e-a401-28e50028d2ae",
                "c3c51a61-9935-4be0-a47f-c4378b667b79"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "e79cb6b6-34bf-473c-ab20-0b5dab2e4567",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 35184372088832,
            "filename": "GameAnalytics.UWP.dll",
            "final": "",
            "functions": [
                {
                    "id": "e2c8a259-7b94-4049-a1ee-baa45d87c6b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_uwp(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledInfoLog_uwp",
                    "returnType": 2
                },
                {
                    "id": "1cf308d4-4b96-4043-b224-48b5630b7d31",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog_uwp(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledVerboseLog_uwp",
                    "returnType": 2
                },
                {
                    "id": "ed12c581-48f3-4075-8ccd-3c9663980c5c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions01_uwp",
                    "returnType": 2
                },
                {
                    "id": "63553be6-b7f1-4089-9a87-5beb2bbd951c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions02_uwp",
                    "returnType": 2
                },
                {
                    "id": "d2d41e51-619b-45ef-8cc1-536b486f5074",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions03_uwp",
                    "returnType": 2
                },
                {
                    "id": "b27c9468-f906-423e-8539-d3effed27a4e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceCurrencies_uwp",
                    "returnType": 2
                },
                {
                    "id": "dc3b1ae1-f9bc-4ac1-a8d1-2c2a928fb293",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceItemTypes_uwp",
                    "returnType": 2
                },
                {
                    "id": "0f45054a-bf11-431d-b841-15106ec5622c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_uwp(build:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureBuild_uwp",
                    "returnType": 2
                },
                {
                    "id": "f8449874-5bc0-4131-a944-9091bfe07be8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_uwp(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureUserId_uwp",
                    "returnType": 2
                },
                {
                    "id": "dde2411d-1d23-41f8-85ab-e0453e494a92",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_uwp(key:string, secret:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "native_ga_initialize_uwp",
                    "returnType": 2
                },
                {
                    "id": "3b8e5d03-1ed0-4777-a87c-b367f3106d31",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_uwp(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureSdkGameEngineVersion_uwp",
                    "returnType": 2
                },
                {
                    "id": "820da882-45f0-44f8-b5c1-9c3c4b14cd61",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_uwp(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureGameEngineVersion_uwp",
                    "returnType": 2
                },
                {
                    "id": "3ad0a888-ed15-4429-b0bd-f05e6cfe6f6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_uwp(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEvent_uwp",
                    "returnType": 2
                },
                {
                    "id": "29a8513a-ac3a-4985-8765-00c9190c3d0e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_uwp(eventId:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEvent_uwp",
                    "returnType": 2
                },
                {
                    "id": "0a6d239a-9bfa-484b-9b2a-8cabc01d8503",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_uwp(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEventWithValue_uwp",
                    "returnType": 2
                },
                {
                    "id": "e92d0c38-f890-4733-8d7c-b4202ee65ea5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_uwp(severity:double, message:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addErrorEvent_uwp",
                    "returnType": 2
                },
                {
                    "id": "422eb2af-9830-4fda-94aa-5fe014e3592e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_uwp(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledManualSessionHandling_uwp",
                    "returnType": 2
                },
                {
                    "id": "32600924-a4be-4eea-9703-249ebc354cbf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_uwp(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension01_uwp",
                    "returnType": 2
                },
                {
                    "id": "e60b15c1-3105-476e-9642-2ce5a0f05e2c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_uwp(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension02_uwp",
                    "returnType": 2
                },
                {
                    "id": "f5f39556-28aa-4381-83e5-d21bff5bdc66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_uwp(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension03_uwp",
                    "returnType": 2
                },
                {
                    "id": "05b57ef3-8d8d-410e-9401-2bc67c51d098",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_uwp(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setFacebookId_uwp",
                    "returnType": 2
                },
                {
                    "id": "a44cf8a7-5873-459d-bc23-7f515e0a5ddd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_uwp(gender:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setGender_uwp",
                    "returnType": 2
                },
                {
                    "id": "9934aac7-0e76-4654-bc50-7ad69f79a41c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_uwp(year:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setBirthYear_uwp",
                    "returnType": 2
                },
                {
                    "id": "9a86d823-f032-43aa-a32b-37f69e28553b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsStartSession",
                    "help": "startSession_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "startSession_uwp",
                    "returnType": 2
                },
                {
                    "id": "c28d08c2-aecb-43c5-8157-47c19759ce81",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsEndSession",
                    "help": "endSession_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "endSession_uwp",
                    "returnType": 2
                },
                {
                    "id": "b143ec8f-1834-494d-835e-d1f044da85e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onQuit",
                    "help": "onStop_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onStop_uwp",
                    "returnType": 2
                },
                {
                    "id": "1813a315-f2be-404c-8ca8-fdc45aa9c9af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onResume",
                    "help": "onResume_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onResume_uwp",
                    "returnType": 1
                },
                {
                    "id": "dd141745-11fd-4ee5-aa23-87e7f30c46ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addBusinessEventJson_uwp",
                    "returnType": 2
                },
                {
                    "id": "e9d8c5a2-62bc-49c0-b569-c6ce18b55593",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_uwp(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addResourceEventJson_uwp",
                    "returnType": 2
                },
                {
                    "id": "803a004c-93f0-45f9-88ca-e2472f3b73f4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEventWithScoreJson_uwp",
                    "returnType": 2
                },
                {
                    "id": "17cb0f01-f46b-44ba-956f-feef06983d82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_uwp(key:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsString_uwp",
                    "returnType": 1
                },
                {
                    "id": "3458ffb5-8691-4cc4-9744-b41184226ee6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_uwp(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_uwp",
                    "returnType": 1
                },
                {
                    "id": "dcc5927c-4f5c-4b9d-8d81-2e97d4fea393",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "isRemoteConfigsReady_uwp",
                    "returnType": 2
                },
                {
                    "id": "78a8ffdf-c485-4ca7-9a8f-fc51fba0acd4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_uwp()",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsContentAsString_uwp",
                    "returnType": 1
                },
                {
                    "id": "987eaca6-cb39-4d25-b220-3afa9539876f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSumission",
                    "help": "setEnabledEventSubmission_uwp(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledEventSubmission_uwp",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "e2c8a259-7b94-4049-a1ee-baa45d87c6b8",
                "1cf308d4-4b96-4043-b224-48b5630b7d31",
                "ed12c581-48f3-4075-8ccd-3c9663980c5c",
                "63553be6-b7f1-4089-9a87-5beb2bbd951c",
                "d2d41e51-619b-45ef-8cc1-536b486f5074",
                "b27c9468-f906-423e-8539-d3effed27a4e",
                "dc3b1ae1-f9bc-4ac1-a8d1-2c2a928fb293",
                "0f45054a-bf11-431d-b841-15106ec5622c",
                "f8449874-5bc0-4131-a944-9091bfe07be8",
                "dde2411d-1d23-41f8-85ab-e0453e494a92",
                "3b8e5d03-1ed0-4777-a87c-b367f3106d31",
                "820da882-45f0-44f8-b5c1-9c3c4b14cd61",
                "3ad0a888-ed15-4429-b0bd-f05e6cfe6f6d",
                "29a8513a-ac3a-4985-8765-00c9190c3d0e",
                "0a6d239a-9bfa-484b-9b2a-8cabc01d8503",
                "e92d0c38-f890-4733-8d7c-b4202ee65ea5",
                "422eb2af-9830-4fda-94aa-5fe014e3592e",
                "32600924-a4be-4eea-9703-249ebc354cbf",
                "e60b15c1-3105-476e-9642-2ce5a0f05e2c",
                "f5f39556-28aa-4381-83e5-d21bff5bdc66",
                "05b57ef3-8d8d-410e-9401-2bc67c51d098",
                "a44cf8a7-5873-459d-bc23-7f515e0a5ddd",
                "9934aac7-0e76-4654-bc50-7ad69f79a41c",
                "9a86d823-f032-43aa-a32b-37f69e28553b",
                "c28d08c2-aecb-43c5-8157-47c19759ce81",
                "b143ec8f-1834-494d-835e-d1f044da85e2",
                "1813a315-f2be-404c-8ca8-fdc45aa9c9af",
                "dd141745-11fd-4ee5-aa23-87e7f30c46ab",
                "e9d8c5a2-62bc-49c0-b569-c6ce18b55593",
                "803a004c-93f0-45f9-88ca-e2472f3b73f4",
                "17cb0f01-f46b-44ba-956f-feef06983d82",
                "3458ffb5-8691-4cc4-9744-b41184226ee6",
                "dcc5927c-4f5c-4b9d-8d81-2e97d4fea393",
                "78a8ffdf-c485-4ca7-9a8f-fc51fba0acd4",
                "987eaca6-cb39-4d25-b220-3afa9539876f"
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "4433624f-f6c7-44a9-b453-1e120939a95f",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 128,
            "filename": "libGameAnalytics.so",
            "final": "",
            "functions": [
                {
                    "id": "b8e2d7ac-967d-4928-875c-6abdbc0a81f6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledInfoLog",
                    "help": "setEnabledInfoLog_linux(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledInfoLog_linux",
                    "returnType": 2
                },
                {
                    "id": "c372ab50-86e9-478e-955d-1e2212462288",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledVerboseLog",
                    "help": "setEnabledVerboseLog(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledVerboseLog_linux",
                    "returnType": 2
                },
                {
                    "id": "9b339d14-8a80-44fa-9902-cc795786119b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions01",
                    "help": "configureAvailableCustomDimensions01_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions01_linux",
                    "returnType": 2
                },
                {
                    "id": "55c37f90-5a58-4aa7-880c-417905d3b4c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableCustomDimensions02",
                    "help": "configureAvailableCustomDimensions02_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions02_linux",
                    "returnType": 2
                },
                {
                    "id": "60b3eeb1-2cb6-479d-a592-1ed454724dd7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "configureAvailableCustomDimensions03",
                    "help": "configureAvailableCustomDimensions03_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableCustomDimensions03_linux",
                    "returnType": 1
                },
                {
                    "id": "1774760b-c7f3-43e1-ab90-53a6735800d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceCurrencies",
                    "help": "configureAvailableResourceCurrencies_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceCurrencies_linux",
                    "returnType": 2
                },
                {
                    "id": "856910ba-1d10-4ee8-9873-e936444f4848",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureAvailableResourceItemTypes",
                    "help": "configureAvailableResourceItemTypes_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureAvailableResourceItemTypes_linux",
                    "returnType": 2
                },
                {
                    "id": "61ce866b-3cb7-4ad7-b4ce-e47215cf7e3d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureBuild",
                    "help": "configureBuild_linux(build:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureBuild_linux",
                    "returnType": 2
                },
                {
                    "id": "767f8b88-3265-4f8f-8182-196ee6d303f8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureUserId",
                    "help": "configureUserId_linux(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureUserId_linux",
                    "returnType": 2
                },
                {
                    "id": "1975c61c-cee3-4801-9d94-7926bbed0876",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "initialize",
                    "help": "native_ga_initialize_linux(key:string, secret:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "native_ga_initialize_linux",
                    "returnType": 2
                },
                {
                    "id": "490bed7e-93b7-4d2d-9289-eef3151987a2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureSdkGameEngineVersion",
                    "help": "configureSdkGameEngineVersion_linux(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureSdkGameEngineVersion_linux",
                    "returnType": 2
                },
                {
                    "id": "0fa476aa-3cd4-4ede-8cd1-d6f3128802f9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "configureGameEngineVersion",
                    "help": "configureGameEngineVersion_linux(version:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "configureGameEngineVersion_linux",
                    "returnType": 2
                },
                {
                    "id": "72109223-ad96-42fe-bf03-1ab4f319e3ca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        1,
                        1
                    ],
                    "externalName": "addProgressionEvent",
                    "help": "addProgressionEvent_linux(status:double, progression1:string, progression2:string, progression3:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEvent_linux",
                    "returnType": 2
                },
                {
                    "id": "cf67abb0-15de-4830-9bac-68496c535138",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addDesignEvent",
                    "help": "addDesignEvent_linux(eventId:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEvent_linux",
                    "returnType": 2
                },
                {
                    "id": "a9372983-3381-4931-b60e-5c0f3a755118",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addDesignEventWithValue",
                    "help": "addDesignEventWithValue_linux(eventId:string, value:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addDesignEventWithValue_linux",
                    "returnType": 2
                },
                {
                    "id": "b1be0e52-30dc-479c-b356-8af753c6d580",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "addErrorEvent",
                    "help": "addErrorEvent_linux(severity:double, message:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addErrorEvent_linux",
                    "returnType": 2
                },
                {
                    "id": "da16deab-b459-451c-aabc-20931c58c2cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledManualSessionHandling",
                    "help": "setEnabledManualSessionHandling_linux(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledManualSessionHandling_linux",
                    "returnType": 2
                },
                {
                    "id": "9453a258-67eb-42f7-bfa8-c6b6de03802d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension01",
                    "help": "setCustomDimension01_linux(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension01_linux",
                    "returnType": 2
                },
                {
                    "id": "c4caa9e3-883a-4c05-85f7-9f323988011e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension02",
                    "help": "setCustomDimension02_linux(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension02_linux",
                    "returnType": 2
                },
                {
                    "id": "b8387bff-d4f5-46fb-a51d-d672ab62fab0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setCustomDimension03",
                    "help": "setCustomDimension03_linux(dimension:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setCustomDimension03_linux",
                    "returnType": 2
                },
                {
                    "id": "59503166-c056-48b7-acd5-c75cb462ae4b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "setFacebookId",
                    "help": "setFacebookId_linux(id:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setFacebookId_linux",
                    "returnType": 2
                },
                {
                    "id": "64ef5a6f-f8d5-4a64-858e-c4fde8ca8faa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setGender",
                    "help": "setGender_linux(gender:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setGender_linux",
                    "returnType": 2
                },
                {
                    "id": "7ffd7b64-1986-491c-9008-f5bc8947d847",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setBirthYear",
                    "help": "setBirthYear_linux(year:double)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setBirthYear_linux",
                    "returnType": 2
                },
                {
                    "id": "deeb5f3a-33dc-448d-a2dc-9a920d868247",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsStartSession",
                    "help": "startSession_linux()",
                    "hidden": false,
                    "kind": 1,
                    "name": "startSession_linux",
                    "returnType": 2
                },
                {
                    "id": "2050d5c8-f77d-4b49-a746-972c8e8912cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gameAnalyticsEndSession",
                    "help": "endSession_linux()",
                    "hidden": false,
                    "kind": 1,
                    "name": "endSession_linux",
                    "returnType": 2
                },
                {
                    "id": "8b578dcc-ab30-4058-ab49-18df0d3df2c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onQuit",
                    "help": "onStop_linux()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onStop_linux",
                    "returnType": 2
                },
                {
                    "id": "8cdb08e9-b566-4fda-a863-f85193e8737b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "onResume",
                    "help": "onResume_linux()",
                    "hidden": false,
                    "kind": 1,
                    "name": "onResume_linux",
                    "returnType": 2
                },
                {
                    "id": "89579485-9f6f-43a7-b66b-02ab67e977ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addBusinessEventJson",
                    "help": "addBusinessEventJson_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addBusinessEventJson_linux",
                    "returnType": 2
                },
                {
                    "id": "3489072f-89c3-4aa3-b0ee-19e8ec623fbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addResourceEventJson",
                    "help": "addResourceEventJson_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addResourceEventJson_linux",
                    "returnType": 2
                },
                {
                    "id": "e809b007-08ec-47d5-8b4c-465c0f44e895",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "addProgressionEventWithScoreJson",
                    "help": "addProgressionEventWithScoreJson_linux(json:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "addProgressionEventWithScoreJson_linux",
                    "returnType": 2
                },
                {
                    "id": "ddec6f92-3d4a-40c2-a141-3b715697557f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsString",
                    "help": "getRemoteConfigsValueAsString_linux(key:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsString_linux",
                    "returnType": 1
                },
                {
                    "id": "e5660e9f-924a-48f7-b720-c4ab20d523b4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "getRemoteConfigsValueAsStringWithDefaultValue",
                    "help": "getRemoteConfigsValueAsStringWithDefaultValue_linux(key:string, defaultValue:string)",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsValueAsStringWithDefaultValue_linux",
                    "returnType": 1
                },
                {
                    "id": "04f09671-dfd8-4e21-b8a8-fd3040a47c3e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "isRemoteConfigsReady",
                    "help": "isRemoteConfigsReady_linux()",
                    "hidden": false,
                    "kind": 1,
                    "name": "isRemoteConfigsReady_linux",
                    "returnType": 2
                },
                {
                    "id": "e220b99e-53da-466a-9756-95cd598ee63e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "getRemoteConfigsContentAsString",
                    "help": "getRemoteConfigsContentAsString_linux",
                    "hidden": false,
                    "kind": 1,
                    "name": "getRemoteConfigsContentAsString_linux",
                    "returnType": 1
                },
                {
                    "id": "62f6cacc-71e0-4568-aaa7-169ca21b6f25",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "setEnabledEventSubmission",
                    "help": "setEnabledEventSubmission_linux(flag:bool)",
                    "hidden": false,
                    "kind": 1,
                    "name": "setEnabledEventSubmission_linux",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "b8e2d7ac-967d-4928-875c-6abdbc0a81f6",
                "c372ab50-86e9-478e-955d-1e2212462288",
                "9b339d14-8a80-44fa-9902-cc795786119b",
                "55c37f90-5a58-4aa7-880c-417905d3b4c6",
                "60b3eeb1-2cb6-479d-a592-1ed454724dd7",
                "1774760b-c7f3-43e1-ab90-53a6735800d6",
                "856910ba-1d10-4ee8-9873-e936444f4848",
                "61ce866b-3cb7-4ad7-b4ce-e47215cf7e3d",
                "767f8b88-3265-4f8f-8182-196ee6d303f8",
                "1975c61c-cee3-4801-9d94-7926bbed0876",
                "490bed7e-93b7-4d2d-9289-eef3151987a2",
                "0fa476aa-3cd4-4ede-8cd1-d6f3128802f9",
                "72109223-ad96-42fe-bf03-1ab4f319e3ca",
                "cf67abb0-15de-4830-9bac-68496c535138",
                "a9372983-3381-4931-b60e-5c0f3a755118",
                "b1be0e52-30dc-479c-b356-8af753c6d580",
                "da16deab-b459-451c-aabc-20931c58c2cb",
                "9453a258-67eb-42f7-bfa8-c6b6de03802d",
                "c4caa9e3-883a-4c05-85f7-9f323988011e",
                "b8387bff-d4f5-46fb-a51d-d672ab62fab0",
                "59503166-c056-48b7-acd5-c75cb462ae4b",
                "64ef5a6f-f8d5-4a64-858e-c4fde8ca8faa",
                "7ffd7b64-1986-491c-9008-f5bc8947d847",
                "deeb5f3a-33dc-448d-a2dc-9a920d868247",
                "2050d5c8-f77d-4b49-a746-972c8e8912cd",
                "8b578dcc-ab30-4058-ab49-18df0d3df2c7",
                "8cdb08e9-b566-4fda-a863-f85193e8737b",
                "89579485-9f6f-43a7-b66b-02ab67e977ed",
                "3489072f-89c3-4aa3-b0ee-19e8ec623fbd",
                "e809b007-08ec-47d5-8b4c-465c0f44e895",
                "ddec6f92-3d4a-40c2-a141-3b715697557f",
                "e5660e9f-924a-48f7-b720-c4ab20d523b4",
                "04f09671-dfd8-4e21-b8a8-fd3040a47c3e",
                "e220b99e-53da-466a-9756-95cd598ee63e",
                "62f6cacc-71e0-4568-aaa7-169ca21b6f25"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        {
            "id": "0b43730a-490f-4c52-93a6-a24e2587f968",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "AdSupport.framework",
            "weakReference": false
        },
        {
            "id": "05926bf1-64c8-4837-94d8-32d99f96ebed",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "SystemConfiguration.framework",
            "weakReference": false
        }
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": null,
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": 35184372089070,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": null,
    "tvosdelegatename": null,
    "tvosmaccompilerflags": null,
    "tvosmaclinkerflags": null,
    "tvosplistinject": null,
    "version": "3.0.4"
}