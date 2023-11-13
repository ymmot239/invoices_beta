import 'parts.dart';

class Pieces implements Parts {
  @override
  String name;

  @override
  String description;

  @override
  String type = "Piece";

  @override
  List<Parts> sections = const [];

  @override
  List<String> fields = ["Name", "Description", "Price", "Quantity", "Size"];

  @override
  int price;

  @override
  int quantity;

  double size;

  @override
  Map<String, dynamic> holder = {};

  late String shortcode;

  Pieces(
      {required this.name,
      this.description = "",
      this.price = 0,
      this.quantity = 0,
      this.size = 0});

  @override
  toJson() {
    holder = {
      "Name": name,
      "Description": description,
      "Type": Type,
      "Sections": sections,
      "Price": price,
      "Quantity": quantity,
      "Size": size
    };
  }

  @override
  update() {
    name = holder["Name"];
    description = holder["Description"];
    price = int.parse(holder["Price"]);
    quantity = int.parse(holder["Quantity"]);
    size = double.parse(holder["Size"]);
  }
}
