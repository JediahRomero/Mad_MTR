import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Stack(
          children: const [
            BirdHead(),
          ],
        ),
      ),
    );
  }
}

class BirdHead extends StatelessWidget {
  const BirdHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 70,
      child: Image.asset('assets/images/flyy.png'),
    );
  }
}
