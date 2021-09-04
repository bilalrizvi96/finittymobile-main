import 'dart:convert';



class CartModel{

  var items_id;
  var item_quantity;
  var item_name;
  var item_description;
  var item_price;
  var total_price;





  CartModel({
    this.items_id,
    this.item_quantity,
    this.item_name,
    this.item_description,
    this.item_price,
    this.total_price
  });


  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      items_id:jsonData['id'],
      item_quantity:jsonData['quantity'],
      item_name:jsonData['name'],
      item_description:jsonData['description'],
      item_price:jsonData['price'],
      total_price:jsonData['total_price'],

    );
  }

  static Map<String, dynamic> toMap(CartModel cart) => {
    'id':cart.items_id,
    'quantity':cart.item_quantity,
    'name':cart.item_name,
    'description':cart.item_description,
    'price':cart.item_price,
    'total_price':cart.total_price,

  };

  static String encodeMusics(List<CartModel> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => CartModel.toMap(music))
        .toList(),
  );

  static List<CartModel> decodeMusics(String musics){
    if(musics != null){
      return (json.decode(musics) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
    }
    else{
      return new List();
    }
  }
}