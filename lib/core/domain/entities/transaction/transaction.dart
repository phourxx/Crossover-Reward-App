import 'package:crossover_reward_app/infrastructure/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  String id;
  String title;
  String date;
  num amount;
  bool bird;
  String? status;

  DateTime get dateObject => DateTime.parse(date);
  String get formattedAmount => formatAmountWithCurrency(amount);

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.bird,
    this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

