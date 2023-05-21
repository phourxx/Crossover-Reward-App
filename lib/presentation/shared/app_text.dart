import 'package:crossover_reward_app/infrastructure/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final double? size;
  final double? height;
  final Color? color;
  final String? family;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const AppText(this.text,
      {Key? key,
      this.style,
      this.size,
      this.height = 24,
      this.color,
      this.family,
      this.overflow,
      this.weight,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = style ?? const TextStyle();
    final style2 = TextStyle(
      inherit: true,
      color: color ?? valueForTheme(
        context,
        darkValue: Colors.white,
        lightValue: Colors.black,
      ),
      fontWeight: weight,
      fontSize: size != null ? size!.sp : null,
      height: size != null ? (height! / size!) : null,
      fontFamily: family,
    );
    return Text(text ?? "",
      textAlign: textAlign,
      overflow: overflow,
      style: style1.merge(style2),
    );
  }
}
