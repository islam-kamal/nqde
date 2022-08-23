import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/src/domain/entities/products_model.dart';
import 'package:project/src/presentation/manager/colors.dart';
import 'package:project/src/presentation/manager/shared.dart';
import 'package:project/src/presentation/pages/cart_shopping_screen.dart';
import 'package:project/src/presentation/widgets/cart_settings.dart';
import 'package:project/src/presentation/widgets/drawer_widget.dart';
import 'package:project/src/presentation/widgets/scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeStateScreen();
  }
}

class HomeStateScreen extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _homedrawerKey = GlobalKey();
  TextEditingController? controller;
  String search_text = '';
  int? current_index = 0;
  List<ProductModel> products = [];
  var category_name = 'المثلجات';
  List<double?> total_price = [];
  @override
  void initState() {
    controller = TextEditingController();
    print("Shared.shopping_cart_items : ${Shared.shopping_cart_items}");
    products = [
      ProductModel(
          name: 'ايس كريم',
          category: 'المثلجات',
          image: 'assets/ice_cream.png',
          price: 15.0,
          quantity: 1,
          content: ['ايس كريم فانليا']
      ),
      ProductModel(
          name: 'وجبة فراخ',
          category: 'ساندوتشات',
          image: 'assets/checkin.png',
          price: 45.0,
          quantity: 1,
          content: ['برجر لحم','دبل جبنة','شراح لحم']),
      ProductModel(
          name: 'بيبسى',
          category: 'عصيرات',
          image: 'assets/coca.png',
          content: ['دبل جبنة',],
          quantity: 1,
          price: 8.0),
      ProductModel(
          name: 'وجبة لحم استيك',
          category: 'ساندوتشات',
          image: 'assets/meal.png',
          price: 75.0,
          quantity: 1,
          content: ['دبل جبنة','شراح لحم']),
      ProductModel(
          name: 'كوكتيل فواكه',
          category: 'عصيرات',
          image: 'assets/meal.png',
          quantity: 1,
          content: ['دبل جبنة',],
          price: 25.0),
      ProductModel(
          name: 'كوكتيل مثلجات',
          category: 'المثلجات',
          image: 'assets/coca.png',
          quantity: 1,
          content: ['دبل جبنة',],
          price: 15.0),
      ProductModel(
          name: 'وجبة دجاج ساخن',
          category: 'ساندوتشات',
          image: 'assets/checkin.png',
          price: 85.0,
          quantity: 1,
          content: ['دبل جبنة',]
      ),
    ];

    Shared.shopping_cart_items.forEach((element) {
      total_price.add(element.price! * element.quantity);
    });
    super.initState();
  }

  @override
  void dispose() {
    search_text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double total = total_price.fold(0, (p, c) => p + c!);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Text(
            "NQDE GO",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Column(children: [
              categories_widget(),
              searchAndScannerWidget(),
              SingleChildScrollView(
                child: products_listview_widget(),
              )
            ]),
          ),
        ),
        endDrawer: DrawerWidget(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: CustomColors.main_color,
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        child:  Shared.shopping_cart_items.isEmpty ?  Text(
                         "السلة فارغة",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(
                              " ${total}  ريال     =  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                                "  منتج ${Shared.shopping_cart_items.length}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        onPressed: () {
                          if(Shared.shopping_cart_items.isEmpty){
                            Fluttertoast.showToast(
                                msg: "لا يوجد منتجات فى السلة",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }else{
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => CartShoppingScreen()));

                          }

                        },
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                        onPressed: () {


                        },
                      ),
                    ))
              ],
            )));
  }

  Widget categories_widget() {
    List categories = [];
    products.forEach((element) {
      categories.add(element.category);
    });

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
            height: MediaQuery.of(context).size.width * 0.06,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (Context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          current_index = index;
                          category_name = categories[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.main_color),
                          borderRadius: BorderRadius.circular(5),
                          color: current_index == index
                              ? CustomColors.main_color
                              : Colors.white,
                        ),
                        child: Text(
                          "${categories[index]}",
                          style: TextStyle(
                              color: current_index == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                })));
  }

  Widget searchAndScannerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      child: Container(
                    child: TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        setState(() {
                          search_text = controller!.value.text;
                          print("search_text : $search_text");
                        });
                      },
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding:
                            new EdgeInsets.symmetric(horizontal: 5.0),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        hintText: "البحث",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                      ),
                    ),
                  )))),
          Expanded(flex: 1, child: Scan()),
        ],
      ),
    );
  }

  Widget products_listview_widget() {
    List<ProductModel> products_list = [];
    products.forEach((element) {
      if (element.category == category_name) {
        products_list.add(element);
      }
    });

    return GridView.builder(
        itemCount: products_list.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: .9000,
        ),
        itemBuilder: (BuildContext context, int index) {
          return (products_list[index].name!.contains(search_text) ||
                  search_text == '')
              ? InkWell(
                  onTap: () {
                    setState(() {
                      if( !Shared.shopping_cart_items.contains(products_list[index])){
                        Shared.shopping_cart_items.add(products_list[index]);
                        Shared.shopping_cart_items.forEach((element) {
                          total_price.add(element.price! * element.quantity);
                        });
                      }else{
                        Fluttertoast.showToast(
                            msg: "المنتج مضاف بالفعل داخل السلة",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }


                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),

                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Image.asset(
                              "${products_list[index].image}",
                              width: double.infinity,
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
                                  Text(
                                    "${products_list[index].name}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text("${products_list[index].price} ريال ",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              : Container();
        });
  }
}
