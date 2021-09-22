import 'package:firebase_auth/firebase_auth.dart';
import 'package:jica/src/utils/debugBro.dart';

class AuthApi {
  String errorMessage = '';
  String smsCode;
  String verificationId;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User> signIn({String email, String password}) async {
    logger.d('here...');
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      logger.e(user);

      return user;
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
    }
    return null;
  }

  Future<User> signUp({String username, String email, String password}) async {
    logger.i(email);
    try {
      final UserCredential authResults =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User user = authResults.user;

      logger.e(user);
      return user;
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
    }
    return null;
  }

  Future<void> forgotPassword(String username) async {}

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {}
  }

  Future<void> sendPhoneVerificationCode(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      autoRetrievedSmsCodeForTesting: phoneNumber,
      phoneNumber: '+267$phoneNumber',
      timeout: Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) {
        this.smsCode = phoneAuthCredential.smsCode;
        this.verificationId = phoneAuthCredential.verificationId;
        if (smsCode.length == 6) {}
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          errorMessage = 'The provided phone number is not valid.';
        } else {
          errorMessage = error.message;
        }
      },
      codeSent: (verificationId, [forceResendingToken]) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }
}
