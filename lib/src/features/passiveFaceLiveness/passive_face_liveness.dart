import 'package:caf_sdk/src/components/button.dart';
import 'package:caf_sdk/src/components/modal_bottom.dart';
import 'package:caf_sdk/src/features/passiveFaceLiveness/passive_face_liveness_controller.dart';
import 'package:flutter/material.dart';

class PassiveFaceLivenessModal extends StatelessWidget {
  const PassiveFaceLivenessModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBottom(
      title: "Prova de vida",
      description:
          "Câmera inteligente que captura uma selfie confiável do seu usuário utilizando inteligência artificial. É capaz de detectar e reprovar fotos de foto e gravações.",
      children: [
        button(
          "Aitvo",
          () => startPassiveFaceLiveness(context),
        ),
        button(
          "Passivo",
          () => startPassiveFaceLiveness(context),
        ),
      ],
    );
  }
}
