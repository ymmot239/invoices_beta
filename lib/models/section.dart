import 'package:invoices_beta/models/parts.dart';

class Section implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Section";

  @override
  List<Parts> Sections;

  @override
  List<String> fields = ["Name", "Description", "Price", "Quantity"];

  @override
  int Price;

  @override
  int Quantity;

  @override
  Map<String, dynamic> holder = {};

  Section(
      {required this.Name,
      this.Description = "",
      this.Sections = const [],
      this.Price = 0,
      this.Quantity = 0}) {}

  @override
  toJson() {
    holder = {
      "Name": Name,
      "Description": Description,
      "Type": Type,
      "Sections": Sections,
      "Price": Price.toString(),
      "Quantity": Quantity.toString(),
    };
  }

  @override
  update() {
    Name = holder["Name"];
    Description = holder["Description"];
    Price = int.parse(holder["Price"]);
    Quantity = int.parse(holder["Quantity"]);
  }
}
