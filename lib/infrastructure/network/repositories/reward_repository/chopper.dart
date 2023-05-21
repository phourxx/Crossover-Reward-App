import 'package:chopper/chopper.dart';
import 'package:crossover_reward_app/core/app/repositories/reward_repository.dart';
import 'package:crossover_reward_app/core/domain/entities/reward/reward.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
part 'chopper.chopper.dart';


@ChopperApi(baseUrl: "/rewards")
abstract class ChopperRewardRepository extends IRewardRepository with ChopperService{

  static ChopperRewardRepository create([ChopperClient? client]) =>
      _$ChopperRewardRepository(client);

  @Get()
  @override
  Future<Response<Reward>> rewardInfo();

  @Get(path: 'transactions')
  @override
  Future<Response<List<Transaction>>> transactions();

  @Get(path: 'transactions/{id}')
  @override
  Future<Response<Transaction>> transactionDetail({@Path() id});
}
