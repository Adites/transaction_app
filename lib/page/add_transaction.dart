import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_app/controller/home_controller.dart';
import 'package:transaction_app/widget/dropdown_btn.dart';

class AddTransPage extends StatelessWidget {
  final Function onAdd;
  const AddTransPage({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('New Transaction'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            width: double.maxFinite,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Transaction Type"),
                    DropDownBtn(
                      items: const ['credit', 'debit'],
                      selectedValue: ctrl.transatype.toString(),
                      selectedItemText: "Select Transaction Type",
                      OnSelected: (String? selectedValue) {
                        ctrl.transatype.value = selectedValue ?? "credit";
                        ctrl.update();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                    controller: ctrl.AmountCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Amount'),
                      //  hintText: 'enter your PG name'
                    )),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                TextField(
                  controller: ctrl.transactionDescripCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Description'),
                    // hintText: 'PG Description'
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text("cancel")),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        ctrl.addTransaction();
                        Get.back();
                        onAdd();
                      },
                      child: Text("save")),
                ]),
              ],
            ),
          ));
    });
  }
}
