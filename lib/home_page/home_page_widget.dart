import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
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
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Column(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '<',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    AuthUserStreamWidget(
                      child: Text(
                        valueOrDefault(currentUserDocument?.role, ''),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      '|',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      FFAppState().role,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      '>',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (functions.isCurrentUserGranny(
                  valueOrDefault(currentUserDocument?.role, '')) ??
              true)
            AuthUserStreamWidget(
              child: Text(
                ' Granny\'s details',
                style: FlutterFlowTheme.of(context).title3,
              ),
            ),
          if (functions.isCurrentUserGranny(
                  valueOrDefault(currentUserDocument?.role, '')) ??
              true)
            AuthUserStreamWidget(
              child: Container(
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
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Room: ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          valueOrDefault(currentUserDocument?.room, ''),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                    Container(
                      // width: 500,
                      // height: 500,
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
            ),
          if (!(functions.isCurrentUserGranny(
                  valueOrDefault(currentUserDocument?.role, ''))) ??
              true)
            AuthUserStreamWidget(
              child: Text(
                'Carer actions',
                style: FlutterFlowTheme.of(context).title3,
              ),
            ),
          if (!(functions.isCurrentUserGranny(
                  valueOrDefault(currentUserDocument?.role, ''))) ??
              true)
            AuthUserStreamWidget(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 20),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Temp',
                              hintStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0x7F455A64),
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Call Granny ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.switch_video,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
