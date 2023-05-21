import 'package:crossover_reward_app/core/app/enums.dart';
import 'package:crossover_reward_app/core/app/models/app_state.dart';
import 'package:crossover_reward_app/core/domain/entities/transaction/transaction.dart';
import 'package:crossover_reward_app/infrastructure/features/transactions/get_transaction_detail_bloc.dart';
import 'package:crossover_reward_app/infrastructure/utils.dart';
import 'package:crossover_reward_app/presentation/shared/app_scaffold.dart';
import 'package:crossover_reward_app/presentation/shared/app_surface_container.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'widgets/transaction_detail_icon.dart';

class TransactionDetailView extends StatelessWidget {
  static get route => '/transactions/:transactionId';
  final String transactionId;
  const TransactionDetailView({super.key, required this.transactionId});

  Widget _line(BuildContext context, String label, String value){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(label, size: 17, height: 20),
        Gap(8.w),
        Expanded(
          child: AppText(
            value,
            size: 17,
            height: 20,
            textAlign: TextAlign.right,
            color: valueForTheme(
              context,
              darkValue: Colors.white.withOpacity(.55),
              lightValue: const Color(0xFF3C3C43).withOpacity(.6),
            ),
          ),
        ),
      ],
    );
  }

  void _fetchTransaction(BuildContext context){
    final getTransaction = context.read<GetTransactionDetailBloc>();
    getTransaction(transactionId);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _fetchTransaction(context);
    });
    return AppScaffold(
      title: 'Rewards',
      body: BlocBuilder<GetTransactionDetailBloc, AppState<Transaction>>(
        builder: (context, state){
          switch(state.loadingState) {
            case AppLoadingState.empty:
            case AppLoadingState.nothing:
              return const SizedBox.shrink();
            case AppLoadingState.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case AppLoadingState.failed:
              return Center(
                child: InkWell(
                  onTap: ()=> _fetchTransaction(context),
                  child: const AppText(
                    'Failed to load. Tap to retry',
                    color: Colors.red,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            case AppLoadingState.success:
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppSurfaceContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 32.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TransactionDetailIcon(bird: state.data!.bird),
                          Gap(8.h),
                          AppText(
                            state.data!.title,
                            size: 17,
                            height: 20,
                            textAlign: TextAlign.center,
                          ),
                          AppText(
                            formatAmountWithCurrency(state.data!.amount),
                            size: 34,
                            weight: FontWeight.w700,
                            height: 41,
                            textAlign: TextAlign.center,
                          ),
                          Gap(8.h),
                          if(state.data!.bird)
                            AppText(
                              'Congratulations on earning your bird!',
                              size: 13,
                              height: 15.51,
                              color: valueForTheme(
                                context,
                                darkValue: Colors.white.withOpacity(.55),
                                lightValue: const Color(0xFF828282).withOpacity(.85),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Gap(16.h),
                    AppText(
                      'Transaction Details',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Gap(4.h),
                    AppSurfaceContainer(
                      child: Column(
                        children: [
                          _line(context, 'Status', state.data!.status ?? '-'),
                          Divider(height: 24.h),
                          _line(
                            context,
                            'Date',
                            formatDate(
                              state.data!.dateObject,
                              [MM, ' ', dd, ', ', yyyy],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
