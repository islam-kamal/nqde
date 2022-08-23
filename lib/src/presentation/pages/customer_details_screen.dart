import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/safe_area/page_container.dart';
import 'package:project/src/presentation/pages/customer_screen.dart';

class CustomerDetailsScreen extends StatefulWidget{
  String? name;
  CustomerDetailsScreen({this.name});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomerDetailsScreenState();
  }

}

class CustomerDetailsScreenState extends State<CustomerDetailsScreen>{
  List<CustomerData> customer_data_list = [];
  List<CustomerData> term_account = [];
  @override
  void initState() {
    customer_data_list.add(CustomerData(
     frist: "الاسم",
     second: widget.name ??"اسلام كمال"
    ));
    customer_data_list.add(CustomerData(
        frist: "رقم الجوال",
        second: "056255529"
    ));
    customer_data_list.add(CustomerData(
        frist: "البريد الاكترونى",
        second: "islam.kamal.sa@gmail.com"
    ));
    customer_data_list.add(CustomerData(
        frist: "العنوان",
        second: "مكة المكرمة"
    ));

    term_account.add(CustomerData(
        frist: "150 ريال",
        second: "سداد"
    ));
    term_account.add(CustomerData(
        frist: "150 ريال",
        second: "سداد"
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return PageContainer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: WillPopScope(
          onWillPop: ()async{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerScreen()));
            return true;
          },
          child: Scaffold(
              backgroundColor: Colors.grey.shade200,

              body:SingleChildScrollView(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "اسم العميل هنا",
                                style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "تعديل",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        )),

                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child:   Text(
                              "المعلومات الشخصية",
                              style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                            )) ),

                    ListView.builder(
                        itemCount: customer_data_list.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Container(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  child:Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${customer_data_list[index].frist}",
                                            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${customer_data_list[index].second}",
                                            style: TextStyle(color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.black,)
                                    ],
                                  )
                              ));
                        }),

                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child:   Text(
                              "التفضيل",
                              style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                            )) ),

                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "المنتجات المفضلة",
                                  style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                                ),
                                favourite_products(),
                                Divider(color: Colors.black,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "الفرع المفضل",
                                      style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "فرع العوالى",
                                      style: TextStyle(color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),

                              ],
                            )
                        )),



                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child:   Text(
                              "الحساب الاجل",
                              style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                            )) ),
                    ListView.builder(
                        itemCount: term_account.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Container(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  child:Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${term_account[index].frist}",
                                            style: TextStyle(color: Colors.red, fontSize: 15,fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${term_account[index].second}",
                                            style: TextStyle(color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.black,)
                                    ],
                                  )
                              ));
                        }),

                    SizedBox(height: 20,)

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget favourite_products() {
    List categories = [];
    term_account.forEach((element) {
      categories.add(element.second);
    });

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
            height: MediaQuery.of(context).size.width * 0.1,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (Context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color:Colors.grey,
                      ),
                      child: Text(
                        "${categories[index]}",
                        style: TextStyle(
                            color: Colors.white
                              ),
                      ),
                    ),
                  );
                })));
  }
}

class CustomerData{
  var frist ;
  var second;
  CustomerData({this.frist,this.second});
}