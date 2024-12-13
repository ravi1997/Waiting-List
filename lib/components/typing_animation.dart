import 'dart:async';

import 'package:flutter/material.dart';

class TypingAnimation extends StatefulWidget {
  final String text;

  const TypingAnimation({super.key, required this.text});

  @override
  State<TypingAnimation> createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation> {
  String _displayedText = "";
  late Timer _timer;
  int _currentIndex = 0;
  final Duration _typingSpeed = const Duration(milliseconds: 100);
  final Duration _delayBetweenCycles = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(_typingSpeed, (Timer timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel(); // Stop the typing timer

        // Add a delay before restarting the animation
        Future.delayed(_delayBetweenCycles, () {
          setState(() {
            _displayedText = "";
            _currentIndex = 0;
          });
          _startTypingAnimation(); // Restart the animation
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
