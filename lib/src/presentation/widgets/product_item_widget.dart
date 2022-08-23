import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/colors.dart';

class ProductIemWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset("assets/coca.png",
                width:  double.infinity,
                fit: BoxFit.fill,
              )),

          Expanded(
              flex: 2,
              child: Container(
                color: CustomColors.main_color,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("fghfh",style: TextStyle(color:Colors.white),),
                    SizedBox(height: 5,),
                    Text("12 ريال",style: TextStyle(color:Colors.white))
                  ],
                ),
              )
          )],
      ),
    );
  }

}