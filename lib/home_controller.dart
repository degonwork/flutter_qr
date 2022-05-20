import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  var qrcode = ''.obs;
  var scanQrcode = 'Nothing'.obs;
  String value = '';
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> scanQR() async {
    try {
      value = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      // scanQrcode.value = value;
    } on PlatformException {}
  }
}
