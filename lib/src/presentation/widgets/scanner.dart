
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:project/src/presentation/widgets/qr_view.dart';
class Scan extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Scan>{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showScanView = false;
  QrReaderViewController? _controller;

  @override
  void initState() {
    super.initState();
  }

  void alert(String tip) {
  }

  void openScanUI(BuildContext context) async {
    if (_showScanView) {
      await stopScan();
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new Scaffold(
        body: QrcodeReaderView(
          onScan: (result) async {
            Navigator.of(context).pop();
            alert(result);

          },
          headerWidget: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
      );
    }));
  }

  Future<bool> permission() async {
    if (_openAction) return false;
    _openAction = true;
    var status = await Permission.camera.status;
    print(status);
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.camera.request();
      print(status);
    }

    if (status.isRestricted) {
      alert("");
      await Future.delayed(Duration(seconds: 3));
      openAppSettings();
      _openAction = false;
      return false;
    }

    if (!status.isGranted) {
      alert("");
      _openAction = false;
      return false;
    }
    _openAction = false;
    return true;
  }

  bool _openAction = false;
  Future stopScan() async {
    assert(_controller != null);
    await _controller?.stopCamera();
    setState(() {
      _showScanView = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              openScanUI(context);            },
          ),
        ));


  }
}