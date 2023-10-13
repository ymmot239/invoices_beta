import 'package:invoices_beta/models/general.dart';

import 'parts.dart';

class Gutter implements General {
  @override
  String Name;

  @override
  String Description;

  List<Parts> parts;

  static const List<String> fields = [
    "Name",
    "Description",
  ];

  Gutter(
      {this.Name = 'none', this.Description = 'none', this.parts = const []});
}
