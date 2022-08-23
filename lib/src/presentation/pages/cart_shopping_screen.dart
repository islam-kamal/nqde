import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/domain/entities/products_model.dart';
import 'package:project/src/presentation/manager/colors.dart';
import 'package:project/src/presentation/manager/shared.dart';
import 'package:project/src/presentation/pages/end_day_report.dart';
import 'package:project/src/presentation/pages/home_screen.dart';
import 'package:project/src/presentation/pages/invoice_preview_dialog.dart';
import 'package:project/src/presentation/pages/meal_additions_screen.dart';
import 'package:project/src/presentation/pages/submit_success.dart';
import 'package:project/src/presentation/widgets/cart_settings.dart';

class CartShoppingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartShoppingScreenState();
  }
}

class CartShoppingScreenState extends State<CartShoppingScreen> {
  var height, width;
  List type = ['سفرى', 'محلى'];
  var selected_type = 'سفرى';
  var qty = 1;

  // List<ProductModel > shopping_cart_items = [];
  List<int> total_price_list = [];
  List<double?> total_list = [];
  @override
  void initState() {
    Shared.shopping_cart_items.forEach((element) {
      total_list.add(element.price! * element.quantity);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    double total = total_list.fold(0, (p, c) => p + c!);
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
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: CustomColors.main_color,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: CustomColors.main_color)),
                    child: DropdownButton(
                        value: selected_type,
                        hint: Text(type[0]),
                        dropdownColor: CustomColors.main_color,
                        underline: Container(),
                        isExpanded: true,
                        items: type
                            .map((e) => DropdownMenuItem(
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (var v) {
                          setState(() {
                            selected_type = v.toString();
                            print("selected_type : ${selected_type}");
                          });
                        }),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "السلة",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ))),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.06, top: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: CustomColors.main_color,
                            borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          child: Text(
                            "الغاء الطلب",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {
                            Shared.shopping_cart_items = [];
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: CustomColors.main_color,
                            borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          child: Text(
                            "عبدالله الغامدى",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {},
                        ),
                      )),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Shared.shopping_cart_items.isEmpty ? Padding(padding: EdgeInsets.only(top: width * 0.3),

            child: Container(
              alignment: Alignment.center,
              child: Text("لا توجد منتجات فى السلة حاليا",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            )
                :   Column(
              children: [
                Container(
                    height: height * 0.45,
                    child: ListView.builder(
                      itemCount: Shared.shopping_cart_items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Divider(
                              height: 0,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  Shared.shopping_cart_items.removeAt(index);
                                                  total_list = [];
                                                  Shared.shopping_cart_items.forEach((element) {
                                                    total_list.add(element.price! * element.quantity);
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              )),
                                          Text(
                                            "${Shared.shopping_cart_items[index].price} ريال",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              height: width * 0.07,
                                              minWidth: width * 0.1,
                                              onPressed: () async {
                                                setState(() {
                                                  Shared.shopping_cart_items[index].quantity++;
                                                    total_list = [];
                                                    Shared.shopping_cart_items.forEach((element) {
                                                      total_list.add(element.price! * element.quantity);
                                                  });
                                                });
                                              },
                                              color: Colors.white,
                                              textColor: Colors.grey,
                                              child: Icon(
                                                Icons.add,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                              padding: EdgeInsets.all(5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0))),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                '${Shared.shopping_cart_items[index].quantity}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              height: width * 0.07,
                                              minWidth: width * 0.1,
                                              onPressed: Shared
                                                  .shopping_cart_items[index]
                                                  .quantity <=
                                                  1
                                                  ? () {}
                                                  : () {
                                                setState(() {
                                                  Shared.shopping_cart_items[index].quantity--;
                                                  total_list = [];
                                                  Shared.shopping_cart_items.forEach((element) {
                                                    total_list.add(element.price! * element.quantity);
                                                  });
                                                });
                                              },
                                              color: Shared.shopping_cart_items[index]
                                                  .quantity <=
                                                  1
                                                  ? Colors.grey
                                                  : Colors.white,
                                              textColor: Colors.white,
                                              child: Icon(
                                                Icons.remove,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                              padding: EdgeInsets.all(5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0))),
                                            ),
                                          ],
                                        ))),
                                Expanded(
                                    flex: 2,
                                    child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => MealAdditionsScreen()));
                                    },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: ListView.builder(
                                                  itemCount: Shared.shopping_cart_items[index].content?.length,
                                                  physics:
                                                  NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, ind) {
                                                    return Text(
                                                      "${Shared.shopping_cart_items[index].content![ind]}",
                                                      textDirection:
                                                      TextDirection.rtl,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Image.asset(
                                                    "${Shared.shopping_cart_items[index].image}",
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),

                                    )),
                              ],
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        );
                      },
                    )),
                SizedBox(
                  height: width * 0.1,
                ),


             Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${total} ر.س",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "المجموع",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "10 ر.س",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "الضرائب",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${total + 10} ر.س",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "الاجمالى",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )

          ],
        )),

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
                        child: Text(
                          "الدفع",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                              (context)=>SubmitSuccessfulScreen()));
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

                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    contentPadding: EdgeInsets.all(0),
                                    insetPadding: EdgeInsets.all(20),
                                    content: CartSettingsDialog(),
                                  ));
                        },
                      ),
                    ))
              ],
            )));
  }

}

class ShoppingCartItemModel {
  var image;
  var price;
  var quantity;
  List? content;
  ShoppingCartItemModel({this.image, this.price, this.content, this.quantity});
}
