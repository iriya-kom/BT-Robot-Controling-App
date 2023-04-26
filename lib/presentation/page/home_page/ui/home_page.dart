import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manipulator_controller/presentation/page/home_page/bloc/home_page_cubit.dart';
import 'package:manipulator_controller/presentation/utils/enum/bt_connection_status.dart';

import '../../../di/injector.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cubit = i.get<HomePageCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manipulator Controller'),
            actions: [
              IconButton(
                onPressed: cubit.handleRestart,
                icon: const Icon(
                  Icons.restart_alt,
                  size: 30,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    state.status == BtConnectionStatus.connecting
                        ? Row(
                            children: const [
                              SizedBox(
                                height: 22,
                                width: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Connecting',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            state.statusName,
                            style: TextStyle(
                              fontSize: 15,
                              color: state.status != BtConnectionStatus.error
                                  ? Colors.black
                                  : Colors.red,
                            ),
                          ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: cubit.handleReconnect,
                          child: const Text('Reconnect'),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 50,
                  thickness: 2,
                  color: Colors.lightGreen.shade100,
                  indent: 15,
                  endIndent: 15,
                ),
                Text(
                  '{${state.firstServoValue}, ${state.secondServoValue}, '
                  '${state.thirdServoValue}, ${state.fourthServoValue}, '
                  '${state.fifthServoValue}, ${state.sixthServoValue}}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 15),
                SliderBlock(
                  name: 'Servo 1',
                  currentValue: state.firstServoValue,
                  onChange: (value) {
                    print('firstServoValue: $value');
                    int sliderValue = value.round();
                    print(
                        'sliderValue: $sliderValue = ${state.firstServoValue}');
                    if (sliderValue != state.firstServoValue) {
                      cubit.handleFirstSliderChange(sliderValue);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SliderBlock(
                  name: 'Servo 2',
                  currentValue: state.secondServoValue,
                  onChange: (value) {
                    print('secondServoValue: $value');
                    int sliderValue = value.round();
                    if (sliderValue != state.secondServoValue) {
                      cubit.handleSecondSliderChange(sliderValue);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SliderBlock(
                  name: 'Servo 3',
                  currentValue: state.thirdServoValue,
                  onChange: (value) {
                    print('thirdServoValue: $value');
                    int sliderValue = value.round();
                    if (sliderValue != state.thirdServoValue) {
                      cubit.handleThirdSliderChange(sliderValue);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SliderBlock(
                  name: 'Servo 4',
                  currentValue: state.fourthServoValue,
                  onChange: (value) {
                    print('fourthServoValue: $value');
                    int sliderValue = value.round();
                    if (sliderValue != state.fourthServoValue) {
                      cubit.handleFourthSliderChange(sliderValue);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SliderBlock(
                  name: 'Servo 5',
                  currentValue: state.fifthServoValue,
                  onChange: (value) {
                    print('fifthServoValue: $value');
                    int sliderValue = value.round();
                    if (sliderValue != state.fifthServoValue) {
                      cubit.handleFifthSliderChange(sliderValue);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SliderBlock(
                  name: 'Servo 6',
                  currentValue: state.sixthServoValue,
                  onChange: (value) {
                    print('sixthServoValue: $value');
                    int sliderValue = value.round();
                    if (sliderValue != state.sixthServoValue) {
                      cubit.handleSixthSliderChange(sliderValue);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SliderBlock extends StatelessWidget {
  final String name;
  final int currentValue;
  final Function(double value) onChange;

  const SliderBlock({
    required this.name,
    required this.currentValue,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: currentValue.toDouble(),
            min: 0,
            max: 180,
            divisions: 36,
            label: '$currentValue',
            onChanged: (value) {
              onChange(value);
            },
          ),
        ),
      ],
    );
  }
}
