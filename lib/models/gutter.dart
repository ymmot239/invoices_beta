import 'package:invoices_beta/models/general.dart';

class Gutter implements General {
  @override
  String Name;

  @override
  String Description;

  int Number;
  double Length;
  String Type;

  Gutter({
    this.Name = 'none',
    this.Description = 'none',
    this.Number = 0,
    this.Length = 0.0,
    this.Type = '5',
  });
}
