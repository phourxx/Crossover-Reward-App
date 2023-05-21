import 'dart:io';
import 'package:crossover_reward_app/presentation/theme/app_theme_provider.dart';
import 'package:crossover_reward_app/presentation/theme/dark_theme.dart';
import 'package:crossover_reward_app/presentation/theme/light_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/app/app_config.dart';
import 'infrastructure/features/rewards/get_reward_bloc.dart';
import 'infrastructure/features/transactions/get_transaction_detail_bloc.dart';
import 'infrastructure/features/transactions/get_transactions_bloc.dart';
import 'locator.dart';
import 'routes.dart';

late AppConfig appConfig;
late String userAgent;
late String appVersion;

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();

  static Future init(AppConfig config) async {
    var info = await PackageInfo.fromPlatform();
    appConfig = config;
    appVersion = info.version;
    userAgent = '${info.appName} ${info.version} on ${Platform.operatingSystem} - ${Platform.operatingSystemVersion}}';
    debugPrint('UserAgent: $userAgent');

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (kReleaseMode) {
      debugPrint = (_, {int? wrapWidth}) {};
    }else{
      _setupLogging();
    }
    await setUpDependencies();
    runApp(const App());
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetRewardBloc>(
          create: (BuildContext context) => GetRewardBloc(networkClient: locator()),
        ),
        BlocProvider<GetTransactionsBloc>(
          create: (BuildContext context) => GetTransactionsBloc(networkClient: locator()),
        ),
        BlocProvider<GetTransactionDetailBloc>(
          create: (BuildContext context) => GetTransactionDetailBloc(networkClient: locator()),
        ),
      ],
      child: AppThemeProvider(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Rewards App',
              debugShowCheckedModeBanner: false,
              themeMode: AppThemeProvider.of(context).themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
              routerConfig: router,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: GestureDetector(
                    onTap: () {
                      final f = FocusNode();
                      Focus.of(context).requestFocus(f);
                    },
                    child: child,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

