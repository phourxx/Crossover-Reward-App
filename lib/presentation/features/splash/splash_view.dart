import 'dart:async';

import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/presentation/features/rewards/rewards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  static get route => '/';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(const Duration(seconds: 1), (){
        context.go(RewardsView.route);
      });
    });
    return Material(
      child: Center(
        child: Hero(tag: 'logo', child: SvgPicture.asset('bird'.svg, width: 80.w)),
      ),
    );
  }
}
