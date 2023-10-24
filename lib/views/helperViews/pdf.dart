//import 'dart:typed_data';

//import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/customer.dart';
import '../../models/data_layer.dart';

class pdfs {
  static Future<Uint8List> makeInvoicePdf(Customer invoice) async {
    final imageLogo = MemoryImage(
        (await rootBundle.load('assets/fulllogo.png')).buffer.asUint8List());
    final pdf = Document();

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.letter,
        build: (Context context) {
          return Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  flex: 2,
                  child: SizedBox(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Image(imageLogo, alignment: Alignment.center)))),
              Flexible(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: PdfColor(0, 0, 0, 1)))),
                      //padding: EdgeInsets.all(8.0),
                      child: Text("Phone:\n(610) 322-7069\nContact:\nEd Reitz",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).header2))),
            ]),
            Divider(thickness: 2),
            SizedBox(height: 20),
            Text("Invoice for ${invoice.Name}",
                textAlign: TextAlign.center, style: Theme.of(context).header0),
            for (House holder in invoice.Houses) ...[
              for (Gutter gutter in holder.Gutters) ...[
                for (Parts part in gutter.parts) ...[recursive(part, context)]
              ]
            ]
          ]);
        }));
    return pdf.save();
  }

  static Widget recursive(Parts part, Context context) {
    return Text("a", style: Theme.of(context).header2);
  }
}
