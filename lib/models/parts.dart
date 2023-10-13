import 'package:invoices_beta/models/data_layer.dart';

class Parts implements General {
  @override
  late String Name;
  @override
  late String Description;

  late String Type;
  late List<Parts> Sections;

  Parts(this.Name, this.Description, this.Type);
}
