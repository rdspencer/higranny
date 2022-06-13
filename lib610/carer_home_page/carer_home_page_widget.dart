import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../carer_video_page/carer_video_page_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarerHomePageWidget extends StatefulWidget {
  const CarerHomePageWidget({Key key}) : super(key: key);

  @override
  _CarerHomePageWidgetState createState() => _CarerHomePageWidgetState();
}

class _CarerHomePageWidgetState extends State<CarerHomePageWidget> {
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/granny1.png',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/HG.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Name: ',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        AuthUserStreamWidget(
                          child: Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Text(
                          '    Room: ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        AuthUserStreamWidget(
                          child: Text(
                            valueOrDefault(currentUserDocument?.room, ''),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    FlutterFlowRadioButton(
                      options: [
                        'Immediate  video and audio',
                        'Audio then video on answer',
                        'Ring then video and audio on answer'
                      ].toList(),
                      initialValue: 'Immediate  video and audio',
                      onChanged: (value) {
                        setState(() => radioButtonValue = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: Colors.blue,
                      inactiveRadioButtonColor: Color(0x8A000000),
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarerVideoPageWidget(
                              grannyCallAction: radioButtonValue,
                              signalsReference:
                                  currentUserDocument?.signalsReference,
                            ),
                          ),
                        );
                      },
                      text: 'Call Granny',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFF14A76C),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AuthUserStreamWidget(
            child: StreamBuilder<List<SignalsRecord>>(
              stream: querySignalsRecord(
                queryBuilder: (signalsRecord) => signalsRecord.where('room',
                    isEqualTo: valueOrDefault(currentUserDocument?.room, '')),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                List<SignalsRecord> textSignalsRecordList = snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final textSignalsRecord = textSignalsRecordList.isNotEmpty
                    ? textSignalsRecordList.first
                    : null;
                return Text(
                  textSignalsRecord.message,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
