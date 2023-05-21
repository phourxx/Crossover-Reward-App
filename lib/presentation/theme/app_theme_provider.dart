import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends StatefulWidget {
  final Widget child;
  const AppThemeProvider({super.key, required this.child,});

  static _AppThemeProviderState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<_Provider>()!.state;

  @override
  _AppThemeProviderState createState() => _AppThemeProviderState();
}

class _AppThemeProviderState extends State<AppThemeProvider> {
  ThemeMode? _mode;

  set themeMode(ThemeMode mode){
    setState(() {
      _mode = mode;
    });
  }

  ThemeMode get themeMode => _mode ?? ThemeMode.dark;

  bool get isDark => Theme.of(context).brightness == ThemeMode.dark;


  @override
  Widget build(BuildContext context) {
    return _Provider(
      state: this,
      child: widget.child,
    );
  }
}
class _Provider extends InheritedWidget {
  final _AppThemeProviderState state;

  _Provider({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(_Provider old) {
    return true;
  }
}