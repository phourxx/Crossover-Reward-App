import 'package:crossover_reward_app/infrastructure/utils.dart';
import 'package:crossover_reward_app/presentation/shared/app_surface_container.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class BalanceSection extends StatelessWidget {
  final num? balance;
  const BalanceSection({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final today = formatDate(DateTime.now(), [MM, ' ', dd, ', ', yyyy]);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(
            'Current Balance',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(4.h),
          AppSurfaceContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText(
                  'Balance as of $today',
                  color: valueForTheme(
                    context,
                    darkValue: Colors.white.withOpacity(.55),
                    lightValue: const Color(0xFF828282).withOpacity(.85),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Gap(4.h),
                AppText(
                  formatAmountWithCurrency(balance ?? 0),
                  weight: FontWeight.w700,
                  size: 30,
                  height: 35.8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
