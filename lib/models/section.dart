import 'package:invoices_beta/models/parts.dart';

class Section implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type;

  @override
  List<Parts> Sections;

  Section(
      {required this.Name,
      this.Description = "",
      this.Type = "",
      this.Sections = const []}) {
    Sections.add(new Parts("Add new Section", "", "Button"));
  }
}
