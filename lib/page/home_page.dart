// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_app/controller/home_controller.dart';
import 'package:transaction_app/page/add_transaction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  get transatype => '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      final width = MediaQuery.of(context).size.width;
      return Scaffold(
          appBar: AppBar(
            title: Text(' Transaction'),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: width * 1.4,
              child: ListView(children: [
                DataTable(columns: [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  /* DataColumn(
              label: Text('date'),
            ),*/
                  DataColumn(
                    label: Text('Description'),
                  ),
                  // DataColumn(
                  //   label: Text('Amount'),
                  // ),
                  // DataColumn(
                  //   label: Text('Trans. Type'),
                  // ),
                  DataColumn(
                    label: Text('credit'),
                  ),
                  DataColumn(
                    label: Text('debit'),
                  ),
                ], rows: <DataRow>[
                  ...ctrl.transdetail.map((transaction) {
                    return DataRow(cells: [
                      DataCell(Text((transaction.date).toString())),
                      // DataCell(Text((transaction.id ?? 0).toString())),
                      DataCell(Text(transaction.description ?? '')),
                      //  DataCell(Text((transaction.amount ?? 0).toString())),
                      // DataCell(Text(transaction.transType ?? '')),
                      DataCell(Text(transaction.transType == "credit"
                          ? transaction.amount.toString()
                          : '')),
                      DataCell(Text(transaction.transType == "debit"
                          ? transaction.amount.toString()
                          : '')),

                      //  DataCell(Text(transaction.id.toString())),
                      //DataCell(Text(transaction.id.toString())),
                    ]);
                  })
                ]),
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddTransPage(
                onAdd: () {
                  ctrl.fetchTransaction();
                },
              ));
            },
            child: Icon(Icons.add),
          ));
    });
  }
}

  

      



/*return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Action')),
      ],
      rows: ctrl.pgdetail.map((pg) {
        return DataRow(
          cells: [
            DataCell(Text(pg.name ?? '')),
            DataCell(Text((pg.price ?? 0).toString())),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  ctrl.deletePg(pg.id ?? '');
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}*/
