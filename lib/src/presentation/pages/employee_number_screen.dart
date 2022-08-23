import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/widgets/employee_number_widget.dart';

class EmployeeNumberScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmployeeNumberScreenState();
  }

}

class EmployeeNumberScreenState extends State<EmployeeNumberScreen>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Stack(
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                image: AssetImage(
                    "assets/group_dining.png"),
                fit: BoxFit.cover,
              ),
              Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                image: AssetImage(
                    'assets/sa1.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
         Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.15),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Center(
                 child: Text(
                   "الرقم الوظيفي",
                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
                 ),
               ),
               SizedBox(height:MediaQuery.of(context).size.width * 0.1 ,),

               EmployeeNumberWidget(),

    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
    child:  Container(
                 alignment: Alignment.centerRight,
                 child: Text(
                   "هل ترغب في استعادة الرقم الوظيفي؟",
                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 17),
                 ),
    ) ),
             ],
           ),
         ),)
        ],
      ),
    );
  }

}