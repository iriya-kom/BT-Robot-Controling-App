part of 'home_page_cubit.dart';

class HomePageState {
  final BtConnectionStatus status;
  final String statusName;
  final int firstServoValue;
  final int secondServoValue;
  final int thirdServoValue;
  final int fourthServoValue;
  final int fifthServoValue;
  final int sixthServoValue;

  HomePageState({
    required this.status,
    required this.statusName,
    required this.firstServoValue,
    required this.secondServoValue,
    required this.thirdServoValue,
    required this.fourthServoValue,
    required this.fifthServoValue,
    required this.sixthServoValue,
  });

  HomePageState copyWith({
    BtConnectionStatus? status,
    String? statusName,
    int? firstServoValue,
    int? secondServoValue,
    int? thirdServoValue,
    int? fourthServoValue,
    int? fifthServoValue,
    int? sixthServoValue,
  }) =>
      HomePageState(
        status: status ?? this.status,
        statusName: statusName ?? this.statusName,
        firstServoValue: firstServoValue ?? this.firstServoValue,
        secondServoValue: secondServoValue ?? this.secondServoValue,
        thirdServoValue: thirdServoValue ?? this.thirdServoValue,
        fourthServoValue: fourthServoValue ?? this.fourthServoValue,
        fifthServoValue: fifthServoValue ?? this.fifthServoValue,
        sixthServoValue: sixthServoValue ?? this.sixthServoValue,
      );

  factory HomePageState.init() {

    return HomePageState(
      status: BtConnectionStatus.connecting,
      statusName: 'Not Connected',
      firstServoValue: 90,
      secondServoValue: 90,
      thirdServoValue: 90,
      fourthServoValue: 90,
      fifthServoValue: 90,
      sixthServoValue: 90,
    );
  }
}
