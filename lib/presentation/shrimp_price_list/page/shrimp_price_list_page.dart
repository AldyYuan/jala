import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/presentation/shrimp_price_list/bloc/shrimp_price_list_bloc.dart';
import 'package:jala/presentation/shrimp_price_list/widgets/shrimp_price_list_card.dart';
import 'package:jala/presentation/shrimp_price_list/widgets/shrimp_price_list_filter.dart';
import 'package:jala/presentation/shrimp_price_list/widgets/try_other_feature_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShrimpPriceListPage extends StatelessWidget {
  const ShrimpPriceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShrimpPriceListBloc>();

    return Stack(
      children: [
        // Body
        SmartRefresher(
          controller: read.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () {
            read.add(ShrimpPriceListGet());
          },
          onLoading: () {
            read.add(ShrimpPriceListGet());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Try Other Feature
                const TryOtherFeatureSection(),

                // Divider
                const Divider(),

                // List
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: BlocBuilder<ShrimpPriceListBloc, ShrimpPriceListState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Harga Terbaru",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppTheme.primaryDarker,
                                ),
                          ),
                          const SizedBox(height: 8),

                          // Refresh
                          if (read.refreshController.isRefresh && state.status == ShrimpPriceListStatus.loading) const SizedBox(),

                          // Failure
                          if (state.status == ShrimpPriceListStatus.failure) const Text('Something went wrong!'),

                          // Empty
                          if (state.status == ShrimpPriceListStatus.success && state.data.isEmpty) const Text('Data is Empty!'),

                          // List
                          if (state.data.isNotEmpty)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                var data = state.data[index];

                                return ShrimpPriceListCard(
                                  data: data,
                                  shrimpSizeFilter: state.shrimpSizeFilter,
                                );
                              },
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Filter
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: BlocBuilder<ShrimpPriceListBloc, ShrimpPriceListState>(
              builder: (context, state) {
                return ShrimpPriceListFilter(
                  shrimpSizeFilter: state.shrimpSizeFilter,
                  onTapSizeFilter: () {
                    read.add(ShrimpPriceListFilterSize(context: context));
                  },
                  regionFilter: state.regionFilter,
                  onTapRegionFilter: () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
