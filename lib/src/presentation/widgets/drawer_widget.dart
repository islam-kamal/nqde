
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/safe_area/page_container.dart';
import 'package:project/src/presentation/pages/customer_screen.dart';
import 'package:project/src/presentation/pages/end_day_report.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var current_index;
var height , width;

var drawer_list = ['العملاء','الموردين','حساب الاجل','الطاولات','الطاولات',
                    'مزامنة البيانات','التعليمات','الدعم الفني','نهاية اليوم  12/12/2022','المزيد'];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Theme(
        data: Theme.of(context).copyWith(
      canvasColor: Colors.grey.shade200, //This will change the drawer background to blue.
      //other styles
    ),
    child: Drawer(
      child:  PageContainer(
          child: SingleChildScrollView(
              child: Container(
                height: height,
                color: Colors.grey.shade200,
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl ,
                    child:  Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child:   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Container(
                                    child: Text("القائمة الرئيسية",
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  ),
                                  InkWell(
                                    child:    Container(
                                      child: Text("الغاء",
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                    ),
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  )

                                ],
                              ),
                            ),
                            SizedBox(height: width * 0.07,
                              child: Container(color: Colors.grey.shade200,),),
                            Container(
                              color:  Colors.white,
                              padding: EdgeInsets.only(right: width * .01, left: width * .01),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(5),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  drawer_list.length ,
                                  itemBuilder: (context,ind){
                                    return InkWell(
                                        onTap: () {
                                          switch(drawer_list[ind]){
                                            case 'العملاء':
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerScreen()));
                                              break;
                                            case 'نهاية اليوم  12/12/2022':
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return EndDayReport();
                                                  });
                                              break;
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(child:Container(
                                                  margin: const EdgeInsets.all(3.0),
                                                  padding: const EdgeInsets.all(10.0),
                                                  width: double.infinity,
                                                  child: Text(drawer_list[ind],
                                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),


                                                ) ),
                                                Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                            Divider(height:5 ,thickness: 1,)
                                          ],
                                        ),

                                       );



                                  }),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
          ),

      )
    ));
  }
}
