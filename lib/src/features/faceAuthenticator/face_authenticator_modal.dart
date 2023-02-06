import 'package:caf_sdk/src/components/button.dart';
import 'package:caf_sdk/src/components/modal_bottom.dart';
import 'package:caf_sdk/src/features/faceAuthenticator/face_authenticator_controller.dart';
import 'package:flutter/material.dart';

class FaceAuthenticatorModal extends StatelessWidget {
  const FaceAuthenticatorModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBottom(
      title: "Autenticação facial",
      description:
          "Facematch com prova de vida do usuário do seu app, ideal para fluxos de login ou de operações financeiras valiosas.",
      input: true,
      children: [
        button("Autenticar", () {
          FocusScope.of(context).unfocus();
          startFaceAuthenticator(context);
        }),
      ],
    );
  }
}
