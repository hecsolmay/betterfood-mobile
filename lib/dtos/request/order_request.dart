// To parse this JSON data, do
//
//     final orderRequestDto = orderRequestDtoFromJson(jsonString);

import 'dart:convert';

OrderRequestDto orderRequestDtoFromJson(String str) =>
    OrderRequestDto.fromJson(json.decode(str));

String orderRequestDtoToJson(OrderRequestDto data) =>
    json.encode(data.toJson());

class OrderRequestDto {
  OrderRequestDto({
    required this.products,
    required this.waiterId,
    required this.tableId,
  });

  List<Product> products;
  String waiterId;
  String tableId;

  factory OrderRequestDto.fromJson(Map<String, dynamic> json) =>
      OrderRequestDto(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        waiterId: json["waiterId"],
        tableId: json["tableId"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "waiterId": waiterId,
        "tableId": tableId,
      };
}

class Product {
  Product({
    required this.idProduct,
    required this.extras,
    required this.remove,
    required this.quantity,
  });

  String idProduct;
  List<String> extras;
  List<String> remove;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json["idProduct"],
        extras: List<String>.from(json["extras"].map((x) => x)),
        remove: List<String>.from(json["remove"].map((x) => x)),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "extras": List<dynamic>.from(extras.map((x) => x)),
        "remove": List<dynamic>.from(remove.map((x) => x)),
        "quantity": quantity,
      };
}
