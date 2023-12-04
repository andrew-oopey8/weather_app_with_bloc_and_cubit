import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Partly cloudy' ||
      condition == 'Cloudy' ||
      condition == 'Overcast') {
    return Colors.grey;
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.grey;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Patchy light drizzle' ||
      condition == 'Patchy light rain') {
    return Colors.lightBlue;
  } else if (condition == 'Moderate rain at times' ||
      condition == 'Moderate rain' ||
      condition == 'Moderate or heavy freezing rain' ||
      condition == 'Moderate or heavy sleet' ||
      condition == 'Moderate or heavy snow' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Torrential rain shower' ||
      condition == 'Moderate or heavy sleet showers' ||
      condition == 'Moderate or heavy snow showers' ||
      condition == 'Moderate or heavy showers of ice pellets' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.indigo;
  } else if (condition == 'Blowing snow' ||
      condition == 'Blizzard' ||
      condition == 'Thundery outbreaks possible' ||
      condition == 'Freezing drizzle' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Heavy rain at times' ||
      condition == 'Heavy rain' ||
      condition == 'Light freezing rain' ||
      condition == 'Light sleet' ||
      condition == 'Light snow' ||
      condition == 'Patchy moderate snow' ||
      condition == 'Moderate snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Heavy snow' ||
      condition == 'Ice pellets' ||
      condition == 'Light rain shower' ||
      condition == 'Light sleet showers' ||
      condition == 'Light snow showers' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Patchy light snow with thunder') {
    return Colors.blueGrey;
  } else if (condition == 'Light drizzle' ||
      condition == 'Freezing drizzle' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Light rain' ||
      condition == 'Light freezing rain' ||
      condition == 'Light sleet' ||
      condition == 'Light snow' ||
      condition == 'Light rain shower' ||
      condition == 'Light sleet showers' ||
      condition == 'Light snow showers' ||
      condition == 'Light showers of ice pellets') {
    return Colors.lightBlue;
  } else if (condition == 'Patchy moderate snow' ||
      condition == 'Moderate snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Heavy snow' ||
      condition == 'Ice pellets' ||
      condition == 'Moderate or heavy snow showers' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    return Colors.lime;
  } else if (condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.blue;
  }
}
