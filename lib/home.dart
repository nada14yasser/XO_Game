import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo_game/view.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static var myFont = GoogleFonts.gaegu(
      textStyle: TextStyle(color: Colors.black,letterSpacing: 2,fontSize: 30)
  );
  static var myWhiteFont = GoogleFonts.gaegu(
      textStyle: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 30)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                child: Center(
                  child: Text('Tic Tac Toe !!',style: myWhiteFont,),
                ),
              )
          ),
          Expanded(
            flex: 2,
              child: Container(
                child: AvatarGlow(
                  endRadius: 250,
                  duration: Duration(seconds:3),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 1),
                  startDelay: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none
                      ),
                      shape: BoxShape.circle
                    ),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.grey[700],
                        child: Container(
                          child: Image.asset(
                            'assets/images/reddxo.png',
                            color: Colors.white,
                            fit: BoxFit.scaleDown,),
                        ),
                      )),
                )
              )
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(bottom:100),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Center(
                  child: Text('Play Game',style: myFont,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
