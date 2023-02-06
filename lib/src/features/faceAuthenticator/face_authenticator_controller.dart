import 'package:caf_sdk/src/features/result/result_page.dart';
import 'package:caf_sdk/src/settings/token.dart';

import 'package:face_authenticator/android/settings.dart';
import 'package:face_authenticator/face_authenticator.dart';
import 'package:face_authenticator/result/face_authenticator_failure.dart';
import 'package:face_authenticator/result/face_authenticator_result.dart';
import 'package:face_authenticator/result/face_authenticator_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void startFaceAuthenticator(BuildContext context) async {
  bool result = false;

  FaceAuthenticator faceAuthenticator =
      FaceAuthenticator(mobileToken: Token.token);

  FaceAuthenticatorAndroidSettings androidSettings =
      FaceAuthenticatorAndroidSettings(
    useDeveloperMode: true,
    enableRootDevices: true,
    enableEmulator: true,
    useAdb: true,
    useDebug: true,
  );

  faceAuthenticator.setPeopleId("12345678910");
  faceAuthenticator.setAndroidSettings(androidSettings);

  try {
    FaceAuthenticatorResult faceAuthenticatorResult =
        await faceAuthenticator.start();

    if (faceAuthenticatorResult is FaceAuthenticatorSuccess) {
      result = true;
    } else if (faceAuthenticatorResult is FaceAuthenticatorFailure) {
      result = false;
    } else {}
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          result: result,
        ),
      ),
    );
  } on PlatformException {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultPage(
          result: false,
        ),
      ),
    );
  }
}
