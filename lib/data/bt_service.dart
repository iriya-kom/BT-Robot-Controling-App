
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

abstract class BtService {
  Future<void> connect();

  void sendData(String data);
}

class BtServiceImpl extends BtService {
  late BluetoothConnection connection;

  BtServiceImpl();

  @override
  Future<void> connect() async {
    BluetoothDevice device = await FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
      return bondedDevices.firstWhere((device) => device.name == "HC-05");
    });

    if (device != null) {
      try {
        connection = await BluetoothConnection.toAddress(device.address);
        if (kDebugMode) {
          print('+++++Successful $connection +++++');
        }
      } catch (ex) {
        if (kDebugMode) {
          print("Error connecting: $ex");
        }
      }
    } else {
      if (kDebugMode) {
        print("Device not found");
      }
    }
  }

  @override
  void sendData(String data) async {
    connection.output.add(
      Uint8List.fromList(
        ("$data\n").codeUnits,
      ),
    );
    await connection.output.allSent;
  }
}
