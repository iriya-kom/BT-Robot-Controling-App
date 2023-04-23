
import 'package:get_it/get_it.dart';
import 'package:manipulator_controller/presentation/di/usecase_injector.dart';

import 'bt_injector.dart';

GetIt get i => GetIt.instance;

Future<void> initInjector() async {
  initBt();
  initUseCaseInjector();
}