import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/scrrens/game.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  "TIC TAC TOE",
                  style: GoogleFonts.pixelifySans(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: 5, fontSize: 40),
                  ),
                ),
              ))),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: AvatarGlow(
              startDelay: const Duration(seconds: 1),
              glowColor: Colors.purple,
              glowShape: BoxShape.circle,
              animate: true,
              curve: Curves.easeIn,
              child: Material(
                  elevation: 4.0,
                  shape: const CircleBorder(),
                  color: Colors.purple,
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('lib/tic-tac-toe.png'),
                  )),
            ),
          )),
          Expanded(
              child: SizedBox(
                  child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(28, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const GameScreen();
                  }));
                },
                child: Text(
                  "start game",
                  style: GoogleFonts.pixelifySans(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: 5, fontSize: 40),
                  ),
                ),
              ),
            ),
          ))),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
