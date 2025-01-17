import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const QRScannerApp());
}

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const QRScannerScreen(),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedCode;
  bool cameraPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      cameraPermissionGranted = status.isGranted;
    });
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de escaner QR'),
        centerTitle: true,
      ),
      body: cameraPermissionGranted
          ? Column(
              children: [
                Expanded(
                  flex: 4,
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        setState(() {
                          scannedCode = barcode.rawValue;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (scannedCode != null)
                          Text(
                            'Código escaneado: $scannedCode',
                            textAlign: TextAlign.center,
                          ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              scannedCode = null;
                            });
                          },
                          child: const Text('Volver a escanear'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: ElevatedButton(
                onPressed: _requestCameraPermission,
                child: const Text('Otorgar permisos de uso de la cámara'),
              ),
            ),
    );
  }
}
