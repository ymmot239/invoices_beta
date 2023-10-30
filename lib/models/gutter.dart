import 'package:invoices_beta/models/general.dart';

import 'parts.dart';

class Gutter implements General {
  @override
  String name;

  @override
  String description;

  late List<Parts> parts;

  static const List<String> fields = ["Name", "Description", "parts"];

  Gutter({this.name = 'none', this.description = 'none', required this.parts});

  factory Gutter.fromJson(Map<String, dynamic> json) => Gutter(
        name: json['Name'] as String,
        description: json['Description'] as String,
        parts: json['Parts'] as List<Parts>,
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Description': description,
        'parts': parts,
      };
}
