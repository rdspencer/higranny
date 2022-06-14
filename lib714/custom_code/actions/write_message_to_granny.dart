// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import '../../auth/auth_util.dart';
// Begin custom action code
Future writeMessageToGranny(
  BuildContext context,
  String grannyDisplayName,
  String firstCarersEmail,
  String radioButtonChoice,
) async {
  print('(X40)${grannyDisplayName}');
  var grannyRef = UsersRecord.collection
      .where('display_name',
          isEqualTo: valueOrDefault(currentUserDocument?.grannyDisplayName, ''))
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
      messageForGranny: radioButtonChoice,
    );
    grannyRef.update({'message': radioButtonChoice});
    print('(X46)${grannyRef}');
  });
}
