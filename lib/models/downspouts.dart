import 'package:invoices_beta/models/parts.dart';

class Downspout implements Parts {
  @override
  String name;

  @override
  String description;

  @override
  String type = "Downspout";

  @override
  List<Parts> sections;

  @override
  List<String> fields = ["Name", "Description", "Price", "Quantity"];

  @override
  int price;

  @override
  int quantity;

  @override
  Map<String, dynamic> holder = {};

  Downspout(
      {required this.name,
      this.description = "",
      this.sections = const [],
      this.price = 0,
      this.quantity = 0});

  @override
  toJson() {
    holder = {
      "Name": name,
      "Description": description,
      "Type": Type,
      "Sections": sections,
      "Price": price,
      "Quantity": quantity,
    };
  }

  @override
  update() {
    name = holder["Name"];
    description = holder["Description"];
    price = int.parse(holder["Price"]);
    quantity = int.parse(holder["Quantity"]);
  }
}
