import 'package:invoices_beta/models/general.dart';
import 'package:invoices_beta/models/house.dart';

class Customer implements General {
  @override
  String Name;

  @override
  String Description;

  List<House> Houses;
  static const List<String> fields = ["Name", "Description", "Houses"];

  Customer({
    this.Name = 'none',
    this.Description = 'none',
    this.Houses = const [],
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      Name: json['Name'] as String,
      Description: json['Description'] as String,
      Houses: json['Houses'] as List<House>);

  Map<String, dynamic> toJson() =>
      {'Name': Name, 'Description': Description, 'Houses': Houses};
}
