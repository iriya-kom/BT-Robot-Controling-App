import 'package:manipulator_controller/data/bt_service.dart';

import '../../presentation/utils/enum/bt_connection_status.dart';

abstract class BtUseCase {
  Future<BtConnectionStatus> connect();

  Future<void> sendData(String data);
}

class BtUseCaseImpl extends BtUseCase {
  BtService btService;

  BtUseCaseImpl(
    this.btService,
  );

  @override
  Future<BtConnectionStatus> connect() async{
    return await btService.connect();
  }

  @override
  Future<void> sendData(String data) async {
    btService.sendData(data);
  }
}
