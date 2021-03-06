import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedDeviceAlarm {
  final List<DeviceAlarm> results;

  AutogeneratedDeviceAlarm({this.results});

  factory AutogeneratedDeviceAlarm.fromJson(Map<String, dynamic> json) {
    List<DeviceAlarm> temp = <DeviceAlarm>[];

    if (json['results'] != null) {
      json['results']?.forEach((v) {
        temp.add(DeviceAlarm.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedDeviceAlarm(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['alarms'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@immutable
class DeviceAlarm extends Equatable {
  final int id;
  final String deviceID;
  final String timestamp;
  final String state;

  DeviceAlarm({
    @required this.id,
    this.deviceID,
    this.state,
    this.timestamp,
  });

  @override
  List<Object> get props => [id, deviceID];

  factory DeviceAlarm.fromJson(Map<String, dynamic> json) {
    return DeviceAlarm(
      id: json['id'] as int,
      deviceID: json['deviceID'] as String,
      state: json['state'] as String,
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['deviceID'] = deviceID;
    data['state'] = state;
    data['timestamp'] = timestamp;
    return data;
  }
}
