import 'package:flutter/material.dart';
import 'package:manipulator_controller/data/bt_service.dart';
import 'package:manipulator_controller/domain/usecases/bt_usecase.dart';
import 'package:manipulator_controller/presentation/di/injector.dart';
import 'package:manipulator_controller/presentation/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();
  await i.get<BtService>().connect();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(
        useCase: i.get<BtUseCase>(),
      ),
    );
  }
}
