import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/infrastructure/utils.dart';
import 'package:crossover_reward_app/presentation/shared/app_surface_container.dart';
import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'app_text.dart';


class AppTransactionItemListTile extends StatelessWidget {
  final Transaction transaction;
  final ValueChanged<Transaction> onTap;
  final bool showTopRadius;
  final bool showBottomRadius;

  const AppTransactionItemListTile({
    super.key,
    required this.transaction,
    required this.onTap,
    required this.showTopRadius,
    required this.showBottomRadius,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Theme.of(context);
    return InkWell(
      onTap: ()=> onTap(transaction),
      child: AppSurfaceContainer(
        showTopRadius: showTopRadius,
        showBottomRadius: showBottomRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  transaction.title,
                  weight: FontWeight.w600,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if(transaction.bird) ...[
                  Gap(4.w),
                  SvgPicture.asset('bird'.svg)
                ],
                const Spacer(),
                AppText(
                  transaction.formattedAmount,
                  weight: FontWeight.w600,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  opticalSize: 15.sp,
                  color: AppColors.iconGray[themeProvider.brightness],
                )
              ],
            ),
            Gap(2.h),
            AppText(
              formatDate(transaction.dateObject, [MM, ' ', dd, ', ', yyyy]),
              color: valueForTheme(
                context,
                darkValue: Colors.white.withOpacity(.55),
                lightValue: const Color(0xFF828282).withOpacity(.85),
              ),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
