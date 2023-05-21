
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

String formatAmountWithCurrency(num amount) {
  final fmt = NumberFormat.simpleCurrency(
    locale: Platform.localeName,
    name: "USD",
  );
  MoneyFormatter amountFormatter = MoneyFormatter(
    amount: (math.max(amount, -amount)).toDouble(),
    settings: MoneyFormatterSettings(
      symbol: fmt.currencySymbol,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolAndNumberSeparator: '',
      fractionDigits: 2,
      compactFormatType: CompactFormatType.short,
    ),
  );
  return (amount < 0 ? '-' : '') + amountFormatter.output.symbolOnLeft;
}

T valueForTheme<T>(BuildContext context, {required T darkValue, required T lightValue}){
  if (Theme.of(context).brightness == Brightness.dark){
    return darkValue;
  }
  return lightValue;
}