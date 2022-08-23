
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/colors.dart';
import 'package:project/src/presentation/pages/cart_shopping_screen.dart';
class MealAdditionsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MealAdditionsScreenState();
  }

}
class MealAdditionsScreenState extends State<MealAdditionsScreen>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("برجر لحم",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
        centerTitle: true,
        elevation: 0,

        leading: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),

      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                children: [
                  title_item("الاضافات"),

                  row_item(
                    frist: "دبل جبنه",
                    second: "12 ريال",
                    third: true
                  ),

                  title_item("الاحجام"),

                  row_item(
                      frist: "3 شرائح لحم",
                      second: "12 ريال",
                      third: false
                  ),
                  SizedBox(height: 10,),
                  row_item(
                      frist: "شريحتين لحم",
                      second: "12 ريال",
                      third: false
                  ),
                  title_item("جلب من الدش بورد"),

                  row_item(
                      frist: "من الدش بورد",
                      second: "12 ريال",
                      third: false
                  ),

                  title_item("السمات "),

                  row_item(
                      frist: "اسم السمه",
                      second: "12 ريال",
                      third: false
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.15,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            color: CustomColors.main_color,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:  FlatButton(
                          child: Text("تم",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 25),),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => CartShoppingScreen()));
                          },
                        ),
                      )),
                ],

            ),
          )
        ),
      ),
    );
  }

  Widget row_item({var frist , var second , var third}){
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.width * 0.13,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:   Text("${frist}",
              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
          ),
          Expanded(
            flex: 1,
            child:   Text("${second}",
              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
          ),
          Expanded(
            flex: 1,
            child: third  ?Center(
              child: Icon(Icons.check),
            ) :  Text(""),
          ),

        ],
      ),
    );
  }

  Widget title_item(var input){
    return     Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:  Text("$input",

          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}