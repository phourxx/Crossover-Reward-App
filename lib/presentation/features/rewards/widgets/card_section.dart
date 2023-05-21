import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CardSection extends StatelessWidget {
  final String? cardExpiry;
  final String? cardNo;
  const CardSection({super.key, this.cardExpiry, this.cardNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221.h,
      margin: EdgeInsets.symmetric(
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('card_shadow'.png),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('card_bg'.png),
            fit: BoxFit.fill,
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 2.w,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 12.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'alpha_logo'.svg,
              alignment: Alignment.centerLeft,
            ),
            const Spacer(),
            AppText(
              "**** ${cardNo ?? ''}",
              size: 22,
              height: 26.25,
              weight: FontWeight.w700,
              color: Colors.white,
              style: TextStyle(
                letterSpacing: 4.sp
              ),
            ),
            Gap(20.h),
            AppText(
              "Expiration Date",
              color: Colors.white,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  cardExpiry ?? '__/__',
                  color: Colors.white,
                  weight: FontWeight.w700,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SvgPicture.asset('visa'.svg)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
