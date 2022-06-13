import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class CarerVideoPageWidget extends StatefulWidget {
  const CarerVideoPageWidget({
    Key key,
    this.grannyCallAction,
    this.signalsReference,
  }) : super(key: key);

  final String grannyCallAction;
  final DocumentReference signalsReference;

  @override
  _CarerVideoPageWidgetState createState() => _CarerVideoPageWidgetState();
}

class _CarerVideoPageWidgetState extends State<CarerVideoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      final signalsUpdateData = createSignalsRecordData(
        room: '',
        message: valueOrDefault<String>(
          widget.grannyCallAction,
          '0',
        ),
      );
      await widget.signalsReference.update(signalsUpdateData);
    });
  }

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
