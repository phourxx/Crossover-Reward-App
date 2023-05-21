// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ChopperRewardRepository extends ChopperRewardRepository {
  _$ChopperRewardRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperRewardRepository;

  @override
  Future<Response<Reward>> rewardInfo() {
    final Uri $url = Uri.parse('/rewards');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Reward, Reward>($request);
  }

  @override
  Future<Response<List<Transaction>>> transactions() {
    final Uri $url = Uri.parse('/rewards/transactions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Transaction>, Transaction>($request);
  }

  @override
  Future<Response<Transaction>> transactionDetail({dynamic id}) {
    final Uri $url = Uri.parse('/rewards/transactions/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Transaction, Transaction>($request);
  }
}
