import 'package:flutter/material.dart';
import 'package:bmi_calculator/result.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Color activeColor=Color(0xff111328);
  Color maleColor=Color(0xff111328);
  Color femaleColor=Color(0xff111328);
  double height=180;
  int weight=60;
  int age=12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
        centerTitle: true,
      ),
      body: Column(
          children:[
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    print("male");
                    setState((){
                      maleColor=Colors.green;
                      femaleColor=Color(0xff111328);
                    });
                  },
                  child: Box(parchild: gender(
                    title: 'male'.toUpperCase(),genderIcon: Icon(Icons.male,size: 80,),
                  ),BoxColor:maleColor),
                )),
                Expanded(child: GestureDetector(
                  onTap: (){
                    print("female");
                    setState((){
                      femaleColor=Colors.green;
                      maleColor=Color(0xff111328);
                    });
                  },
                  child: Box(parchild: gender(
                      title: 'female'.toUpperCase(),genderIcon: Icon(Icons.female,size: 80)
                  ),BoxColor:femaleColor),
                )),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('height'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toInt().toString(),style: TextStyle(color: Colors.white,fontSize: 30),),
                          Text('cm'),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Colors.green,
                            activeTrackColor: Colors.white,
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(value: height.toDouble(), onChanged: (double value){
                          setState((){
                            height=value;
                          });
                        },min: 120.0,max: 220.0,inactiveColor: Color(0xff8D8E98),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 150,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Weight'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15),),
                        Text(weight.toString(),style: TextStyle(color: Colors.white,fontSize: 30),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: IconButton(onPressed: (){
                              setState((){
                                weight--;
                              });
                            }, icon: Icon(Icons.remove)),decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),),
                            Container(child: IconButton(onPressed: (){
                              setState((){
                                weight++;
                              });
                            }, icon: Icon(Icons.add)),decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 150,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Age'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15),),
                        Text(age.toString(),style: TextStyle(color: Colors.white,fontSize: 30),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: IconButton(onPressed: (){
                              setState((){
                                age--;
                              });
                            }, icon: Icon(Icons.remove)),decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),),
                            Container(child: IconButton(onPressed: (){
                              setState((){
                                age++;
                              });
                            }, icon: Icon(Icons.add)),decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                            ),margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            FirstRoute(height: height/100,weight: weight,)
          ]
      ),
    );
  }
}


class Box extends StatelessWidget {
  Widget parchild;
  Color BoxColor;
  Box({Key? key,required this.parchild,required this.BoxColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: BoxColor,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: BoxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      child: parchild,
    );
  }
}

class gender extends StatelessWidget {
  String title;
  Widget genderIcon;
  gender({Key? key,required this.title,required this.genderIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          genderIcon,
          Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  double height;
  int weight;
  FirstRoute({Key? key,required this.height,required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.only(top:10),
        width: double.infinity,
        height: 80,
        child: Center(child: Text('Calculate'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20)),),
      ),
      onTap: (){
        print('tap');
        BmiCalculate humanbmi=BmiCalculate(height: height,weight: weight);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Result(bmiresult: humanbmi.getbmi(),
          bmistatus:humanbmi.getResult() ,bmiqquote: humanbmi.getquote(),)));
      },
    );
  }
}
