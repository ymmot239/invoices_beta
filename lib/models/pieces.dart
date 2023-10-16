import 'package:invoices_beta/models/parts.dart';

class Pieces implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Piece";

  @override
  List<Parts> Sections = const [];

  Pieces({required this.Name, this.Description = ""});
}
