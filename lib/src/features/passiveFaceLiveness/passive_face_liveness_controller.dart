import 'package:caf_sdk/src/features/result/result_page.dart';
import 'package:caf_sdk/src/settings/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passive_face_liveness/android/settings.dart';
import 'package:passive_face_liveness/passive_face_liveness.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_failure.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_result.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_success.dart';

void startPassiveFaceLiveness(BuildContext context) async {
  bool result = false;

  PassiveFaceLiveness passiveFaceLiveness =
      PassiveFaceLiveness(mobileToken: Token.token);

  PassiveFaceLivenessAndroidSettings androidSettings =
      PassiveFaceLivenessAndroidSettings(
    emulatorSettings: true,
    rootSettings: true,
    useDeveloperMode: true,
    useAdb: true,
    useDebug: true,
  );

  passiveFaceLiveness.setAndroidSettings(androidSettings);

  try {
    PassiveFaceLivenessResult passiveFaceLivenessResult =
        await passiveFaceLiveness.start();

    if (passiveFaceLivenessResult is PassiveFaceLivenessSuccess) {
      result = true;
    } else if (passiveFaceLivenessResult is PassiveFaceLivenessFailure) {
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
