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
  List<String> fields = ["Name", "Description"];

  @override
  Map<String, dynamic> holder = {};

  Pieces({required this.Name, this.Description = ""});

  @override
  toJson() {
    holder = {
      "Name": Name,
      "Description": Description,
      "Type": Type,
      "Sections": Sections,
    };
  }

  @override
  update() {
    Name = holder["Name"];
    Description = holder["Description"];
  }
}
