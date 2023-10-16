import 'package:invoices_beta/models/general.dart';

import 'parts.dart';

class Gutter implements General {
  @override
  String Name;

  @override
  String Description;

  late List<Parts> parts;

  static const List<String> fields = ["Name", "Description", "parts"];

  Gutter({this.Name = 'none', this.Description = 'none', required this.parts});

  factory Gutter.fromJson(Map<String, dynamic> json) => Gutter(
        Name: json['Name'] as String,
        Description: json['Description'] as String,
        parts: json['Parts'] as List<Parts>,
      );

  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Description': Description,
        'parts': parts,
      };
}
