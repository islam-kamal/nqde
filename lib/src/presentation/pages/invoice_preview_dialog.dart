import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoicePreviewDialog extends StatelessWidget {
  List<BillContentModel> bill_list = [
    BillContentModel(
      name: "ملح 1",
      qty: 5,
      price: 23
    ),
    BillContentModel(
        name: "سكر ",
        qty: 10,
        price: 3
    ),
    BillContentModel(
        name: "فواكه ",
        qty: 3,
        price: 5
    ),
    BillContentModel(
        name: " عصير قصب",
        qty: 3,
        price: 5
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
                                      "معاينة الفاتورة",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  border: Border.all(color: Colors.black)),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 10),
                                        child: Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              border:
                                              Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Text("فاتورة ضريبة مبسطة"),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 5),
                                        child: Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              border:
                                              Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Text("رقم الفاتورة : 010000#"),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 5),
                                        child: Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              border:
                                              Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Text("اسم المتجر"),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 5),
                                        child: Container(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              border:
                                              Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Text("عنوان المتجر"),
                                        )),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.3,
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade100,
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Text(
                                              "تاريخ : 12-3-2022",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              border:
                                              Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Text(
                                            "رقم تسجيل ضريبة القيمة المضافة : 155255566666",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )),


                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child:  Container(

                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green),
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex:3,
                                                child: Text("المنتجات",
                                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                            ),
                                            Expanded(
                                                flex:1,
                                                child: Text("الكمية",
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                                            ),
                                            Expanded(
                                                flex:1,
                                                child: Text("السعر",
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                                          child: // garis putus putus
                                          Row(
                                            children: List.generate(150~/2, (index) => Expanded(
                                              child: Container(
                                                color: index%2==0?Colors.transparent
                                                    :Colors.grey,
                                                height: 2,
                                              ),
                                            )),
                                          ),
                                        ),
                                        ListView.builder(
                                            itemCount: bill_list.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (context,index){
                                              return Row(
                                                children: [
                                                  Expanded(
                                                      flex:3,
                                                      child: Text("${bill_list[index].name}")
                                                  ),
                                                  Expanded(
                                                      flex:1,
                                                      child: Text("${bill_list[index].qty}")
                                                  ),
                                                  Expanded(
                                                      flex:1,
                                                      child: Text("${bill_list[index].price}")
                                                  ),
                                                ],
                                              );
                                            }),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                                          child: // garis putus putus
                                          Row(
                                            children: List.generate(150~/2, (index) => Expanded(
                                              child: Container(
                                                color: index%2==0?Colors.transparent
                                                    :Colors.grey,
                                                height: 2,
                                              ),
                                            )),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 0),
                                            child: Container(
                                                alignment: Alignment.centerRight,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),

                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      " ضريبة القيمة المضافة" +
                                                          " (15%)",
                                                      style: TextStyle(fontSize: 12),
                                                    ),
                                                    Text(
                                                      "18.25",
                                                      style: TextStyle(fontSize: 12),
                                                    ),
                                                  ],
                                                ))),

                                      ],
                                    ),
                                  )
                                )),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Container(
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade100,
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  " ضريبة القيمة المضافة" +
                                                      " (15%)",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                Text(
                                                  "18.25",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ))),
                                Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        "....................... اغلاق الفاتورة  0100........................",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),


                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child:  Container(

                                            decoration: BoxDecoration(
                                                color: Colors.green.shade100,
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child:Image.asset(
                                          "assets/scan.png",
                                          height: MediaQuery.of(context).size.width * 0.1,)))
                                  ],
                                ),
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
                                    "طباعة التقرير",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),

                      ],
                    ),
                  ))));
    });
  }
}

class BillContentModel {
  var name;
  var qty;
  var price;
  BillContentModel({this.name,this.qty,this.price});
}
