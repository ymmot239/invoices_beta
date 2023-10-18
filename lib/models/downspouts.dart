import 'package:invoices_beta/models/parts.dart';

class Downspout implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Downspout";

  @override
  List<Parts> Sections;

  @override
  List<String> fields = ["Name", "Description"];

  @override
  Map<String, dynamic> holder = {};

  Downspout(
      {required this.Name, this.Description = "", this.Sections = const []}) {}

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
