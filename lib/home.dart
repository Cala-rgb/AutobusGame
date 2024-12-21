import 'package:autobus_game/gamemodes/easy_mode.dart';
import 'package:autobus_game/gamemodes/extreme_mode.dart';
import 'package:autobus_game/shared/textstyles.dart';
import 'package:autobus_game/widgets/how_to_play_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gamemodes/hard_mode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("The Autobus",
          style: CustomTextStyle.customText,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight*0.2,),
              Text(
                  "Choose a mode!",
                style: CustomTextStyle.customText4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(height: 10,thickness: 2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      backgroundColor: Colors.red[600],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EasyMode()));
                    },
                    child: Text("Easy",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.red[600],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HardMode()));
                    },
                    child: Text("Hard",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.red[600],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExtremeMode()));
                    },
                    child: Text("Extreme",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(height: 10,thickness: 2,),
              ),
              HowToPlayButton(),
              /*ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.red[600],
                ),
                onPressed: () {},
                child: Text("How to play?",
                  style: CustomTextStyle.customText4.apply(color: Colors.white),),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
