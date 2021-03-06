// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
/*import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';*/
// Begin custom widget code
import 'dart:io';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/foundation.dart';

class ConnectToRoom extends StatefulWidget {
  const ConnectToRoom({
    Key key,
    this.width,
    this.height,
    this.room,
    this.role,
    this.displayName,
  }) : super(key: key);

  final double width;
  final double height;
  final String room;
  final String role;
  final String displayName;

  @override
  _ConnectToRoomState createState() => _ConnectToRoomState();
}

class _ConnectToRoomState extends State<ConnectToRoom> {
  @override
  void initState() {
    super.initState();
    print('(X3A)');
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
    print('(X3B)');
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    String serverUrl = 'https://meet.jitsi.si';
    print('(X2)');
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                print('(X6)');
              },
              icon: Icon(Icons.ac_unit)),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                print('(X1)');
                _joinMeeting(widget.room, widget.displayName);
              },
              child: Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}

_joinMeeting(String room, String displayName) async {
  String serverUrl = 'https://meet.jitsi.si';
  // String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

  // Enable or disable any feature flag here
  // If feature flag are not provided, default values will be used
  // Full list of feature flags (and defaults) available in the README
  Map<FeatureFlagEnum, bool> featureFlags = {
    // FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    // / Default: enabled (true).
    // FeatureFlagEnum.ADD_PEOPLE_ENABLED: true,
    /// Flag indicating if calendar integration should be enabled.
    /// Default: enabled (true) on Android, auto-detected on iOS.
    // FeatureFlagEnum.CALENDAR_ENABLED: true,
    /// Flag indicating if call integration (CallKit on iOS,
    /// ConnectionService on Android)
    /// should be enabled.
    /// Default: enabled (true).
    // FeatureFlagEnum.CALL_INTEGRATION_ENABLED: true,
    /// Flag indicating if close captions should be enabled.
    /// Default: enabled (true).
    // FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: true,
    /// Flag indicating if chat should be enabled.
    /// Default: enabled (true).
    // FeatureFlagEnum.CHAT_ENABLED: false,
    /// Flag indicating if invite functionality should be enabled.
    /// Default: enabled (true).
    // FeatureFlagEnum.INVITE_ENABLED: true,
    /// Flag indicating if recording should be enabled in iOS.
    /// Default: disabled (false).
    // FeatureFlagEnum.IOS_RECORDING_ENABLED: false,
    /// Flag indicating if live-streaming should be enabled.
    /// Default: auto-detected.
    // FeatureFlagEnum.LIVE_STREAMING_ENABLED: true,
    /// Flag indicating if displaying the meeting name should be enabled.
    /// Default: enabled (true).
    // FeatureFlagEnum.MEETING_NAME_ENABLED: true,
    /// Flag indicating if the meeting password button should be enabled. Note
    /// that this flag just decides on the buttton, if a meeting has a password
    /// set, the password ddialog will still show up.
    /// Default: enabled (true).
    FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
    /// Flag indicating if Picture-in-Picture should be enabled.
    /// Default: auto-detected.
    // FeatureFlagEnum.PIP_ENABLED: true,
    /// Flag indicating if raise hand feature should be enabled.
    /// Default: enabled.
    // FeatureFlagEnum.RAISE_HAND_ENABLED: true,
    /// Flag indicating if recording should be enabled.
    /// Default: auto-detected.
    // FeatureFlagEnum.RECORDING_ENABLED: false,
    /// Flag indicating if tile view feature should be enabled.
    /// Default: enabled.
    // FeatureFlagEnum.TILE_VIEW_ENABLED: true,
    /// Flag indicating if the toolbox should be always be visible
    /// Default: disabled (false).
    FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: true,
    /// Flag indicating if the welcome page should be enabled.
    /// Default: disabled (false).
    // FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
 // FeatureFlagEnum.PASSWORD_REQUIRED : false,
  };
  if (!kIsWeb) {
    // Here is an example, disabling features for each platform
    if (Platform.isAndroid) {
      // Disable ConnectionService usage on Android to avoid issues (see README)
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    } else if (Platform.isIOS) {
      // Disable PIP on iOS as it looks weird
      featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
    }
  }
  // Define meetings options here
  print('(X8)${room}*${displayName}');
  if ((displayName == null)||(displayName == '')) displayName = 'XXX';

  var options = JitsiMeetingOptions(room: room)
    ..serverURL = 'https://meet.jit.si'
    ..subject = 'Hi Granny!'
    ..userDisplayName = displayName
    ..userEmail = 'a@a.com'
    ..iosAppBarRGBAColor = "#0080FF80" //transparent blue
    ..audioOnly = false
    ..audioMuted = false
    ..videoMuted = false
    //..token = '<jwt_token>'
    ..featureFlags.addAll(featureFlags)
    ..webOptions = {
      "roomName": room,
      "width": "100%",
      "height": "100%",
      "enableWelcomePage": false,
      "chromeExtensionBanner": null,
      "userInfo": {"displayName": displayName}
    };
  debugPrint("<X9>JitsiMeetingOptions: <${options}>");

  await JitsiMeet.joinMeeting(
    options,
    listener: JitsiMeetingListener(
        onConferenceWillJoin: (message) {
          debugPrint("<X10>${options.room} will join with message: $message");
        },
        onConferenceJoined: (message) {
          debugPrint("<X11>${options.room} joined with message: $message");
        },
        onConferenceTerminated: (message) {
          debugPrint("<X12>${options.room} terminated with message: $message");
        },
        genericListeners: [
          JitsiGenericListener(
              eventName: 'readyToClose',
              callback: (dynamic message) {
                debugPrint("<X13>readyToClose callback");
              }),
        ]),
  );
}

void _onConferenceWillJoin(message) {
  debugPrint("<X14>_onConferenceWillJoin broadcasted with message: $message");
}

void _onConferenceJoined(message) {
  debugPrint("<X15>_onConferenceJoined broadcasted with message: $message");
}

void _onConferenceTerminated(message) {
  debugPrint("<X16>_onConferenceTerminated broadcasted with message: $message");
}

_onError(error) {
  debugPrint("<X17>_onError broadcasted: $error");
}

/*

import 'dart:io';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/foundation.dart';
class ConnectToRoom extends StatefulWidget {
  const ConnectToRoom({
    Key key,
    this.width,
    this.height,
    this.room,
    this.role,
    this.displayName,
  }) : super(key: key);

  final double width;
  final double height;
  final String room;
  final String role;
  final String displayName;

  @override
  _ConnectToRoomState createState() => _ConnectToRoomState();
}

class _ConnectToRoomState extends State<ConnectToRoom> {
   @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  
  
  @override
  Widget build(BuildContext context) {
    String serverUrl = '';
    
    return Center(
      child:SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _joinMeeting(widget.room, widget.displayName);
              },
              child: Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
        ),
        );
  }
}

_joinMeeting(String room, String displayName) async {
      String serverUrl;
  // String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: room)
      ..serverURL = ''
      ..subject = 'Hi Granny!'
      ..userDisplayName = displayName
      ..userEmail = ''
      ..iosAppBarRGBAColor = "#0080FF80" //transparent blue
      ..audioOnly = false
      ..audioMuted = false
      ..videoMuted = false
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": room,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": displayName}
      };

   /* var options = JitsiMeetingOptions(room: roomText.text)
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText.text}
      };
*/
    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
    
  }
*/
