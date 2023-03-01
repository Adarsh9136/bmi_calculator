import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final int male;
  final int height;
  final int weight;
  final int age;
  const ReportPage({Key? key,required this.male,required this.height,required this.weight, required this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      double he=(height/100) as double;
      double value= (weight/(he*he)) as double;
      String bmi=value.toStringAsFixed(2);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String status;
    var bio;
    //in case of male
    if(male==1){
      if(value<18.5){
        status="UNDERWEIGHT";
        bio="Bad! Your weight is less. So, you have to take a good diet.";
      }else if(value>18.5&&value<24.9){
        status="NORMAL";
        bio="Good Job! You Have a normal body weight.";
      }
      else if(value>25.0&&value<29.9){
        status="OVERWEIGHT";
        bio="Bad! Your weight is high. So, you have to take a good diet.";
      }else if(value>30.0&&value<34.9){
        status="OBESE";
        bio="Very Bad! Your weight is too high. So, you have to take a good diet.";
      }else {
        status="EXTREMLY OBESE";
        bio="Very Bad! Your weight is exteremly high. So, you have to take a good diet.";
      }
    }

    ///in case of female
    else{
      if(value<18.5){
        status="UNDERWEIGHT";
        bio="Bad! Your weight is less. So, you have to take a good diet.";
      }else if(value>18.5&&value<24.9){
        status="NORMAL";
        bio="Good Job! You Have a normal body weight.";
      }
      else if(value>25.0&&value<29.9){
        status="OVERWEIGHT";
        bio="Bad! Your weight is high. So, you have to take a good diet.";
      }else if(value>30.0&&value<34.9){
        status="OBESE";
        bio="Very Bad! Your weight is too high. So, you have to take a good diet.";
      }else {
        status="EXTREMLY OBESE";
        bio="Very Bad! Your weight is exteremly high. So, you have to take a good diet.";
      }
    }
    // if("NORMAL"==status){
    //   if(age<19&&value>18.5&&value<24.9){
    //     bio="Good Job! You Have a normal body weight.";
    //   }
    // }else{
    //
    // }

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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: w,
              height: h*0.7,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  Text(
                    "$status",style: TextStyle(
                      fontSize: 30,
                    color: status=="NORMAL" ? Colors.green : Colors.red,
                  ),
                  ),
                  SizedBox(height: 100,),
                  Text("$bmi",style: TextStyle(
                    fontSize: 60,
                    color: Colors.white
                  ),),
                  SizedBox(height: 70,),
                  Container(
                    width: w*0.8,
                    child: Text("$bio",style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70
                    ),),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 1*w,
                height: 0.1*h,
                decoration: BoxDecoration(
                  color: status=="NORMAL" ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("RE-CALCULATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),)),

              ),
            ),

      ),

    );
  }
}
