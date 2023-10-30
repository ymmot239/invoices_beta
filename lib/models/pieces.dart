import 'package:invoices_beta/models/parts.dart';

class Pieces implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Piece";

  @override
  List<Parts> Sections = const [];

  @override
  List<String> fields = ["Name", "Description", "Price", "Quantity"];

  @override
  int Price;

  @override
  int Quantity;

  @override
  Map<String, dynamic> holder = {};

  Pieces(
      {required this.Name,
      this.Description = "",
      this.Price = 0,
      this.Quantity = 0});

  @override
  toJson() {
    holder = {
      "Name": Name,
      "Description": Description,
      "Type": Type,
      "Sections": Sections,
      "Price": Price,
      "Quantity": Quantity,
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
