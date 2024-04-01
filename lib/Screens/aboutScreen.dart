import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final fontStyleTitle = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  final fontStyleText = GoogleFonts.poppins(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 159, 245),
        title: Text(
          "Darna's Flight",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'PixelGamerPersonalUse-rg61L',
          ),
        ),
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
                  const Gap(5),
                  Text(
                    "Darna's Flight"
                    'is a 2D side-scrolling game where players control Darna,'
                    'the iconic Filipino superheroine, by tapping on the screen to make her flap her wings and navigate through a series of pipes or obstacles. '
                    'The goal is to travel as far as possible without colliding with any obstacles.',
                    style: fontStyleText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Our Mission:',
                    style: fontStyleTitle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "At Darna's Flight, our mission is to bring the thrill of gaming together with the pride of Filipino heritage."
                    ' We strive to create an immersive experience that not only entertains but also celebrates the iconic Filipino superheroine, Darna.'
                    '\n Through our game, we aim to inspire players to embrace the values of courage, resilience, and heroism that Darna represents,'
                    ' empowering them to overcome obstacles and reach new heights in both the virtual world and their everyday lives.'
                    'We are committed to fostering a sense of community and camaraderie among players, uniting them in their shared love for Filipino culture and gaming.'
                    ' By incorporating elements of Filipino mythology, folklore, and tradition into our gameplay, we seek to promote cultural awareness and appreciation among players of all backgrounds. '
                    '\n\n Ultimately, our mission is to create a gaming experience that not only entertains but also uplifts and inspires, leaving a lasting impression on players and fostering a deeper connection to the rich tapestry of Filipino heritage. Join us on this journey as we flap our wings and soar to new heights with Darna\'s Flight!"',
                    style: fontStyleText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Key Features:',
                    style: fontStyleTitle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\n Simple Controls: Players can easily control Darna\'s flight by tapping on the screen to make her fly.'
                    'The longer the player taps, the higher Darna flies, allowing them to maneuver through obstacles with precision.\n'
                    '\n Authentic Filipino Theme: The game features vibrant visuals and sound effects that celebrate Filipino culture and heritage. From the serene beauty of provincial landscapes, "Flappy Darna" immerses players in an authentic Filipino gaming experience.\n'
                    '\n Darna\'s Flight offers addictive gameplay, colorful graphics, and a touch of Filipino charm, making it an enjoyable and culturally enriching gaming experience for players of all ages. Whether you are a fan of Darna or simply love casual mobile games, " Darna\'s Flight" is sure to entertain and inspire.',
                    style: fontStyleText,
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
