import 'data_layer.dart';

class General {
  String name = "";
  String description = "";
  static const List<String> fields = [];

  General({this.name = ""});

  static General createNew(General newItem) {
    switch (newItem.runtimeType) {
      case Customer:
        return Customer(
            name: "Customer ${Customer.count++}",
            houses: [createNew(House(name: "")) as House]);
      case House:
        return House(
            name: "House ${House.count++}",
            gutters: [createNew(Gutter(name: "", parts: [])) as Gutter]);
      case Gutter:
        return Gutter(
            name: "Gutter ${Gutter.count++}",
            parts: [Parts.createNew(Section(name: "Name"))]);
      default:
        return General(name: "Error");
    }
  }
}
