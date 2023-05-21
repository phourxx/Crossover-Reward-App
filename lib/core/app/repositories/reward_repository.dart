abstract class IRewardRepository{
  Future rewardInfo();
  Future transactions();
  Future transactionDetail({required id});
}
