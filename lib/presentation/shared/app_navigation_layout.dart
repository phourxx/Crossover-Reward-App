import 'package:crossover_reward_app/presentation/features/account/account_view.dart';
import 'package:crossover_reward_app/presentation/features/rewards/rewards_view.dart';
import 'package:flutter/material.dart';

import 'app_bottom_navigation_bar.dart';

class AppNavigationLayout extends StatefulWidget {
  final Widget child;
  const AppNavigationLayout({super.key, required this.child,});

  static _AppNavigationLayoutState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<_AppNavigationLayoutStateProvider>()!.state;

  @override
  _AppNavigationLayoutState createState() => _AppNavigationLayoutState();
}

class _AppNavigationLayoutState extends State<AppNavigationLayout> {
  @override
  Widget build(BuildContext context) {
    return _AppNavigationLayoutStateProvider(
      state: this,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: widget.child,
        bottomNavigationBar: AppBottomNavigationBar(
          items: [
            AppNavigationItem(label: 'Rewards', route: RewardsView.route),
            AppNavigationItem(label: 'Account', route: AccountView.route),
          ],
        ),
      ),
    );
  }
}
class _AppNavigationLayoutStateProvider extends InheritedWidget {
  final _AppNavigationLayoutState state;

  _AppNavigationLayoutStateProvider({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _AppNavigationLayoutStateProvider old) => false;
}