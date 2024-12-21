import 'package:autobus_game/shared/textstyles.dart';
import 'package:flutter/material.dart';

class HardMode extends StatefulWidget {
  const HardMode({super.key});

  @override
  State<HardMode> createState() => _HardModeState();
}

class _HardModeState extends State<HardMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hard Mode",
          style: CustomTextStyle.customText,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(

      ),
    );
  }
}
