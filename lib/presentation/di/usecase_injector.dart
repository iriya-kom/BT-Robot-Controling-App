import 'package:manipulator_controller/domain/usecases/bt_usecase.dart';

import 'injector.dart';

void initUseCaseInjector() {
  i.registerSingleton<BtUseCase>(
    BtUseCaseImpl(
      i.get(),
    ),
  );
}
