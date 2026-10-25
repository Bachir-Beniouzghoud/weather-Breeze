import 'package:flutter/material.dart';

class WeatherModel {
  final String locationName;
  final String country;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final double windSpeed;
  final String weatherMain;
  final String description;
  final int dt;

  WeatherModel({
    required this.locationName,
    required this.country,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.weatherMain,
    required this.description,
    required this.dt,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json['name'] ?? '',
      country: json['sys']?['country'] ?? '',
      // تحويل درجة الحرارة من كلفن إلى سيليزيوس
      temp: (json['main']['temp'] as num).toDouble() - 273.15,
      tempMin: (json['main']['temp_min'] as num).toDouble() - 273.15,
      tempMax: (json['main']['temp_max'] as num).toDouble() - 273.15,
      humidity: json['main']['humidity'] ?? 0,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      weatherMain: json['weather']?[0]?['main'] ?? '',
      description: json['weather']?[0]?['description'] ?? '',
      dt: json['dt'] ?? 0,
    );
  }
}

class WeatherScreen extends StatelessWidget {
  // بيانات JSON الخاصة بالطقس
  final Map<String, dynamic> weatherData = {
    "coord": {"lon": 3, "lat": 28},
    "weather": [
      {
        "id": 803,
        "main": "Clouds",
        "description": "broken clouds",
        "icon": "04n",
      },
    ],
    "base": "stations",
    "main": {
      "temp": 297.33,
      "feels_like": 297.16,
      "temp_min": 297.33,
      "temp_max": 297.33,
      "pressure": 1017,
      "humidity": 52,
      "sea_level": 1017,
      "grnd_level": 942,
    },
    "visibility": 10000,
    "wind": {"speed": 6.21, "deg": 50, "gust": 9.62},
    "clouds": {"all": 74},
    "dt": 1792175215,
    "sys": {"country": "DZ", "sunrise": 1792129716, "sunset": 1792171095},
    "timezone": 3600,
    "id": 2589581,
    "name": "الجزائر",
    "cod": 200,
  };

  WeatherScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // تحويل الـ JSON إلى النموذج
    final weather = WeatherModel.fromJson(weatherData);

    return Scaffold(
      backgroundColor: const Color(0xFF64B5F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // الشريط العلوي (المدينة والتاريخ)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weather.locationName}، ${weather.country}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "الأربعاء، 26 مايو 15:00",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // قسم الحرارة الرئيسية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.wb_sunny, color: Colors.amber, size: 64),
                  Text(
                    "${weather.temp.round()}°",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weather.tempMax.round()}°",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${weather.tempMin.round()}°",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // توقعات الساعات
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildHourlyItem(
                      "الآن",
                      Icons.wb_sunny,
                      Colors.amber,
                      "${weather.humidity}%",
                      "${weather.windSpeed.round()} م/ث",
                    ),
                    _buildHourlyItem(
                      "16:00",
                      Icons.cloud,
                      Colors.lightBlue,
                      "37%",
                      "7 م/ث",
                    ),
                    _buildHourlyItem(
                      "17:00",
                      Icons.wb_sunny,
                      Colors.amber,
                      "23%",
                      "4 م/ث",
                    ),
                    _buildHourlyItem(
                      "18:00",
                      Icons.cloud,
                      Colors.grey,
                      "45%",
                      "8 م/ث",
                    ),
                    _buildHourlyItem(
                      "19:00",
                      Icons.grain,
                      Colors.blue,
                      "75%",
                      "7 م/ث",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // توقعات الأيام
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            _buildDailyRow(
                              "اليوم",
                              "${weather.humidity}%",
                              "${weather.windSpeed.round()} م/ث",
                              Icons.cloud_queue,
                              "${weather.tempMax.round()}°/${weather.tempMin.round()}°",
                            ),
                            _buildDailyRow(
                              "الخميس",
                              "7%",
                              "3 م/ث",
                              Icons.wb_sunny,
                              "31°/19°",
                            ),
                            _buildDailyRow(
                              "الجمعة",
                              "15%",
                              "5 م/ث",
                              Icons.cloud,
                              "28°/15°",
                            ),
                            _buildDailyRow(
                              "السبت",
                              "44%",
                              "2 م/ث",
                              Icons.cloud_queue,
                              "26°/15°",
                            ),
                            _buildDailyRow(
                              "الأحد",
                              "87%",
                              "8 م/ث",
                              Icons.grain,
                              "23°/14°",
                            ),
                            _buildDailyRow(
                              "الإثنين",
                              "89%",
                              "6 م/ث",
                              Icons.thunderstorm,
                              "22°/13°",
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF64B5F6),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          "المزيد",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // عنصر التوقعات بالساعة
  Widget _buildHourlyItem(
    String time,
    IconData icon,
    Color iconColor,
    String humidity,
    String wind,
  ) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(height: 8),
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(height: 8),
        Icon(Icons.water_drop, color: Colors.blue.shade300, size: 12),
        Text(
          humidity,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Icon(Icons.air, color: Colors.blue.shade300, size: 12),
        Text(wind, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  // صف التوقعات اليومية
  Widget _buildDailyRow(
    String day,
    String humidity,
    String wind,
    IconData icon,
    String temp,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              day,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Icon(Icons.water_drop, color: Colors.blue.shade300, size: 12),
              const SizedBox(width: 2),
              Text(
                humidity,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.air, color: Colors.blue.shade300, size: 12),
              const SizedBox(width: 2),
              Text(
                wind,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          Icon(icon, color: Colors.amber, size: 20),
          Text(temp, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
