import 'package:crossover_reward_app/core/app/enums.dart';
import 'package:crossover_reward_app/core/app/models/app_state.dart';
import 'package:crossover_reward_app/core/domain/entities/reward/reward.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:crossover_reward_app/infrastructure/features/rewards/get_reward_bloc.dart';
import 'package:crossover_reward_app/infrastructure/features/transactions/get_transactions_bloc.dart';
import 'package:crossover_reward_app/presentation/features/rewards/widgets/balance_section.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/card_section.dart';
import 'widgets/header_delegate.dart';
import 'widgets/transactions_section.dart';


class RewardsView extends StatelessWidget {
  static get route => '/rewards';
  const RewardsView({super.key});

  void _fetchRewards(BuildContext context){
    final getRewards = context.read<GetRewardBloc>();
    getRewards();
    context.read<GetTransactionsBloc>().clear();
  }

  @override
  Widget build(BuildContext context) {
    final controller = RefreshController(initialRefresh: true);
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<GetRewardBloc, AppState<Reward>>(
            listener: (context, state) {
              if (state.loadingState == AppLoadingState.success) {
                controller.refreshCompleted();
              } else if (state.loadingState == AppLoadingState.empty) {
                controller.refreshToIdle();
              } else if (state.loadingState == AppLoadingState.failed) {
                controller.refreshFailed();
              } else if (state.loadingState == AppLoadingState.loading) {
                controller.requestRefresh();
              }
            },
          ),
          BlocListener<GetTransactionsBloc, AppState<List<Transaction>>>(
            listener: (context, state) {
              switch(state.loadingState){
                case AppLoadingState.nothing:
                  controller.resetNoData();
                  break;
                case AppLoadingState.loading:
                  controller.requestLoading();
                  break;
                case AppLoadingState.failed:
                  controller.loadFailed();
                  break;
                case AppLoadingState.success:
                  controller.loadComplete();
                  break;
                case AppLoadingState.empty:
                  controller.loadNoData();
                  break;
              }
            },
          ),
        ],
        child: BlocBuilder<GetRewardBloc, AppState<Reward>>(
          builder: (context, rewardState){
            return BlocBuilder<GetTransactionsBloc, AppState<List<Transaction>>>(
              builder: (context, transactionsState){
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(
                    waterDropColor: AppColors.primary,
                  ),
                  footer: CustomFooter(
                    builder: (_, LoadStatus? mode) {
                      Widget? body;
                      final color = AppColors.dividerGray[Theme.of(context).brightness];
                      if (mode == LoadStatus.idle) {
                        body = AppText('Pull up to load', color: color);
                      } else if (mode == LoadStatus.loading) {
                        body = const CircularProgressIndicator.adaptive();
                      } else if (mode == LoadStatus.failed) {
                        body = const AppText('Failed, try again', color: Colors.red);
                      } else if (mode == LoadStatus.canLoading) {
                        body = AppText('Release to load more', color: color);
                      } else {
                        body = AppText('No more Data', color: color);
                      }
                      return Container(
                        height: 55.h,
                        alignment: Alignment.center,
                        child: body,
                      );
                    },
                  ),
                  controller: controller,
                  onLoading: () {
                    final getTransactions = context.read<GetTransactionsBloc>();
                    getTransactions();
                  },
                  onRefresh: ()=> _fetchRewards(context),
                  child: CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: HeaderDelegate(),
                      ),
                      SliverToBoxAdapter(
                        child: Gap(22.h),
                      ),
                      SliverToBoxAdapter(
                        child: CardSection(
                          cardExpiry: rewardState.data?.formattedExpiry,
                          cardNo: rewardState.data?.cardNumber,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Gap(14.h),
                      ),
                      SliverToBoxAdapter(
                        child: BalanceSection(balance: rewardState.data?.balance),
                      ),
                      SliverToBoxAdapter(
                        child: Gap(14.h),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            bottom: 4.h,
                          ),
                          child: AppText(
                            'Latest Transaction',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      TransactionsSection(
                        state: rewardState.loadingState,
                        transactions: transactionsState.data ?? rewardState.data?.transactions,
                        onTransactionTap: (transaction){
                          context.pushNamed(
                            'TransactionDetailView',
                            pathParameters: {'transactionId': transaction.id},
                          );
                        },
                        onRetry: ()=> _fetchRewards(context),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
