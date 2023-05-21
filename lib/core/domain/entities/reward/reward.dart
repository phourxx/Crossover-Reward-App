import 'package:json_annotation/json_annotation.dart';
import '../transaction/transaction.dart';

part 'reward.g.dart';

@JsonSerializable()
class Reward {
  String cardNumber;
  String cardExpirationDate;
  num balance;
  List<Transaction> transactions;
  
  String get formattedExpiry{
    final parts = cardExpirationDate.split('-');
    return "${parts[0].substring(2)}/${parts[1]}";
  } 

  Reward({
    required this.cardNumber,
    required this.cardExpirationDate,
    required this.balance,
    required this.transactions,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}

