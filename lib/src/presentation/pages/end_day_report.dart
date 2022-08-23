import 'package:flutter/material.dart';

class EndDayReport extends StatelessWidget {
  List<BillContentModel> bill_list = [
    BillContentModel(
        name: "ملح",
        qty: 5,
        payment: "نقدى",
      total: 430
    ),
    BillContentModel(
        name: "ملح",
        qty: 5,
        payment: "Stc Pay",
        total: 430
    ),
    BillContentModel(
        name: "ملح",
        qty: 5,
        payment: "اجل",
        total: 430
    ),

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Text(
                                      "تقرير نهاية اليوم",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        Expanded(
                          flex: 7,
                          child:
                             Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  border: Border.all(color: Colors.black)),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex:2,
                                                child: Text("تاريخ التقرير",
                                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Text("وقت التقرير",
                                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                            ),
                                            Expanded(
                                                flex:1,
                                                child: Text("اليوم",
                                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex:2,
                                                child: Text("03/02/2020",
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)
                                            ),
                                            Expanded(
                                                flex:2,
                                                child: Text("04:25 ص",
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)
                                            ),
                                            Expanded(
                                                flex:1,
                                                child: Text("الاحد",
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)
                                            ),
                                          ],
                                        )
                                      ],
                                    ),),

                                   Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                 child:Row(
                                   children: [
                                     Expanded(
                                         flex:1,
                                         child: Text("اسم الكاشير",
                                           style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                     ),
                                     Expanded(
                                         flex:2,
                                         child: Text("اسم موظف الكاشير",
                                           style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                     ),

                                   ],
                                 ),
                                 ),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                      child:Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Text("رقم الجهاز",
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                          ),
                                          Expanded(
                                              flex:2,
                                              child: Text("354665756888",
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                      child:Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: Text("حالة الوردية",
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                          ),
                                          Expanded(
                                              flex:2,
                                              child: Text("مغلقة",
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
                                          ),

                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.black,endIndent: 20,indent: 20),


                                  Container(
                                            child: Column(
                                                children: [
                                                  Container(
                                                      color: Colors.grey.shade400,
                                                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                            flex:2,
                                                            child: Text("الصنف",
                                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                                        ),
                                                        Expanded(
                                                            flex:2,
                                                            child: Text("الكمية",
                                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                                                        ),
                                                        Expanded(
                                                            flex:3,
                                                            child: Text("طريقة الدفع",
                                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                                                        ),
                                                        Expanded(
                                                            flex:2,
                                                            child: Text("الاجمالى",
                                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                                                        ),
                                                      ],
                                                    ),
                                                    )  ),

                                                  ListView.builder(
                                                      itemCount: bill_list.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context,index){
                                                        return Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,

                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,

                                                              children: [
                                                                Expanded(
                                                                    flex:2,
                                                                    child: Text("${bill_list[index].name}")
                                                                ),
                                                                Expanded(
                                                                    flex:2,
                                                                    child: Text("${bill_list[index].qty}")
                                                                ),
                                                                Expanded(
                                                                    flex:2,
                                                                    child: Text("${bill_list[index].payment}")
                                                                ),
                                                                Expanded(
                                                                    flex:2,
                                                                    child: Text("${bill_list[index].total}")
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(color: Colors.black,endIndent: 10,indent: 10),

                                                          ],
                                                        ),);
                                                      }),

                                                ],
                                              ),

                                        ),

                                    Container(
                                        color: Colors.grey.shade400,
                                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                            Text("طريقة الدفع",
                                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                              ,
                                            Text("المدفوعات",
                                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)

                                            ],
                                          ),
                                        )  ),
                               Container(
                                 child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                                   child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       Text("نقد"),
                                      Text("27"),
                                      ],
                                   ))),
                                    Divider(color: Colors.black,endIndent: 20,indent: 20),
                                    shoppingCartTotal(),
                                  ],
                                ),
                              ),
                            ),
                          ),





                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: [
                                  Divider(),
                                  Text(
                                    "طباعة الفاتورة",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                   /*     Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.grey.shade200,
                            )),*/

                      ],
                    ),
                  ))));
    });
  }

  Widget shoppingCartTotal(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("المجموع",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

              Text("20 ر.س",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الضرائب",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

              Text("10 ر.س",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الاكراميات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

              Text("10 ر.س",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),

            ],
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الاجمالى",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  Text("30 ر.س",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                ],
              ) ),
        ],
      ),);
  }

}
class BillContentModel {
  var name;
  var qty;
  var payment;
  var total;
  BillContentModel({this.name,this.qty,this.payment , this.total});
}
