class ProductModel{
  String? name;
  String? image;
  String? category;
  double? price;
  var quantity ;
  List? content;
  ProductModel({this.name,this.image,this.price,this.category,this.quantity = 1,this.content});
}