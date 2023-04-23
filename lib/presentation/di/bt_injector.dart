import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:manipulator_controller/data/bt_service.dart';

import 'injector.dart';

Future<void> initBt() async {
  i.registerSingleton<BtService>(
    BtServiceImpl(),
  );
}
