import 'package:invoices_beta/models/house.dart';

class Customer {
  static int count = 0;
  final int id = count++;
  final String name;
  final String desc;
  final List<House> houses;

  Customer({
    this.name = 'none',
    this.desc = 'none',
    this.houses = const [],
  });
}
