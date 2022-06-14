// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code

class GrannyRefWidget extends StatefulWidget {
  const GrannyRefWidget({
    Key key,
    this.width,
    this.height,
    this.grannyRecordRef,
  }) : super(key: key);

  final double width;
  final double height;
  final DocumentReference grannyRecordRef;

  @override
  _GrannyRefWidgetState createState() => _GrannyRefWidgetState();
}

class _GrannyRefWidgetState extends State<GrannyRefWidget> {
  DocumentReference localGrannyRecordRef;
  @override
  Widget build(BuildContext context) {
    localGrannyRecordRef = widget.grannyRecordRef;
    FFAppState().carersGrannysRef = widget.grannyRecordRef;
    return Container();
  }
}
