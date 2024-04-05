import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<String> xAndo = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int filled = 0;
  bool xturn = true;
  int xscore = 0;
  int oscore = 0;
  void tapped(int index, BuildContext context) {
    if (xturn == true && xAndo[index] == "") {
      xAndo[index] = "X";
      xturn = !xturn;
      filled += 1;
    } else if (xturn == false && xAndo[index] == "") {
      xAndo[index] = "O";
      xturn = !xturn;
      filled += 1;
    }

    notifyListeners();
    checkwinner(context);
  }

  void checkwinner(BuildContext context) {
    if (xAndo[0] == xAndo[1] && xAndo[0] == xAndo[2] && xAndo[0] != "") {
      alert("winner is Player${xAndo[0]}", context, xAndo[0]);
    }
    if (xAndo[0] == xAndo[3] && xAndo[0] == xAndo[6] && xAndo[0] != "") {
      alert("winner is Player${xAndo[0]}", context, xAndo[0]);
    }
    if (xAndo[3] == xAndo[4] && xAndo[3] == xAndo[5] && xAndo[3] != "") {
      alert("winner is Player${xAndo[3]}", context, xAndo[3]);
    }
    if (xAndo[6] == xAndo[7] && xAndo[6] == xAndo[8] && xAndo[6] != "") {
      alert("winner is Player${xAndo[6]}", context, xAndo[6]);
    }
    if (xAndo[1] == xAndo[4] && xAndo[1] == xAndo[7] && xAndo[1] != "") {
      alert("winner is Player${xAndo[1]}", context, xAndo[1]);
    }
    if (xAndo[2] == xAndo[5] && xAndo[2] == xAndo[8] && xAndo[2] != "") {
      alert("winner is Player${xAndo[2]}", context, xAndo[2]);
    }
    if (xAndo[0] == xAndo[4] && xAndo[0] == xAndo[8] && xAndo[0] != "") {
      alert("winner is Player${xAndo[0]}", context, xAndo[0]);
    }
    if (xAndo[2] == xAndo[4] && xAndo[2] == xAndo[6] && xAndo[2] != "") {
      alert("winner is Player${xAndo[2]}", context, xAndo[2]);
    } else if (filled == 9) {
      alert("Its a Draw", context, "");
    }
  }

  dynamic alert(String text, BuildContext context, String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  clearboard();
                },
                child: const Text("play again"))
          ],
        );
      },
    );

    if (winner == "O") {
      oscore += 1;
    } else if (winner == "X") {
      xscore += 1;
    }

    notifyListeners();
  }

  void clearboard() {
    xAndo = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    filled = 0;
    notifyListeners();
  }
}
