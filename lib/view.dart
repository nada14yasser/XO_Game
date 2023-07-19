import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{

  bool oTurn = true;
  List<String> displayxo = ['','','','','','','','',''];
  var myTextStyle = TextStyle(color: Colors.white,fontSize: 30);
  int oScore = 0;
  int xScore = 0;
  int filledBox = 0;
  static var myFont = GoogleFonts.gaegu(
    textStyle: TextStyle(color: Colors.black,letterSpacing:1,fontSize:20)
  );
  static var winFont = GoogleFonts.gaegu(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 2,fontSize:35)
  );
  static var myWhiteFont = GoogleFonts.gaegu(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 30)
  );
  static var playAgainFont = GoogleFonts.gaegu(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 20)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O',style: myWhiteFont,),
                          SizedBox(height: 20,),
                          Text('$oScore',style: myWhiteFont,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X',style: myWhiteFont,),
                          SizedBox(height: 20,),
                          Text('$xScore',style: myWhiteFont,),
                        ],
                      ),
                    ),                  ],
                ),
              )
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder:(BuildContext context,int i)=>
                      GestureDetector(
                        onTap:(){
                          tapped(i);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade700)
                          ),
                          child: Center(
                            child: Text('${displayxo[i]}',style: const TextStyle(color: Colors.white,fontSize: 40),),
                          ),
                        ),
                      )
              ),
            ),
          ),
          Expanded(
              child: Container(
                child: Center(
                  child: Text('Tic Tac Toe !!',style: myWhiteFont,),
                ),
              )
          ),
        ],
      ),
    );
  }
  void tapped(int index){
    setState(() {
      if(oTurn && displayxo[index] == ''){
        displayxo[index] ='o';
        filledBox += 1;
      }else if(!oTurn && displayxo[index] == ''){
        displayxo[index] ='x';
        filledBox += 1;
      }
      oTurn = !oTurn;
      checkWinner();
    });
  }
  void checkWinner(){
    if(displayxo[0] == displayxo[1]&&
        displayxo[0] == displayxo[2]&&
        displayxo[0] != ''){
      showWinDialog(displayxo[0]);
    }
    if(displayxo[3] == displayxo[4]&&
        displayxo[3] == displayxo[5]&&
        displayxo[3] != ''){
      showWinDialog(displayxo[3]);
    }
    if(displayxo[6] == displayxo[7]&&
        displayxo[6] == displayxo[8]&&
        displayxo[6] != ''){
      showWinDialog(displayxo[6]);
    }
    if(displayxo[0] == displayxo[3]&&
        displayxo[0] == displayxo[6]&&
        displayxo[0] != ''){
      showWinDialog(displayxo[0]);
    }
    if(displayxo[1] == displayxo[4]&&
        displayxo[1] == displayxo[7]&&
        displayxo[1] != ''){
      showWinDialog(displayxo[1]);
    }
    if(displayxo[2] == displayxo[5]&&
        displayxo[2] == displayxo[8]&&
        displayxo[2] != ''){
      showWinDialog(displayxo[2]);
    }
    if(displayxo[6] == displayxo[4]&&
        displayxo[6] == displayxo[2]&&
        displayxo[6] != ''){
      showWinDialog(displayxo[6]);
    }
    if(displayxo[0] == displayxo[4]&&
        displayxo[0] == displayxo[8]&&
        displayxo[0] != ''){
      showWinDialog(displayxo[0]);
    }
    else if(filledBox == 9){
      showDrawDialog();
    }
  }
  void showWinDialog(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
                width:60,
                height:40,
                decoration: new BoxDecoration(
                  color: const Color(0xFFFFFF),
                  borderRadius: new BorderRadius.all(new Radius.circular(20)),
                ),
                child: Center(child: Text('Winner is: '+ winner,style: winFont,))),
            actions: [
              // TextButton(
              //     onPressed:(){
              //       clearBoard();
              //       Navigator.of(context).pop();
              //     },
              //     child: Text('Play Again',style: myFont,))
              GestureDetector(
                onTap: (){
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Container(
                    width: 150,
                    height:30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade800
                    ),
                    child: Center(
                      child: Text('Play Again',style: playAgainFont,),
                    ),
                  ),
                ),
              ),
            ],
          );
        });

    if(winner == 'o'){
      oScore+=1;
    }else if(winner == 'x'){
      xScore+=1;
    }
  }
  void showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
              width: 60,
                height: 40,
                decoration: new BoxDecoration(
                  color: const Color(0xFFFFFF),
                  borderRadius: new BorderRadius.all(new Radius.circular(20)),
                ),
                child: Center(child: Text('Draw',style: winFont,))),
            actions: [
              // TextButton(
              //     onPressed:(){
              //       clearBoard();
              //       Navigator.of(context).pop();
              //     },
              //     child: Text('Play Again',style: myFont,))
              GestureDetector(
                onTap: (){
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Container(
                    width: 150,
                    height:30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade800
                    ),
                    child: Center(
                      child: Text('Play Again',style: playAgainFont,),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
  void clearBoard(){
    setState(() {
      for(int i=0; i<9;i++){
        displayxo[i] = '';
      }
      setState(() {
        filledBox = 0;
      });
    });
  }
}
