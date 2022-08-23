
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/colors.dart';
import 'package:project/src/presentation/manager/shared.dart';
import 'package:project/src/presentation/pages/home_screen.dart';

class SubmitSuccessfulScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubmitSuccessfulScreenState();
  }

}
class SubmitSuccessfulScreenState extends State<SubmitSuccessfulScreen>{



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
               "استلام الطلب",
                style: TextStyle(color: Colors.black , fontWeight: FontWeight.normal),
              ),
              automaticallyImplyLeading: false,
            ),
            body:Center(
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.15),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const SizedBox(height: 8),
                          Text("تهانينا!",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "تم انشاء الطلب بنجاح",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ' #ON3453653546534  ${"رقم الطلب"} ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width * 0.15),
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.green)
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width * 0.2),

                        ],
                      ),

                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: CustomColors.main_color,
                        borderRadius: BorderRadius.circular(10)),
                    child:FlatButton(
                        child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight:  FontWeight.bold),),
                        color: CustomColors.main_color,

                        onPressed: () {
                          Shared.shopping_cart_items = [];
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                              (context)=>HomeScreen()));
                        },
                    ) )
                    ],
                  ),
                )
              ),
            ));
  }
}