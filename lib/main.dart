
import 'dart:math';

import 'package:dicee_flutter_starter_temp/testTemp.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: RockPaperScissors(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftPic=1;
  int rightPic=2;
  late int tempOne;
  late int tempSec;
   int numberTry=0;
  bool flag = true;
  bool flagOne = true;
  bool flagTow = true;
   late int selectedBox ;
   late int boxOneCurrantValue =1;
   late int boxOnePreValue =1 ;
   late int boxTowCurrantValue =1 ;
   late int boxTowPreValue =1;
   late int initLoop =0;
  void randMe(){
    // print("this is left $leftPic");
    // print("this is right $rightPic");
    do{
      flag = true;
      if(flagOne){
        tempOne=Random().nextInt(6)+1;
      }
      if(flagTow){
        tempSec=Random().nextInt(6)+1;
      }
      numberTry++;
      if(tempOne!=tempSec){
        if(selectedBox==1) {
          leftPic=tempOne;
          flagOne= false;
          flagTow= true;
        }
        if(selectedBox==2) {
          rightPic=tempSec;
          flagTow= false;
          flagOne= true;
        }}
        leftPic= tempOne;
        rightPic= tempSec;
      boxTowCurrantValue= rightPic;
       boxOneCurrantValue= leftPic;
        if (selectedBox==1){
      if(initLoop==0||(boxTowCurrantValue!=boxTowPreValue)){

         initLoop++;
        print('******************************************');

        print("this is number Try $numberTry");

        numberTry=0;

        print('this is initLoop= $initLoop');
        print('this is boxOneCurrantValue= $boxOneCurrantValue');
        print('this is boxOnePreValue= $boxOnePreValue');
        print('this is boxTowCurrantValue= $boxTowCurrantValue');
        print('this is boxTowPreValue= $boxTowPreValue');
        flag= false;
           boxOnePreValue=boxOneCurrantValue;
           boxTowPreValue=boxTowCurrantValue;
         }}
        else if  (selectedBox==2){
          if(initLoop==0||(boxOneCurrantValue!=boxOnePreValue)){

             initLoop++;
            print('******************************************');

            print("this is number Try $numberTry");

            numberTry=0;

            print('this is initLoop= $initLoop');
            print('this is boxOneCurrantValue= $boxOneCurrantValue');
            print('this is boxOnePreValue= $boxOnePreValue');
            print('this is boxTowCurrantValue= $boxTowCurrantValue');
            print('this is boxTowPreValue= $boxTowPreValue');
            flag= false;
            boxOnePreValue=boxOneCurrantValue;
            boxTowPreValue=boxTowCurrantValue;
          }}
        // flag= false;
      }

    while(flag);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child:
              TextButton(
                onPressed: (){
                  setState(() {
                    selectedBox=1;
                    randMe();
                  });
                },
            child: Image(image: AssetImage("images/dice$leftPic.png")),
          )),
          Expanded(child: TextButton(
            onPressed: (){
              selectedBox=2;
              setState(() {
                randMe();
              });
            },
            child: Image(image: AssetImage("images/dice$rightPic.png")),
          )),
        ],
      ),
    );
  }
}
