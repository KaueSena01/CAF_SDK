// ignore_for_file: sdk_version_ui_as_code
import 'package:caf_sdk/src/settings/colors.dart';
import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  const ModalBottom({
    Key? key,
    required this.title,
    required this.description,
    required this.children,
    this.input = false,
  }) : super(key: key);

  final String title;
  final String description;
  final bool input;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.60,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: descriptionColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    if (input)
                      TextFormField(
                        textAlign: TextAlign.center,
                        maxLength: 11,
                      ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
