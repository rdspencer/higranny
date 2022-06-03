import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HigrannyFirebaseUser {
  HigrannyFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HigrannyFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HigrannyFirebaseUser> higrannyFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HigrannyFirebaseUser>(
            (user) => currentUser = HigrannyFirebaseUser(user));
