import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:transaction_app/model/transaction.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference transCollection;

  TextEditingController AmountCtrl = TextEditingController();
  TextEditingController transactionDescripCtrl = TextEditingController();
  /* TextEditingController pgImgCtrl = TextEditingController();
  TextEditingController pgPriceCtrl = TextEditingController();
  TextEditingController pgPlaceCtrl = TextEditingController();*/

  // RxString category = 'All'.obs;
  RxString transatype = "credit".obs;

  List<Transaction_details> transdetail = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    transCollection = firestore.collection('Transaction detail');
    await fetchTransaction();
    super.onInit();
  }

  addTransaction() {
    try {
      DocumentReference doc = transCollection.doc();
      Transaction_details transdetail = Transaction_details(
        // id: int.tryParse(doc.id),
        date: DateTime.now().toString(),
        amount: double.tryParse(AmountCtrl.text),
        transType: transatype.string,
        description: transactionDescripCtrl.text,
      );
      final transdetailJson = transdetail.toJson();
      doc.set(transdetailJson);
      Get.snackbar('success', 'Product added succeccfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchTransaction() async {
    try {
      QuerySnapshot transSnapshot = await transCollection.get();
      final List<Transaction_details> retrievetrans = transSnapshot.docs
          .map((doc) =>
              Transaction_details.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      transdetail.clear();
      transdetail.assignAll(retrievetrans);
      Get.snackbar('Success', 'Transaction detail fetch successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  /*deleteTransaction(String id) async {
    try {
      await transCollection.doc(id).delete();
      fetchTransaction();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }*/

  setValuesDefault() {
    AmountCtrl.clear();
    transactionDescripCtrl.clear();

    transatype.value = 'credit';

    update();
  }
}
