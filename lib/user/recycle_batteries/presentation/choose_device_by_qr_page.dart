import 'dart:io';

import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:batareykin/user/recycle_batteries/presentation/choose_device_by_uniqe_code_page.dart';
import 'package:batareykin/user/recycle_batteries/presentation/waiting_for_processing_batteries_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ChooseDeviceByQrPage extends StatefulWidget {
  const ChooseDeviceByQrPage({Key? key}) : super(key: key);

  @override
  State<ChooseDeviceByQrPage> createState() => _ChooseDeviceByQrPageState();
}

class _ChooseDeviceByQrPageState extends State<ChooseDeviceByQrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
        final result = await Permission.camera.request();
        return result;
    } else {
      return status;
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomBackButton(),
                ],
              ),
              const SizedBox(height: 40),
              const CustomMidleText(
                text: 'Сканируйте qr код на устройстве', 
                size: 20,
              ),
              const SizedBox(height: 40),
              Center(
                child: FutureBuilder(
                  future: _getCameraPermission(),
                  builder: (context, snap) {
                    if (snap.data!=null){
                      if (snap.data!.isGranted){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        height: MediaQuery.of(context).size.width-40,
                        width: MediaQuery.of(context).size.width-40,
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      ),
                    );
                      }
                    }
                    return const Center(
                      child: Text('Ой\nЧто-то не так'),
                    );
                  }
                ),
              ),
              const SizedBox(height: 40),
              CustomFilledButton(
                text: 'Ввести код вручную', 
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const ChooseDeviceByUniqeCode())));
                }
              )
              // Expanded(
              //   flex: 1,
              //   child: Center(
              //     child: (result != null)
              //         ? Text(
              //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              //         : const Text('Scan a code'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingForProcessingBatteriesPage()));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
