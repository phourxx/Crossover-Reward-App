import 'package:get_it/get_it.dart';

import 'infrastructure/locator.dart';

final locator = GetIt.instance;

Future<void> setUpDependencies() async {
  await setupInfrastructureDependencies();
}
