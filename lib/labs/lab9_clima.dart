import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '36b56d6bf6e1802e3c6f007330ff8dff';
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

// MÀN HÌNH LOADING (Màn hình đầu tiên của Lab 9)

class Lab9Screen extends StatefulWidget {
  const Lab9Screen({super.key});

  @override
  State<Lab9Screen> createState() => _Lab9ScreenState();
}

class _Lab9ScreenState extends State<Lab9Screen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Hàm lấy vị trí và gọi API
  void getLocationData() async {
    try {
      // Yêu cầu quyền vị trí
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Quyền truy cập vị trí bị từ chối');
        }
      }

      // Lấy tọa độ GPS
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      // Gọi API thời tiết
      http.Response response = await http.get(
        Uri.parse(
          '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        var weatherData = jsonDecode(response.body);

        // Chuyển sang màn hình hiển thị thời tiết và truyền dữ liệu qua
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherScreen(locationWeather: weatherData),
            ),
          );
        }
      } else {
        print('Lỗi gọi API: ${response.statusCode}');
      }
    } catch (e) {
      print('Có lỗi xảy ra: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Đang tìm vị trí và thời tiết...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
//  MÀN HÌNH HIỂN THỊ THỜI TIẾT

class WeatherScreen extends StatefulWidget {
  final dynamic locationWeather;
  const WeatherScreen({super.key, this.locationWeather});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  // Hàm xử lý dữ liệu JSON để hiển thị lên giao diện
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Không thể lấy dữ liệu';
        cityName = '';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = getWeatherIcon(condition);
      weatherMessage = getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  // Helper lấy Icon
  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  // Helper lấy câu chú thích
  String getMessage(int temp) {
    if (temp > 25) return 'Đã đến lúc ăn 🍦';
    if (temp > 20) return 'Mặc áo phông 👕 là hợp lý';
    if (temp < 10) return 'Bạn sẽ cần 🧣 và 🧤';
    return 'Mang theo 🧥 đề phòng nhé';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Weather'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Trở về Main Menu của bạn
        ),
      ),
      body: Container(
        color: Colors.blueGrey[900],
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: const TextStyle(
                        fontSize: 100.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(weatherIcon, style: const TextStyle(fontSize: 80.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 50.0),
                child: Text(
                  "$weatherMessage ở $cityName!",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
