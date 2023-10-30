import 'package:invoices_beta/models/general.dart';
import 'package:invoices_beta/models/gutter.dart';

class House implements General {
  @override
  String name;
  @override
  String description;

  int number;
  List<Gutter> gutters;
  static const List<String> fields = [
    "Name",
    "Description",
    "Number",
    "Gutters"
  ];

  House({
    this.name = 'none',
    this.description = 'none',
    this.number = 0,
    this.gutters = const [],
  });

  factory House.fromJson(Map<String, dynamic> json) => House(
      name: json['Name'] as String,
      description: json['Description'] as String,
      number: json['Number'] as int,
      gutters: json['Gutters'] as List<Gutter>);

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Description': description,
        'Number': number,
        'Gutters': gutters
      };
}
