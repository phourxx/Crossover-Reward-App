import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:crossover_reward_app/core/app/DTOs/error_response/error_response.dart';
import 'package:crossover_reward_app/core/app/api_urls.dart';
import 'package:crossover_reward_app/core/domain/entities/reward/reward.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:flutter/material.dart';

import 'repositories/reward_repository/chopper.dart';


final Map<Type, Function> converters = {
  ErrorResponse: ErrorResponse.fromJson,
  Reward: Reward.fromJson,
  List<Transaction>: (List jsonList)=> jsonList.map((json)=> Transaction.fromJson(json)).toList(),
  Transaction: Transaction.fromJson,
};

final services = [
  ChopperRewardRepository.create(ChopperClient()),
];

class SerializableErrorConverter implements ErrorConverter {
  @override
  FutureOr<Response<BodyType>> convertError<BodyType, InnerType>(
      Response response) async {
    final converter = converters[BodyType];
    try {
      var jsonRes = jsonDecode(response.body);
      final r = response.copyWith<BodyType>(
        body: converter != null ? converter(jsonRes) : response.body,
      );
      return r;
    } catch (e, st) {
      debugPrintStack(stackTrace: st);
      final map = {
        'message': 'Request could not be completed due to an unknown error, please try again',
      };
      return response.copyWith<BodyType>(
        body: converter != null ? converter(map) : response.body,
      );
    }
  }
}

class SerializableConverter extends JsonConverter {
  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    var jsonRes = await super.convertResponse(response);
    final converter = converters[BodyType];
    return jsonRes.copyWith<BodyType>(
      body: converter != null ? converter(jsonRes.body) : jsonRes.body,
    );
  }

  @override
  FutureOr<Response<BodyType>> convertError<BodyType, InnerType>(
      Response response) async {
    final converter = converters[BodyType];
    try {
      var jsonRes = jsonDecode(response.body);
      return response.copyWith<BodyType>(
        body: converter != null ? converter(jsonRes) : response.body,
      );
    } catch (e, st) {
      debugPrintStack(stackTrace: st);
      final map = {
        'message': 'Request could not be completed due to an unknown error, please try again',
      };
      return response.copyWith<BodyType>(
        body: converter != null ? converter(map) : response.body,
      );
    }
  }
}

class NetworkClient extends ChopperClient {
  NetworkClient()
      : super(
          baseUrl: Uri.parse(ApiUrls.baseUrl),
          converter: SerializableConverter(),
          errorConverter: SerializableErrorConverter(),
          interceptors: [
            HttpLoggingInterceptor(),
          ],
          services: services,
        );
}
