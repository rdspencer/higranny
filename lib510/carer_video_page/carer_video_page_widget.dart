import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarerVideoPageWidget extends StatefulWidget {
  const CarerVideoPageWidget({Key key}) : super(key: key);

  @override
  _CarerVideoPageWidgetState createState() => _CarerVideoPageWidgetState();
}

class _CarerVideoPageWidgetState extends State<CarerVideoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: AuthUserStreamWidget(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.ConnectToRoom(
            width: double.infinity,
            height: double.infinity,
            room: valueOrDefault(currentUserDocument?.room, ''),
            role: valueOrDefault(currentUserDocument?.role, ''),
            displayName: currentUserDisplayName,
          ),
        ),
      ),
    );
  }
}
