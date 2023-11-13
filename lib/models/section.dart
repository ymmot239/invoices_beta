import 'parts.dart';

class Section implements Parts {
  @override
  String name;

  @override
  String description;

  @override
  String type = "Section";

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

  Section(
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
      "Price": price.toString(),
      "Quantity": quantity.toString(),
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
