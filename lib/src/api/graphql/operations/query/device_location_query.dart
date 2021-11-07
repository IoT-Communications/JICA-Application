String getDeviceLocationsQuery = """
query getDeviceLocations{
  getDeviceLocations{
    deviceLocations{
      id
      deviceID
      latitude
      longitude
      status
      timestamp
    }
    error{
      path
      message
    }
  }
}
""";

String deviceBatteryInformationQuery = """
query getDeviceBattery(\$deviceID: String!){
    getDeviceBattery(deviceID: \$deviceID){
        deviceBatteries{
        id
        deviceID
        stepNum
        batteryVoltage
        signalStrength
        timestamp
      }
    }
  }
""";

String deviceHealthInformationQuery = """
  query getDeviceHealth(\$deviceID: String!){
    getDeviceHealth(deviceID: \$deviceID){
      deviceHealth{
        id
        deviceID
        bpHigh
        bpLow
        heartRate
        timestamp
      }
    }
  }
""";

String deviceTempInformationQuery = """
query getDeviceTemperature(\$deviceID: String!){
  getDeviceTemperature(deviceID: \$deviceID){
    error{
      path
      message
    }
    deviceTemp{
      deviceID
      skinTemp
      bodyTemp
      timestamp
    }
  }
}
""";

String deviceAlarmInformationQuery = """
query getDeviceAlarm(\$deviceID: String!){
  getDeviceAlarm(deviceID:\$deviceID){
    error{
      path
      message
    }
    deviceAlarm{
      deviceID
      state
      timestamp
    }
	}
}
""";
