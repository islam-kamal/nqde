import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/pages/end_day_report.dart';
import 'package:project/src/presentation/pages/invoice_preview_dialog.dart';
class CartSettingsDialog extends StatelessWidget{
  var height , width;
  var drawer_list = ['ارسال الطلب','طباعة الفاتورة','دمج الطلب','تأجيل الدفع','معاينة الفاتورة',
    'تعيين طاولة','اضافة كوبون خصم','خصم'];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.75 ,
    width: width * 0.8,

    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(15)
    ),
    child: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl ,
          child:  ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child:  Column(
              children: [
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

                            onTap: () {
                              switch(drawer_list[ind]){
                                case 'معاينة الفاتورة':
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return InvoicePreviewDialog();
                                      });
                                  break;
                              }

                            });



                      }),
                )
              ],
            ),)
        ),
      ),

    );
  }

}
