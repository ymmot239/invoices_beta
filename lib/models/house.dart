import 'package:invoices_beta/models/gutter.dart';

class House {
  final String name;
  final String desc;
  final int number;
  final List<Gutter> gutters;

  const House({
    this.name = 'none',
    this.desc = 'none',
    this.number = 0,
    this.gutters = const [],
  });
}
