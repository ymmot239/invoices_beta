import 'package:invoices_beta/models/data_layer.dart';
import 'package:invoices_beta/models/downspouts.dart';
import 'package:invoices_beta/models/pieces.dart';
import 'package:invoices_beta/models/section.dart';

class Parts implements General {
  @override
  late String Name;
  @override
  late String Description;

  late String Type;
  late List<Parts> Sections;
  Map<String, dynamic> holder = {};

  List<String> fields = ["Name", "Description"];

  Parts(this.Name, this.Description, this.Type);

  static Parts createNew(Parts newItem) {
    if (newItem.runtimeType == Section) {
      return Section(Name: "Section", Description: "", Sections: [
        Downspout(Name: "Downspout", Sections: [Pieces(Name: "Piece")])
      ]);
    } else if (newItem.runtimeType == Downspout) {
      return Downspout(
          Name: "Downspout",
          Description: "",
          Sections: [Pieces(Name: "Piece")]);
    } else if (newItem.runtimeType == Pieces) {
      return Pieces(Name: "Piece", Description: "");
    } else {
      return Pieces(Name: "unknown");
    }
  }

  toJson() {
    print("oh no");
  }

  update() {}
}
