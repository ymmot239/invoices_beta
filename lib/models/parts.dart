import 'package:invoices_beta/models/data_layer.dart';

class Parts implements General {
  @override
  late String name;
  @override
  late String description;

  late String type;
  late List<Parts> sections;

  late int price;
  late int quantity;

  Map<String, dynamic> holder = {};

  List<String> fields = ["Name", "Description"];

  Parts(this.name, this.description, this.type);

  static Parts createNew(Parts newItem) {
    if (newItem.runtimeType == Section) {
      return Section(name: "Section", description: "", sections: [
        Downspout(name: "Downspout", sections: [Pieces(name: "Piece")])
      ]);
    } else if (newItem.runtimeType == Downspout) {
      return Downspout(
          name: "Downspout",
          description: "",
          sections: [Pieces(name: "Piece")]);
    } else if (newItem.runtimeType == Pieces) {
      return Pieces(name: "Piece", description: "");
    } else {
      return Pieces(name: "unknown");
    }
  }

  toJson() {}

  update() {}
}
