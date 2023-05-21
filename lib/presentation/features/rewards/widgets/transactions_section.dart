import 'package:crossover_reward_app/core/app/enums.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:crossover_reward_app/presentation/shared/app_sliver_separated_child_builder_delegate.dart';
import 'package:crossover_reward_app/presentation/shared/app_surface_container.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:crossover_reward_app/presentation/shared/app_transaction_item_list_tile.dart';
import 'package:crossover_reward_app/presentation/shared/either_or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsSection extends StatelessWidget {
  final AppLoadingState state;
  final List<Transaction>? transactions;
  final ValueChanged<Transaction> onTransactionTap;
  final VoidCallback onRetry;

  const TransactionsSection({
    super.key,
    required this.state,
    this.transactions,
    required this.onTransactionTap,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      sliver: EitherOr(
        state == AppLoadingState.success,
        buildFirst: (_)=> Builder(builder: (context)=> SliverList(
          delegate: AppSliverSeparatedChildBuilderDelegate(
            (c, i) => AppTransactionItemListTile(
              key: Key(transactions![i].id),
              transaction: transactions![i],
              showTopRadius: i == 0,
              showBottomRadius: i == transactions!.length - 1,
              onTap: (transaction) => onTransactionTap(transaction),
            ),
            childCount: transactions!.length,
            separatorBuilder: (c, _) => const AppSurfaceContainer(
              showBottomRadius: false,
              showTopRadius: false,
              showVerticalPadding: false,
              child: Divider(height: 1),
            ),
          ),
        )),
        buildSecond: (_) => SliverToBoxAdapter(
          child: AppSurfaceContainer(
            child: Builder(builder: (context){
              switch(state) {
                case AppLoadingState.empty:
                  return const AppText(
                    'No transactions to display',
                    textAlign: TextAlign.center,
                  );
                case AppLoadingState.nothing:
                  return const SizedBox.shrink();
                case AppLoadingState.loading:
                  return const CircularProgressIndicator.adaptive();
                case AppLoadingState.failed:
                  return Center(
                    child: InkWell(
                      onTap: onRetry,
                      child: const AppText(
                        'Failed to load. Tap to retry',
                        color: Colors.red,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                case AppLoadingState.success:
                  return const SizedBox.shrink();
              }
            }),
          ),
        ),
      ),
    );
  }
}
