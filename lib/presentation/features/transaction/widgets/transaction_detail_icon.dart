import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/presentation/shared/either_or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetailIcon extends StatelessWidget {
  final bool bird;

  const TransactionDetailIcon({
    super.key,
    required this.bird,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w, height: 48.h,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 4.h,
      ),
      decoration: ShapeDecoration(
        color: bird ? const Color(0xFFDBFAFF) : const Color(0xFFE0E0E0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
        ),
      ),
      child: EitherOr(
        bird,
        buildFirst: (_)=> SvgPicture.asset('bird'.svg, width: 40.w),
        buildSecond: (_)=> SvgPicture.asset('debit'.svg),
      ),
    );
  }
}
