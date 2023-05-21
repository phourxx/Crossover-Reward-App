import 'dart:async';

import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/presentation/features/rewards/rewards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  static get route => '/';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), (){
      context.go(RewardsView.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: SvgPicture.asset('bird'.svg, width: 80.w),
      ),
    );
  }
}
