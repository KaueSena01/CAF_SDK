import 'package:caf_sdk/src/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

import 'src/features/documentDetector/document_detector_modal.dart';
import 'src/features/faceAuthenticator/face_authenticator_modal.dart';
import 'src/features/passiveFaceLiveness/passive_face_liveness.dart';
import 'src/settings/assets.dart';

void main() {
  runApp(const SDK());
}

class SDK extends StatelessWidget {
  const SDK({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  void requestPermissions() async {
    await [
      Permission.camera,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                      ),
                    ),
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, top: 40, right: 15),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: SvgPicture.asset(
                              "assets/icons/logo.svg",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Combate à Fraude",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/icons/arrow.svg",
                                  height: 15,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Guia para integração com SDKS da\nplataforma CAF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      height: 90,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 103, 103, 103),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _button(
                            context,
                            "Ler documentos",
                            Assets.documentDetector,
                            const DocumentDetectorModal(),
                          ),
                          _button(
                            context,
                            "Prova de vida",
                            Assets.passiveFaceLiveness,
                            const PassiveFaceLivenessModal(),
                          ),
                          _button(
                            context,
                            "Autenticação facial",
                            Assets.faceAuthenticator,
                            const FaceAuthenticatorModal(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/images/fingerprint.svg",
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Text(
              "Kauê Alves Sena",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(
    BuildContext context,
    String label,
    String asset,
    Widget builder,
  ) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => builder,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              "assets/icons/$asset.svg",
              height: 25,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
