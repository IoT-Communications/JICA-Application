import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jica/src/utils/debugBro.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedDeviceBattery {
  final List<DeviceBattery> results;

  AutogeneratedDeviceBattery({this.results});

  factory AutogeneratedDeviceBattery.fromJson(Map<String, dynamic> json) {
    List<DeviceBattery> temp = <DeviceBattery>[];

    if (json['results'] != null) {
      json['results']?.forEach((v) {
        temp.add(DeviceBattery.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedDeviceBattery(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['users'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@immutable
class DeviceBattery extends Equatable {
  final int id;
  final String deviceID;
  final int stepNum;
  final int batteryVoltage;
  final int signalStrength;
  final String timestamp;

  DeviceBattery({
    @required this.id,
    this.deviceID,
    this.batteryVoltage,
    this.timestamp,
    this.stepNum,
    this.signalStrength,
  });

  @override
  List<Object> get props => [id, deviceID];

  factory DeviceBattery.fromJson(Map<String, dynamic> json) {
    return DeviceBattery(
      id: json['id'] as int,
      deviceID: json['deviceID'] as String,
      batteryVoltage: json['batteryVoltage'],
      stepNum: json['stepNum'],
      signalStrength: json['signalStrength'],
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['deviceID'] = deviceID;
    data['batteryVoltage'] = batteryVoltage;
    data['stepNum'] = stepNum;
    data['signalStrength'] = signalStrength;
    data['timestamp'] = timestamp;
    return data;
  }
}
