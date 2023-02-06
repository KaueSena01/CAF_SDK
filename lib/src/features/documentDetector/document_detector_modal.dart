import 'package:caf_sdk/src/components/button.dart';
import 'package:caf_sdk/src/components/modal_bottom.dart';
import 'package:caf_sdk/src/features/documentDetector/document_detector_controller.dart';
import 'package:flutter/material.dart';
import 'package:document_detector/document_type.dart';
import 'package:document_detector/document_detector_step.dart';

class DocumentDetectorModal extends StatelessWidget {
  const DocumentDetectorModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBottom(
      title: "Detector de documentos",
      description:
          "SDK responsável por capturar uma RG, CNH e outros documentos  de identificação para a extração de dados documentais.",
      children: [
        button(
          "RG",
          () => startDocumentDetector([
            DocumentDetectorStep(document: DocumentType.RG_FRONT),
            DocumentDetectorStep(document: DocumentType.RG_BACK),
          ], context),
        ),
        button(
          "CNH",
          () => startDocumentDetector([
            DocumentDetectorStep(document: DocumentType.CNH_FRONT),
            DocumentDetectorStep(document: DocumentType.CNH_BACK),
          ], context),
        ),
        button(
          "Outros",
          () => startDocumentDetector([
            DocumentDetectorStep(document: DocumentType.OTHERS),
          ], context),
        ),
      ],
    );
  }
}
