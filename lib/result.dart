import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'dart:math';
class Result extends StatelessWidget {
  double bmiresult;
  String bmistatus;
  String bmiqquote;
  Result({Key? key,required this.bmiresult,required this.bmistatus,required this.bmiqquote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(child: Text('Your  Result',style: TextStyle(fontSize: 40),)),
          Expanded(flex: 1,child: Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xff111328),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmistatus,style: TextStyle(
                    fontSize: 30,color: Colors.green
                  ),),
                  Text(bmiresult.toStringAsFixed(1),style: TextStyle(
                    fontSize: 50
                  ),),
                  Text(bmiqquote,style: TextStyle(fontSize: 30,),textAlign: TextAlign.center,)
                ],
              ),
            ),
          )),
          FirstRoute(),
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.only(top:10),
        width: double.infinity,
        height: 80,
        child: Center(child: Text('Re-Calculate'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20)),),
      ),
      onTap: (){
        print('tap');
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      },
    );
  }
}

class BmiCalculate{
  double height;
  int weight;
  BmiCalculate({required this.height,required this.weight});
  double _bmi=0.0;
  double getbmi(){
    _bmi=weight/pow(height,2);
    return _bmi;
  }
  String getResult(){
    if(_bmi>=25){
      return 'overweight';
    }else if(_bmi>18){
      return 'Normal';
    }else{
      return 'underweight';
    }
  }
  String getquote(){
    if(_bmi>=25){
      return 'you have higher weight than a normal body weight.try to exercise more.';
    }else if(_bmi>18){
      return 'you have a normal body weight.Good job';
    }else{
      return 'you have lower weight than a normal body weight.try to eat more';
    }
  }
}