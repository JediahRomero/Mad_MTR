import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningScreen extends StatefulWidget {
  const WarningScreen({Key? key});

  @override
  State<WarningScreen> createState() => _WarningScreenState();
}

class _WarningScreenState extends State<WarningScreen> {
  final fontStyleTitle = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  final fontStyleText = GoogleFonts.poppins(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 149, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 149, 243),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 33, 149, 243),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Gap(15),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Darna's Flight",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'PixelGamerPersonalUse-rg61L',
                          ),
                        ),
                        Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'WARNING !',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'PixelGamerPersonalUse-rg61L',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'This game may contain themes, imagery, or references that could be sensitive or triggering for some individuals.'
                    '\n\nThese may include: '
                    '\n- Mild cartoon violence'
                    '\n- Supernatural and mythical creatures'
                    '\n- Cultural references and symbols'
                    '\n\nPlayer discretion is advised, particularly for younger audiences or those who may be sensitive to such content. Parents and guardians are encouraged to supervise their children\'s gameplay and discuss any questions or concerns that may arise.'
                    '\n\nBy proceeding, you acknowledge that you have read and understood this warning message.',
                    style: fontStyleText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
