import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrannyHomePageWidget extends StatefulWidget {
  const GrannyHomePageWidget({Key key}) : super(key: key);

  @override
  _GrannyHomePageWidgetState createState() => _GrannyHomePageWidgetState();
}

class _GrannyHomePageWidgetState extends State<GrannyHomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: custom_widgets.ConnectToRoom(
              width: double.infinity,
              height: 100,
              room: valueOrDefault(currentUserDocument?.room, ''),
              role: 'Granny',
              displayName: valueOrDefault(currentUserDocument?.displayName, '')
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF040D30),
              ),
              child: AuthUserStreamWidget(
                child: FutureBuilder<List<SignalsRecord>>(
                  future: querySignalsRecordOnce(
                    queryBuilder: (signalsRecord) => signalsRecord.where('room',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.room, '')),
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
                      style: FlutterFlowTheme.of(context).title2,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
