//import 'dart:typed_data';

//import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

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
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(
                  flex: 2,
                  child: SizedBox(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 20),
            for (House holder in invoice.Houses) ...[
              Text(holder.Name),
              for (Gutter gutter in holder.Gutters) ...[
                for (Parts part in gutter.parts) ...[
                  tableBuilder(part, context),
                  SizedBox(height: 20),
                ]
              ]
            ]
          ]);
        }));
    return pdf.save();
  }

  static Widget tableBuilder(Parts part, Context context) {
    return Table(border: TableBorder.all(), children: recursive(part, context));
  }

  static List<TableRow> recursive(Parts part, Context context, {int tabs = 0}) {
    return [
      TableRow(children: [
        Flexible(
            flex: 5,
            child: Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text("      " * tabs + part.Name,
                    style: Theme.of(context).header2,
                    textAlign: TextAlign.left))),
        Flexible(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(part.Quantity.toString()))),
        Flexible(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text("\$${(part.Quantity * part.Price).toString()}"))),
      ]),
      for (Parts next in part.Sections)
        ...recursive(next, context, tabs: tabs + 1)
    ];

    //

    // return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    //   SizedBox(
    //       width: double.infinity,
    //       child: Text(part.Name,
    //           style: Theme.of(context).header2, textAlign: TextAlign.left)),
    //   for (Parts next in part.Sections) ...[
    //     recursive(next, context),
    //   ]
    // ]);
  }
}
