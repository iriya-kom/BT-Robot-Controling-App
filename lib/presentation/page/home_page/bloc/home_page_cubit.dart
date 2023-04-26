import 'package:bloc/bloc.dart';
import 'package:manipulator_controller/presentation/utils/enum/bt_connection_status.dart';

import '../../../../domain/usecases/bt_usecase.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this._useCase,
  ) : super(HomePageState.init());

  final BtUseCase _useCase;

  void init() async {
    BtConnectionStatus status = await _useCase.connect();
    String statusName = status.statusName;
    emit(
      state.copyWith(
        status: status,
        statusName: statusName,
      ),
    );
  }

  Future<void> handleReconnect() async {
    emit(
      state.copyWith(status: BtConnectionStatus.connecting),
    );
    BtConnectionStatus status = await _useCase.connect();
    String statusName = status.statusName;
    emit(
      state.copyWith(
        status: status,
        statusName: statusName,
      ),
    );
  }

  Future<void> handleSendData(String data) async {
    _useCase.sendData(data);
  }

  void handleRestart(){
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        firstServoValue: 90,
        secondServoValue: 90,
        thirdServoValue: 90,
        fourthServoValue: 90,
        fifthServoValue: 90,
        sixthServoValue: 90,
      ),
    );
    handleSendData('s190');
    handleSendData('s290');
    handleSendData('s390');
    handleSendData('s490');
    handleSendData('s590');
    handleSendData('s690');
  }

  void handleFirstSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        firstServoValue: value,
      ),
    );
    handleSendData('s1$value');
  }

  void handleSecondSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        secondServoValue: value,
      ),
    );
    handleSendData('s2$value');
  }

  void handleThirdSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        thirdServoValue: value,
      ),
    );
    handleSendData('s3$value');
  }

  void handleFourthSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        fourthServoValue: value,
      ),
    );
    handleSendData('s4$value');
  }

  void handleFifthSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        fifthServoValue: value,
      ),
    );
    handleSendData('s5$value');
  }

  void handleSixthSliderChange(int value) {
    if (state.status == BtConnectionStatus.error) return;
    emit(
      state.copyWith(
        sixthServoValue: value,
      ),
    );
    handleSendData('s6$value');
  }
}
