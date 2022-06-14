// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
//import '../flutter_flow/flutter_flow_theme.dart';
//import 'flutter_flow/flutter_flow_util.dart';
import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
//import 'package:google_fonts/google_fonts.dart';

class NavigateToGrannyOrCarer extends StatefulWidget {
  const NavigateToGrannyOrCarer({
    Key key,
    this.width,
    this.height,
    this.role,
  }) : super(key: key);

  final double width;
  final double height;
  final String role;

  @override
  _NavigateToGrannyOrCarerState createState() =>
      _NavigateToGrannyOrCarerState();
}

class _NavigateToGrannyOrCarerState extends State<NavigateToGrannyOrCarer> {
  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      if (widget.role == 'Granny') {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavBarPage(initialPage: 'GrannyHomePage'),
          ),
        );
      } else {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavBarPage(initialPage: 'CarerHomePage'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
    );
  }
}
