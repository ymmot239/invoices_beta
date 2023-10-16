import 'package:invoices_beta/models/parts.dart';

class Downspout implements Parts {
  @override // TODO: implement Name
  String Name;

  @override
  String Description;

  @override
  String Type = "Downspout";

  @override
  List<Parts> Sections;

  Downspout(
      {required this.Name, this.Description = "", this.Sections = const []}) {}
}
