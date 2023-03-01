import 'dart:async';
import 'dart:ui';
import 'package:bmi_calculator/report_page.dart';
import 'package:flutter/material.dart';
import 'report_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _weight=50;
  int _age=25;
  int valueHolder = 150;
  int male=1;
  int female=0;
  int ft=5;
  int inch=0;
  int inche=0;
  double cm=60*2.54;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.4),
        title: Center(
          child: Text("BMI CALCULATOR",style: TextStyle(
            color: Colors.white,
            fontSize: 25
          ),),
        ),

      ),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                      male=1;
                      female=0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 0.45*w,
                    height: 0.25*h,
                    decoration: BoxDecoration(
                      color: male==1 ? Colors.grey : Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male,
                        size: 80,
                        color: Colors.white,),
                        Text("MALE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.blueGrey
                        ),)
                      ],
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    male=0;
                    female=1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 0.45*w,
                    height: 0.25*h,
                    decoration: BoxDecoration(
                      color: male==0 ? Colors.grey : Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,
                          size: 80,
                          color: Colors.white,),
                        Text("FEMALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            color: Colors.blueGrey,
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: w,
              height: 0.2*h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueGrey
                    ),),
                  Text('$valueHolder cm', style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                      child: Slider(
                          value: valueHolder.toDouble(),
                          min: 0,
                          max: 300,
                          divisions: 300,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          label: '${valueHolder.round()}',
                          onChanged: (double newValue) {
                            setState(() {
                              valueHolder = newValue.round();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()}';
                          }
                      )),
                ],
              ),

            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 0.45*w,
                  height: 0.25*h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey
                        ),),
                      Text("$_weight kg",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                if(_weight>0){
                                  _weight--;
                                }
                              });
                          },
                            onTapDown: (TapDownDetails details) {
                              timer = Timer.periodic(Duration(milliseconds: 80), (t) {
                                setState(() {
                                  if(_weight>0){
                                    _weight--;
                                  }
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              timer.cancel();
                            },
                            onTapCancel: () {
                              timer.cancel();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 60,
                                height:60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                _weight++;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              timer = Timer.periodic(Duration(milliseconds: 80), (t) {
                                setState(() {
                                  _weight++;
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              timer.cancel();
                            },
                            onTapCancel: () {
                              timer.cancel();
                            },
                            child: Container(
                              width: 60,
                              height:60,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 0.45*w,
                  height: 0.25*h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey
                        ),),
                      Text("$_age years",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                if(_age>0){
                                  _age--;
                                }
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              timer = Timer.periodic(Duration(milliseconds: 80), (t) {
                                setState(() {
                                  if(_age>0){
                                    _age--;
                                  }
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              timer.cancel();
                            },
                            onTapCancel: () {
                              timer.cancel();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 60,
                                height:60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                  _age++;
                              });
                            },
                            onTapDown: (TapDownDetails details) {
                              timer = Timer.periodic(Duration(milliseconds: 80), (t) {
                                setState(() {
                                  if(_age>0){
                                    _age++;
                                  }
                                });
                              });
                            },
                            onTapUp: (TapUpDetails details) {
                              timer.cancel();
                            },
                            onTapCancel: () {
                              timer.cancel();
                            },
                            child: Container(
                              width: 60,
                              height:60,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ],
          ),
        ],
      ),
        drawer: Drawer(
          backgroundColor:Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text("Unit Converter",style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )),
                Row(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: w*0.35,
                        height: 0.2*h,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$ft ft",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white
                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      if(ft>0){
                                        ft--;
                                        inche=((ft*12)+inch);
                                        cm=inche*2.54;

                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height:40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      ft++;
                                      inche=((ft*12)+inch);
                                      cm=inche*2.54;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height:40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: w*0.35,
                        height: 0.2*h,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$inch inch",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white
                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      if(inch>0)
                                        {
                                          inch--;
                                          inche=((ft*12)+inch);
                                          cm=inche*2.54;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height:40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      inch++;
                                      inche=((ft*12)+inch);
                                      cm=inche*2.54;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height:40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                      ),
                    ),


                  ],
                ),
                Text("= $cm cm",style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )),
                SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text("Designed by Adarsh",style: TextStyle(
                      color:Colors.grey,
                      fontSize: 15
                  )),
                ),
              ],
            ),

          )
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReportPage(
                      male: male,
                      height: valueHolder,
                      weight: _weight,
                      age: _age
                  )
              ),
              );
            },
            child: Container(
              width: 1*w,
              height: 0.1*h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),)),

            ),
          ),
        )

    );
  }
}

//    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),

