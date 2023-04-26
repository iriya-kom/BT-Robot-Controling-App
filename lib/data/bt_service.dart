
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:manipulator_controller/presentation/utils/enum/bt_connection_status.dart';

abstract class BtService {

  Future<BtConnectionStatus> connect();

  Future<void> sendData(String data);
}

class BtServiceImpl extends BtService {
  BluetoothConnection? connection;

  BtServiceImpl();

  @override
  Future<BtConnectionStatus> connect() async {
    try{
      BluetoothDevice device = await FlutterBluetoothSerial.instance
          .getBondedDevices()
          .then((List<BluetoothDevice> bondedDevices) {
        return bondedDevices.firstWhere((device) => device.name == "HC-05");
      });

      try {
        connection = await BluetoothConnection.toAddress(device.address);
        if (kDebugMode) {
          print('+++++Successful $connection +++++');
          return BtConnectionStatus.connected;
        }
      } catch (ex) {
        if (kDebugMode) {
          print("Error connecting: $ex");
          return BtConnectionStatus.error;
        }
      }
    } catch (e){
      if (kDebugMode) {
        print("Device not found");
      }
      return BtConnectionStatus.error;
    }
    return BtConnectionStatus.error;
  }

  @override
  Future<void> sendData(String data) async {
    print(data);
    if (connection != null) {
      connection?.output.add(
        Uint8List.fromList(
          ("$data\n").codeUnits,
        ),
      );
      connection?.output.allSent;
    }
  }
}
