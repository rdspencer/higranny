// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import '../../auth/auth_util.dart';



Future writeMessageToGranny(
  BuildContext context,
  String grannyDisplayName,
  String firstCarersEmail,
) async {
  print('(X40)${grannyDisplayName}');
  var grannyRef =
  UsersRecord.collection
    .where('display_name',
      isEqualTo:
      valueOrDefault(currentUserDocument?.grannyDisplayName, ''))
  .get()
  .then((snapshot) {
    print('(X44)${snapshot}');
    var grannyRef = snapshot.docs[0].reference;
    // print('(X45)${snapshot.docs[0]}*${snapshot.docs[0].reference}');
    final grannyRefWidgetUsersRecord =
    // grannyRefWidgetUsersRecordList.isNotEmpty
    //     ? grannyRefWidgetUsersRecordList.first
    //     : null;
    // grannyRef = grannyRefWidgetUsersRecord.reference;
    print('(X45)${grannyRef}');
     final usersUpdateData = createUsersRecordData(
       messageForGranny: radioButtonValue,
     );
    grannyRef.update({'message': 'XXX'});
    print('(X46)${grannyRef}');
  });






//widget getGrannyRef = AuthUserStreamWidget(
  //          child:
/*
  uR = StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where('display_name',
            isEqualTo:
                valueOrDefault(currentUserDocument?.grannyDisplayName, '')),
        singleRecord: false,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        print(
            '(X41)${currentUserDocument.grannyDisplayName}^${snapshot.connectionState}*${snapshot.hasData}%${snapshot.data}!${valueOrDefault(currentUserDocument?.grannyDisplayName, '')}');
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
        List<UsersRecord> grannyRefWidgetUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        } else {
          final grannyRefWidgetUsersRecord =
              grannyRefWidgetUsersRecordList.isNotEmpty
                  ? grannyRefWidgetUsersRecordList.first
                  : null;
          grannyRef = grannyRefWidgetUsersRecord.reference;
          print('(X42)${grannyRef}');
          final usersUpdateData = createUsersRecordData(
            messageForGranny: 'XYX',//radioButtonValue,
          );
          grannyRef.update('XXX');
        } //print('(X31)${grannyRefWidgetUsersRecord}%${grannyRefWidgetUsersRecordList}');
      });
  print('(X43)${grannyRef}');
*/
}
