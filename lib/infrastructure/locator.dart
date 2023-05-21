import 'package:crossover_reward_app/locator.dart';

import 'network/network_client.dart';

Future<void> setupInfrastructureDependencies() async {
  /// Network Client
  locator.registerLazySingleton<NetworkClient>(() => NetworkClient());
}
