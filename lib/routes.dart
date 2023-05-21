import 'package:crossover_reward_app/presentation/features/account/account_view.dart';
import 'package:crossover_reward_app/presentation/features/rewards/rewards_view.dart';
import 'package:crossover_reward_app/presentation/features/splash/splash_view.dart';
import 'package:crossover_reward_app/presentation/features/transaction/transaction_detail_view.dart';
import 'package:crossover_reward_app/presentation/shared/app_navigation_layout.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SplashView.route,
      name: 'SplashView',
      builder: (context, state) => const SplashView(),
    ),
    ShellRoute(
      builder: (context, state, child){
        return AppNavigationLayout(child: child);
      },
      routes: [
        GoRoute(
          path: RewardsView.route,
          name: 'RewardsView',
          builder: (context, state) => const RewardsView(),
        ),
        GoRoute(
          path: AccountView.route,
          name: 'AccountView',
          builder: (context, state) => const AccountView(),
        ),
        GoRoute(
          path: TransactionDetailView.route,
          name: 'TransactionDetailView',
          builder: (context, state){
            return TransactionDetailView(
              transactionId: state.pathParameters['transactionId']!,
            );
          },
        ),
      ],
    ),
  ],
);
