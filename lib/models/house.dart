import 'package:invoices_beta/models/general.dart';
import 'package:invoices_beta/models/gutter.dart';

class House implements General {
  @override
  String Name;
  @override
  String Description;

  int Number;
  List<Gutter> Gutters;
  static const List<String> fields = [
    "Name",
    "Description",
    "Number",
    "Gutters"
  ];

  House({
    this.Name = 'none',
    this.Description = 'none',
    this.Number = 0,
    this.Gutters = const [],
  });

  factory House.fromJson(Map<String, dynamic> json) => House(
      Name: json['Name'] as String,
      Description: json['Description'] as String,
      Number: json['Number'] as int,
      Gutters: json['Gutters'] as List<Gutter>);

  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Description': Description,
        'Number': Number,
        'Gutters': Gutters
      };
}
