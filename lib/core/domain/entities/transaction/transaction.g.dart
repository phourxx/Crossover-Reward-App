// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      amount: json['amount'] as num,
      bird: json['bird'] as bool,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'amount': instance.amount,
      'bird': instance.bird,
      'status': instance.status,
    };
