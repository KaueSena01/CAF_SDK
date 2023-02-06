import 'package:caf_sdk/src/features/result/result_page.dart';
import 'package:caf_sdk/src/settings/token.dart';
import 'package:document_detector/android/android_settings.dart';
import 'package:document_detector/android/capture_stage/capture_mode.dart';
import 'package:document_detector/android/capture_stage/capture_stage.dart';
import 'package:document_detector/android/capture_stage/detection_settings.dart';
import 'package:document_detector/android/capture_stage/quality_settings.dart';
import 'package:document_detector/document_detector.dart';
import 'package:document_detector/document_detector_step.dart';
import 'package:document_detector/result/document_detector_failure.dart';
import 'package:document_detector/result/document_detector_result.dart';
import 'package:document_detector/result/document_detector_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void startDocumentDetector(
  List<DocumentDetectorStep> documentSteps,
  BuildContext context,
) async {
  bool result = false;

  DocumentDetector documentDetector = DocumentDetector(
    mobileToken: Token.token,
  );

  QualitySettings qualitySettings = QualitySettings(1.8);
  DetectionSettings detectionSettings = DetectionSettings(0.91, 5);

  List<CaptureStage> captureStages = [
    CaptureStage(
      durationMillis: 20000,
      wantSensorCheck: true,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.AUTOMATIC,
    ),
    CaptureStage(
      durationMillis: 15000,
      wantSensorCheck: false,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.AUTOMATIC,
    ),
    CaptureStage(
      durationMillis: 15000,
      wantSensorCheck: false,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.MANUAL,
    ),
    CaptureStage(
      durationMillis: 0,
      wantSensorCheck: false,
      qualitySettings: null,
      detectionSettings: null,
      captureMode: CaptureMode.MANUAL,
    ),
  ];

  DocumentDetectorAndroidSettings androidSettings =
      DocumentDetectorAndroidSettings(
    captureStages: captureStages,
    useEmulator: true,
    useAdb: true,
    useDebug: true,
    useDeveloperMode: true,
    useRoot: true,
  );

  documentDetector.setAndroidSettings(androidSettings);
  documentDetector.setDocumentFlow(documentSteps);

  try {
    DocumentDetectorResult documentResult = await documentDetector.start();

    if (documentResult is DocumentDetectorSuccess) {
      result = true;
    } else if (documentResult is DocumentDetectorFailure) {
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
