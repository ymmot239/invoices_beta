import 'general.dart';
import 'house.dart';

class Customer implements General {
  static int count = 0;

  @override
  String name;

  @override
  String description;

  List<House> houses;

  static const List<String> fields = ["Name", "Description", "Houses"];

  Customer({
    this.name = 'none',
    this.description = 'none',
    this.houses = const [],
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      name: json['Name'] as String,
      description: json['Description'] as String,
      houses: json['Houses'] as List<House>);

  Map<String, dynamic> toJson() =>
      {'Name': name, 'Description': description, 'Houses': houses};
}
