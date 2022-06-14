import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool isCurrentUserGranny(String role) {
  // is current users role = 'Granny'
  return role == 'Granny';
  //FFAppState().role == 'Granny';
}

bool isCarerSelected(String role) {
  // widget radio button selection
  switch (role) {
    case 'Carer':
      {
        return true;
      }
      break;
    default:
      {
        return false;
      }
  }
}

String generateRoomFromDisplayNameAndEmail(
  String displayName,
  String email,
) {
  //String plainRoom = displayName + 'HiGranny' + email;
  //String encodedRoom = base64Url.encode(utf8.encode(plainRoom));
  String sDisplayName =
      displayName.replaceAll(RegExp(r'[^a-zA-Z0-9\d\s:]'), '_');
  String sEmail = email.replaceAll(RegExp(r'[^a-zA-Z0-9\d\s:]'), '_');
  String room = sDisplayName + 'HiGranny' + sEmail;
  return room;
}

bool alwaysTrue() {
  return true;
}
