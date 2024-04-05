import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/gameprovider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<GameProvider>(
        builder: (BuildContext context, gameProvider, Widget? child) {
          return Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Player X",
                            style: GoogleFonts.pixelifySans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 5,
                                  fontSize: 25),
                            ),
                          ),
                          Text(
                            "${gameProvider.xscore}",
                            style: GoogleFonts.pixelifySans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 5,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Player O",
                            style: GoogleFonts.pixelifySans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 5,
                                  fontSize: 25),
                            ),
                          ),
                          Text(
                            "${gameProvider.oscore}",
                            style: GoogleFonts.pixelifySans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 5,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                flex: 3,
                child: SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                        itemCount: gameProvider.xAndo.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              gameProvider.tapped(index, context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade900, width: 3),
                              ),
                              child: Center(
                                child: Text(
                                  gameProvider.xAndo[index],
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          );
        },
      ),
    );
  }
}
