import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/presentation/manager/colors.dart';
import 'package:project/src/presentation/pages/customer_details_screen.dart';
import 'package:project/src/presentation/pages/home_screen.dart';

class CustomerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomerScreenState();
  }
}

class CustomerScreenState extends State<CustomerScreen> {
  TextEditingController? controller;
  String search_text = '';
  int? current_index = 0;
  List customers = [];

  @override
  void initState() {
    controller = TextEditingController();
    customers = [
      'عبدالمجيد على',
      'حسام خالد',
      'سعيد الصالحى',
    ];
    super.initState();
  }

  @override
  void dispose() {
    search_text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                                (context)=>HomeScreen()));

                                },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      Text(
                        "رجوع",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ))),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text(
                      "العملاء",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 25),
                    ),
                  ))),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                  child: Container(
                child: TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    setState(() {
                      search_text = controller!.value.text;
                    });
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(horizontal: 5.0),
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    hintText: "بحث عن عميل ( الاسم - رقم الجوال",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    filled: true,
                    hintTextDirection: TextDirection.rtl,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                    color: CustomColors.main_color,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: customers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return customers[index].contains(search_text) || search_text == ''
                  ? InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerDetailsScreen(
                    name:  customers[index],
                  )));

                },
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                          Text(
                            customers[index],
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    )),
              )
               : Container();
            },
          ))
        ],
      ),
    );
  }
}
