import 'package:invoices_beta/models/parts.dart';

class Section implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Section";

  @override
  List<Parts> Sections;

  Section(
      {required this.Name, this.Description = "", this.Sections = const []}) {}
}
