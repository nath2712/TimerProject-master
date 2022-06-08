import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:timer/widget/button_widget.dart';
import 'package:timer/widget/gradient_widget.dart';

class Temps extends StatefulWidget {
  const Temps({Key? key}) : super(key: key);

  @override
  _TempsState createState() => _TempsState();
  }


class _TempsState extends State<Temps> {


  // Test avec un compteur descendant
  static const countdownDuration = Duration(hours: 1, minutes: 10);
  // Fin du test


  Duration duration = Duration();
  Timer? timer;


  // Test avec un compteur descendant
  bool isCountdown = false;
  // Fin du test


  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    // millisecondes: 100
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: GradientWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 180),
            buildTime(),
            const SizedBox(height: 80),
            buildButtons(),
          ],
        ),
      ),
    ),
  );


  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inMinutes == countdownDuration.inMinutes ||
        duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          text: isRunning ? 'STOP' : 'RESUME',
          onClicked: () {
            if (isRunning) {
              stopTimer(resets: false);
            } else {
              startTimer(resets: false);
            }
          },
        ),
        const SizedBox(width: 12),
        ButtonWidget(
          text: 'RESET',
          onClicked: stopTimer,
        ),
      ],
    )

    // Bouton démarrrer
        : ButtonWidget(
      text: 'Start',
      color: Colors.black,
      backgroundColor: Colors.white,
      onClicked: () {
        startTimer();
      },
    );
  }

  Widget buildTime() {
    // Modification des durées
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Box heure
        buildTimeCard(time: hours, header: 'HEURES'),
        const SizedBox(width: 8),
        // Box minute
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(width: 8),
        // Box secondes
        buildTimeCard(time: seconds, header: 'SECONDES'),
      ],
    );
  }


  // Carré noir : Container
  // Chiffre blanc : Text
  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 72,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(header),
        ],
      );
}