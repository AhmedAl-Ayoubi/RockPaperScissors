import 'dart:math';

import 'package:flutter/material.dart';

class RockPaperScissors extends StatefulWidget {
  // const RockPaperScissors({Key? key}) : super(key: key);




  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  Icon iconUser = Icon(Icons.person);
  Icon iconMobile = Icon(Icons.close);


  List iconsList=[];



  List<String> images =["images/rock.jpg","images/paper.jpg","images/scrissors.jpg"];
  int numUser =0 ;
  int numMobile = 0 ;
  String winStatus= "draw";
  int roundCount=0;
  String getRandomValues(){
      numUser=Random().nextInt((images.length));
      numMobile=Random().nextInt((images.length));
      String s ="";

      if(numUser==numMobile){
        // winStatus= "draw";
        s = "draw";
      }
      else if((numUser==1&&numMobile==2)||(numUser==2&&numMobile==0)||(numUser==0&&numMobile==1))
      {
        // winStatus ="mobile";
        s ="mobile";
      }
      else{
        // winStatus="user";
        s="user";
      }

      iconsList.add( s=="user"?Icon(Icons.data_exploration_sharp):Icon(Icons.dark_mode));
      print(s +" $roundCount");
    return s;
  }
  Icon getIconWinner (String winner){
  if(winner=="mobile"){
    return iconMobile ;
  }
    else return iconUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[600],
      appBar: AppBar(
        centerTitle: true,
        title: Text('RockPaperScissors'),
        backgroundColor: Colors.indigo[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // ...iconsList.take(roundCount).map((e) => e).toList(),
                  for (int i = 0; i < roundCount; i++)
                    iconsList[i],

                ],


              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          getRandomValues();
                          // print(userNum);
                          roundCount++;
                          if(roundCount==13){
                            roundCount=0;
                          }
                        });
                      },
                      child: CircleAvatar(
                        backgroundImage:  AssetImage(images[numUser]),
                        radius: 80,
                      ),
                    ),
                    Text("You",style: TextStyle(fontSize: 48,color: Colors.white),)
                  ],
                ),
                Text("VS",style: TextStyle(fontSize: 30,color: Colors.white),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:  AssetImage(images[numMobile]),
                      radius: 80,
                    ),
                    Text("Mobile",style: TextStyle(fontSize: 48,color: Colors.white),)

                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
