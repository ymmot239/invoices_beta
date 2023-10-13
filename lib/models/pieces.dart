import 'package:invoices_beta/models/parts.dart';

class Pieces implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type;

  @override
  List<Parts> Sections = const [];

  Pieces({required this.Name, this.Description = "", this.Type = ""});
}
