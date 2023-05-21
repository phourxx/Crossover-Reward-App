// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      cardNumber: json['cardNumber'] as String,
      cardExpirationDate: json['cardExpirationDate'] as String,
      balance: json['balance'] as num,
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardExpirationDate': instance.cardExpirationDate,
      'balance': instance.balance,
      'transactions': instance.transactions,
    };
