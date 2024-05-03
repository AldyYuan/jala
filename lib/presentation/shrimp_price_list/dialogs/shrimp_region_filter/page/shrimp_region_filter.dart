import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/core/injection/injection.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/presentation/shrimp_price_list/dialogs/shrimp_region_filter/bloc/shrimp_region_filter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShrimpRegionFilter extends StatelessWidget {
  final RegionEntity? oldSelected;
  const ShrimpRegionFilter({super.key, this.oldSelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShrimpRegionFilterBloc(getIt()),
      child: BlocBuilder<ShrimpRegionFilterBloc, ShrimpRegionFilterState>(
        builder: (context, state) {
          final read = context.read<ShrimpRegionFilterBloc>();

          return Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kota/kabupaten",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Tutup"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Search
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Cari',
                            ),
                            controller: read.txtSearch,
                            onChanged: (value) {
                              read.add(ShrimpRegionFilterSearch());
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            read.txtSearch.clear();
                            read.refreshController.requestRefresh();
                          },
                          icon: const Icon(Icons.cancel_rounded),
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Divider(),

              // List Filter
              Expanded(
                child: SmartRefresher(
                  controller: read.refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () {
                    read.add(ShrimpRegionFilterGet());
                  },
                  onLoading: () {
                    read.add(ShrimpRegionFilterGet());
                  },
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Failure
                        if (state.status == ShrimpRegionFilterStatus.failure) const Text('Something went wrong!'),

                        // Empty
                        if (state.status == ShrimpRegionFilterStatus.success && state.data.isEmpty) const Text('Data is Empty!'),

                        // List
                        if (state.data.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              var data = state.data[index];

                              return ListTile(
                                dense: true,
                                onTap: () => Navigator.of(context).pop(data == oldSelected ? true : data),
                                title: Text(
                                  data.fullName,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: data == oldSelected ? AppTheme.primaryColor : null,
                                      ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
