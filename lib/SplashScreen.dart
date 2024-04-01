import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mad_mtr/Screens/HomeScreen.dart';
import 'package:mad_mtr/Screens/WarningScreen.dart';
import 'package:mad_mtr/Screens/aboutScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void aboutBtn(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (BuildContext context) => AboutScreen(),
    ));
  }

  void warningBtn(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (BuildContext context) => WarningScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bground.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/flyy.png",
                      height: 100,
                      width: 100,
                    ),
                    const Gap(10),
                    const Text(
                      "Darna's",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'PixelGamerPersonalUse-rg61L'),
                    ),
                    const Text(
                      "Flight",
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'PixelGamerPersonalUse-rg61L'),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const App()));
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text(
                        "P L A Y",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PixelGamerPersonalUse-rg61L',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      style: TextButton.styleFrom(
                        iconColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Color.fromARGB(255, 51, 223, 17),
                        padding: const EdgeInsets.all(15),
                        shadowColor: Colors.black,
                        elevation: 20,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "EXIT",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PixelGamerPersonalUse-rg61L',
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 2, 2),
                        padding: const EdgeInsets.all(15),
                        shadowColor: Colors.black,
                        elevation: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 35,
                    color: Color.fromARGB(139, 61, 163, 247),
                    child: IconButton(
                      onPressed: () => aboutBtn(context),
                      icon: Icon(Icons.help_outline_outlined),
                      iconSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 35,
                    color: Color.fromARGB(141, 111, 228, 115),
                    child: IconButton(
                      onPressed: () => warningBtn(context),
                      icon: Icon(Icons.warning_amber_outlined),
                      iconSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 35,
                    color: const Color.fromARGB(127, 244, 67, 54),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close_sharp),
                      iconSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
