import 'package:manipulator_controller/data/bt_service.dart';

abstract class BtUseCase {
  void sendData(String data);
}

class BtUseCaseImpl extends BtUseCase {
  BtService btService;

  BtUseCaseImpl(
    this.btService,
  );

  @override
  void sendData(String data) async {
    btService.sendData(data);
  }
}
