import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mad_mtr/Barriers.dart';
import 'package:mad_mtr/SplashScreen.dart';
import 'package:mad_mtr/birdController.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static double birdY = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdY;
  late AssetsAudioPlayer _assetsAudioPlayer;
  late AssetsAudioPlayer _clickAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _clickAudioPlayer = AssetsAudioPlayer();
  }

  List<double> barriersX = [2, 3, 4.5];
  List<double> barrierHitPointPairX = [0.10, -0.05];
  List<List<double>> barriersHitPointPairsY = [
    [0.19, -0.52],
    [0.52, -0.19],
    [0.19, -0.52],
  ];
  int score = 0;
  int best = 0;

  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
    _clickAudioPlayer.open(
      Audio('assets/audio/click.wav'),
      showNotification: false,
    );
  }

  bool birdDead() {
    if (birdY > 1 || birdY < -1) {
      gameHasStarted = false;
      return true;
    }
    for (var i = 0; i < barriersX.length; i++) {
      if (barriersX[i] <= barrierHitPointPairX[0] &&
          barriersX[i] >= barrierHitPointPairX[1]) {
        if (birdY > barriersHitPointPairsY[i][0] ||
            birdY < barriersHitPointPairsY[i][1]) {
          return true;
        }
      }
    }
    return false;
  }

  void _showDialog() {
    _assetsAudioPlayer.stop();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        _assetsAudioPlayer.open(
          Audio('assets/audio/fall.wav'),
          showNotification: false,
        );
        return AlertDialog(
          title: const Center(
            child: Text('G A M E  O V E R ! '),
          ),
          titleTextStyle: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'PixelGamerPersonalUse-rg61L'),
          contentTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Score: " + score.toString()),
              const SizedBox(height: 2),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const SplashScreen(),
                    ));
                  },
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 3, 3),
                        fontSize: 16,
                        fontFamily: 'PixelGamerPersonalUse-rg61L',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    resetGame();
                    Navigator.of(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.refresh,
                          color: Color.fromARGB(255, 0, 0, 0), size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Play Again',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'PixelGamerPersonalUse-rg61L',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void startGame() {
    double gravity = -3;
    double velocity = 2;
    _assetsAudioPlayer.open(
      Audio('assets/audio/bg.mp3'),
      showNotification: false,
    );
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialHeight - height;
      });

      for (var i = 0; i < barriersX.length; i++) {
        if (barriersX[i] == -2) {
          setState(() {
            barriersX[i] += 4;
          });
        } else {
          setState(() {
            barriersX[i] -= 0.05;
          });
        }
      }

      for (var i = 0; i < barriersX.length; i++) {
        barriersX[i] = double.parse((barriersX[i]).toStringAsFixed(4));
      }

      for (var i = 0; i < barriersX.length; i++) {
        if (barriersX[i] == 0) {
          setState(() {
            score += 1;
          });
        }
      }

      if (birdDead()) {
        timer.cancel();
        _showDialog();
      }

      time += 0.05;
    });
  }

  void resetGame() {
    Navigator.pop(context);

    _assetsAudioPlayer.stop();

    if (score > best) {
      setState(() {
        best = score;
      });
    }

    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      height = 0;
      initialHeight = height;

      for (var i = 0; i < barriersX.length; i++) {
        barriersX[i] = i + 2;
      }

      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 650,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bground.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0.2, birdY),
                    duration: const Duration(milliseconds: 0),
                    child: const Bird(),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: gameHasStarted
                        ? const Text("")
                        : const Text(
                            "T A P  T O  P L A Y",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'PixelGamerPersonalUse-rg61L'),
                          ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[0], 1.1),
                    child: Barrier(size: 250),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[0], -1.1),
                    child: Barrier(size: 200),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[1], 1.1),
                    child: Barrier(size: 180),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[1], -1.1),
                    child: Barrier(size: 300),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[2], 1.1),
                    child: Barrier(size: 300),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(barriersX[2], -1.1),
                    child: Barrier(size: 210),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(205, 138, 51, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        iconColor: Colors.white,
                        padding: const EdgeInsets.all(30),
                        shape: const CircleBorder(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          score.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "BEST SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          best.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
