import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarerHomePageWidget extends StatefulWidget {
  const CarerHomePageWidget({Key key}) : super(key: key);

  @override
  _CarerHomePageWidgetState createState() => _CarerHomePageWidgetState();
}

class _CarerHomePageWidgetState extends State<CarerHomePageWidget> {
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
                          style: FlutterFlowTheme.of(context).bodyText1,
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
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child:
                                    NavBarPage(initialPage: 'CarerVideoPage'),
                              ),
                            );
                          },
                          text: 'Call Granny',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
