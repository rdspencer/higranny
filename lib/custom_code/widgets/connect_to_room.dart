
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:flutter/cupertino.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'dart:io';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/foundation.dart';
import '../../auth/auth_util.dart';
//import 'package:just_audio/just_audio.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


String command = '';
const int buildNumber = 718;
bool _ringing = false;
AssetsAudioPlayer _player;

class PlaylistItemDetails {
  PlaylistItemDetails(this.index, this.title, this.url);
  final int index;
  final String title;
  final String url;
}
List<PlaylistItemDetails> playlistItemDetails = [];
// ConcatenatingAudioSource _playlist;
// AudioPlayer _audioPlayer;
final ring1 =  'asset:///phone1.mp3';// Uri.file('assets/audios/phone1.wav');

class ConnectToRoom extends StatefulWidget {
  const ConnectToRoom({
    Key key,
    this.width,
    this.height,
    this.room,
    this.role,
    this.displayName,
    this.grannyDisplayName,
  }) : super(key: key);

  final double width;
  final double height;
  final String room;
  final String role;
  final String displayName;
  final String grannyDisplayName;
  @override
  _ConnectToRoomState createState() => _ConnectToRoomState();
}

class _ConnectToRoomState extends State<ConnectToRoom> {

  void ringGranny() async{
   /*final AssetsAudioPlayer*/ _player =  AssetsAudioPlayer.withId('Ringer');;
//    final ring1 =  'https://download.samplelib.com/mp3/sample-3s.mp3';
//     for (int i=0; i < 10; i++) {
      if (_ringing) {
        // print('(X180)${i}');
        _player.open(
       //   Audio("assets/audios/phone1.wav"),
          Playlist(
              audios: [
               Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
                Audio("assets/audios/phone1.wav"),
              //
              ]
          ),
          //  loopMode: LoopMode.playlist
          // autoPlay: true,

        );
      }
   // }

  }


  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer();
    print('(X3A)${widget.room}*${widget.displayName}');
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
    _ringing = false;
    // _player = AssetsAudioPlayer.withId('Ringer');
    print('(X3B)');
  }

  // assetsAudioPlayer.playlistAudioFinished.listen((event){if(event) {//carry out another action you want }  });

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }


  @override
  Widget build(BuildContext context) {

    String serverUrl = 'https://meet.jitsi.si';
    print('(X2)${widget.role}*${currentUserDocument.room}');
    if (widget.role == 'Granny') {
      return Scaffold(
          // key: scaffoldKey,
          // backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
        child: Center(
            child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord.where('room',
                      isEqualTo: valueOrDefault(currentUserDocument?.room, '')),
                  singleRecord: false,
                ),
                builder: (BuildContext context, snapshot) {
                  print('(X105)${snapshot}%${currentUserDocument.room}');
                  if (!snapshot.hasData) return new Text('Loading...');
                  print('(X106)${snapshot.data}');
                  if ((snapshot.data != null) & (snapshot.data.length > 0)) {
                    print(
                        '(X107)${snapshot.data.first}^${widget.room}%${widget.displayName}');
                    command = snapshot.data.first.message;
                    print('(X108)${command}<');
                    String truncCommand = 'XXXX';
                    if (command.length > 3) {
                      truncCommand = command.substring(0, 3);
                    }
                    print('(X109)${command}%${truncCommand}<');
                    switch (truncCommand) {
                      case 'Imm': //Immediate video and audio
                        {
                          print('(X130)${command}<');
                          String truncCommand = 'XXXX';
                          _joinMeeting(widget.room, widget.displayName);
                          return Container(child: Text('Connection closed'));
                          break;
                        }
                      case 'Aud': //Audio then video on answer
                        {
                          print('(X131)${command}<');
                          String truncCommand = 'XXXX';
                          _joinMeeting(widget.room, widget.displayName,
                              audioOn: true, videoOn: false);
                          return Container(child: Text('Connection closed'));
                          break;
                        }
                      case 'Rin': //Ring then video and audio on answer
                        {
                          print('(X132)${command}<');
                          _ringing = true;
                        ringGranny();

                          return Center(

                            child: ElevatedButton(

                              child: const Text(
                                'Answer',
                                style: TextStyle(fontSize: 100),
                              ),
                              onPressed: () {
                                _ringing = false;
                               _player.pause();
                                print('(X134)');
                                _joinMeeting(
                                    widget.room, widget.displayName);
                                return Container(child: Text('Connection closed'));
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 35,
                                fixedSize: const Size(400, 400),
                                shape: const CircleBorder(),
                                primary: Colors.green,
                              ),
                            ),
                          );
                          break;
                        }
                      default:
                        {
                          print('(X120)${command}%${truncCommand}<');
                          return Text('Unknown coimmand');
                          break;
                        }
                    }
                  } else {
                    print('(X121)');
                    return Container(child: Center(child: Text('No data')));
                  }
                })),
      ));
    } else {
      //if role == 'Carer'
      return Scaffold(
        // key: scaffoldKey,
        // backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              SizedBox(
                height: 150.0,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    print('(X1)');
                    _joinMeeting(widget.room, widget.displayName);
                  },
                  child: Text(
                    "Join Meeting ${buildNumber}",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue)),
                ),
              ),
              SizedBox(height: 150),
              SizedBox(
                height: 150.0,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'CarerHomePage'),
                      ),
                    );
                  },
                  child: Text(
                    "Return to menu",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green)),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  _joinMeeting(
    String room,
    String displayName, {
    bool audioOn = true,
    bool videoOn = true,
  }) async {
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
      FeatureFlagEnum.TILE_VIEW_ENABLED: true,

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
    if ((displayName == null) || (displayName == '')) displayName = 'XXX';

    var options = JitsiMeetingOptions(room: room)
      ..serverURL = 'https://meet.jit.si'
      ..subject = 'Hi Granny!'
      ..userDisplayName = displayName
      ..userEmail = 'a@a.com'
      ..iosAppBarRGBAColor = "#0080FF80" //transparent blue
      ..audioOnly = !videoOn && audioOn
      ..audioMuted = !audioOn
      ..videoMuted = !videoOn
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
            debugPrint(
                "<X12>${options.room} terminated with message: $message");
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
