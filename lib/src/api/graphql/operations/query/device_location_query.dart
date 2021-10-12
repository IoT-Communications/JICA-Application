String getDeviceLocationsQuery = """
query getDeviceLocations(){
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
