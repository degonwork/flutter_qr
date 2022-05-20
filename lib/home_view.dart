import 'package:demo_qr/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetX<HomeController>(builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 30),
              QrImage(
                data: controller.qrcode.value,
                size: 200,
              ),
              const SizedBox(height: 30),
              Text(controller.scanQrcode.value),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Qr code',
                ),
                keyboardType: TextInputType.text,
                controller: controller.qrContentEditingController,
                onChanged: (val) {
                  controller.qrcode.value = val;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  controller.scanQR();
                },
                child: const Text('Scan'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
