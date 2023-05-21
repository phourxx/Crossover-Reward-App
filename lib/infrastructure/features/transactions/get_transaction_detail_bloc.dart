import 'package:crossover_reward_app/core/app/DTOs/error_response/error_response.dart';
import 'package:crossover_reward_app/core/app/enums.dart';
import 'package:crossover_reward_app/core/app/models/app_state.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:crossover_reward_app/infrastructure/network/network_client.dart';
import 'package:crossover_reward_app/infrastructure/network/repositories/reward_repository/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetTransactionDetailBloc extends Cubit<AppState<Transaction>> {
  final NetworkClient networkClient;
  GetTransactionDetailBloc({required this.networkClient}): super(AppState(loadingState: AppLoadingState.nothing));

  void call(String id)async{
    emit(AppState(loadingState: AppLoadingState.loading));
    final repo = networkClient.getService<ChopperRewardRepository>();
    final resp = await repo.transactionDetail(id: id);
    if(resp.body != null){
      emit(AppState(loadingState: AppLoadingState.success, data: resp.body!));
    }else{
      final error = resp.error as ErrorResponse;
      emit(AppState(loadingState: AppLoadingState.failed, message: error.message));
    }
  }
}
