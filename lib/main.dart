import 'package:crossover_reward_app/app.dart';
import 'package:crossover_reward_app/core/app/app_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig(baseUrl: 'https://ios.rp.devfactory.com');
  await App.init(config);
}
