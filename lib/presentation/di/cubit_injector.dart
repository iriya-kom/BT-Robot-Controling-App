import 'package:manipulator_controller/presentation/page/home_page/bloc/home_page_cubit.dart';

import 'injector.dart';

void initCubitInjector() {
  i.registerSingleton<HomePageCubit>(
    HomePageCubit(
      i.get(),
    ),
  );
}
