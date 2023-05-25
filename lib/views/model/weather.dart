class Weather {
  final String location;
  final String country;
  final num temp;
  final double maxTemp;
  final double minTemp;
  final double windSpeed;
  final double feelsLike;
  final int humidity;
  final String description;
  final String icon;
  final DateTime sunrise;
  final DateTime sunset;
  final int timezoneOffset;
  final int pressure;

  Weather(
      {required this.location,
      required this.temp,
      required this.maxTemp,
      required this.windSpeed,
      required this.feelsLike,
      required this.minTemp,
      required this.description,
      required this.humidity,
      required this.pressure,
      required this.icon,
      required this.sunrise,
      required this.sunset,
      required this.timezoneOffset,
      required this.country});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    final sunriseUnixTime = json["sys"]["sunrise"] as int;
    final sunsetUnixTime = json["sys"]["sunset"] as int;
    final timezoneOffset = json["timezone"] as int;
    final sunriseDateTime = unixTimeToDateTime(sunriseUnixTime, timezoneOffset);
    final sunsetDateTime = unixTimeToDateTime(sunsetUnixTime, timezoneOffset);

    return Weather(
      location: json["name"],
      country: json["sys"]["country"],
      temp: json["main"]["temp"],
      windSpeed: json["wind"]["speed"],
      minTemp: json["main"]["temp_min"],
      maxTemp: json["main"]["temp_max"],
      feelsLike: json["main"]["feels_like"],
      humidity: json["main"]["humidity"],
      description: json["weather"][0]['description'],
      icon: json["weather"][0]["icon"],
      sunrise: sunriseDateTime,
      sunset: sunsetDateTime,
      timezoneOffset: timezoneOffset,
      pressure: json["main"]["pressure"],
    );
  }

  static DateTime unixTimeToDateTime(int unixTime, int timezoneOffset) {
    return DateTime.fromMillisecondsSinceEpoch(
        (unixTime + timezoneOffset) * 1000,
        isUtc: true);
  }
}
