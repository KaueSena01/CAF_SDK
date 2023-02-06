import 'package:caf_sdk/src/components/button.dart';
import 'package:caf_sdk/src/settings/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final bool result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Resultado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    result ? Icons.check_circle : Icons.error,
                    color: result ? primaryColor : errorColor,
                    size: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Text(
                      result
                          ? "A captura foi realizada e\nserá analisada."
                          : "Erroa ao tentar capturar tente\nnovamente mais tarde",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            button(
              "Voltar",
              () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
