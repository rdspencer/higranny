import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (functions.isCurrentUserGranny(
                  valueOrDefault(currentUserDocument?.role, '')) ??
              true)
            AuthUserStreamWidget(
              child: Column(
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
                            Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              '    Room: ',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              valueOrDefault(currentUserDocument?.room, ''),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        Container(
                          width: 500,
                          height: 500,
                          child: custom_widgets.ConnectToRoom(
                            width: 500,
                            height: 500,
                            room: valueOrDefault(currentUserDocument?.room, ''),
                            role: 'Granny',
                            displayName: currentUserDisplayName,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (!(functions.isCarerSelected(
                  valueOrDefault(currentUserDocument?.role, ''))) ??
              true)
            AuthUserStreamWidget(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.ConnectToRoom(
                    width: double.infinity,
                    height: double.infinity,
                    room: valueOrDefault(currentUserDocument?.room, ''),
                    role: valueOrDefault(currentUserDocument?.role, ''),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
