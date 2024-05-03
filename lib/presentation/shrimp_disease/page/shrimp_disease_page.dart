import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/core/widgets/post_card.dart';
import 'package:jala/presentation/shrimp_disease/bloc/shrimp_disease_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShrimpDiseasePage extends StatelessWidget {
  const ShrimpDiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShrimpDiseaseBloc>();

    return SmartRefresher(
      controller: read.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () {
        read.add(ShrimpDiseaseGet());
      },
      onLoading: () {
        read.add(ShrimpDiseaseGet());
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: BlocBuilder<ShrimpDiseaseBloc, ShrimpDiseaseState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Penyakit",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.primaryDarker,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),

                // First Loading
                if (state.status == ShrimpDiseaseStatus.loading && state.data.isEmpty && !read.refreshController.isRefresh) const LinearProgressIndicator(),

                // Failure
                if (state.status == ShrimpDiseaseStatus.failure) const Text('Something went wrong!'),

                // Empty
                if (state.status == ShrimpDiseaseStatus.success && state.data.isEmpty) const Text('Data is Empty!'),

                // List
                if (state.data.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      var data = state.data[index];

                      return PostCard(
                        titlePage: "Info Penyakit",
                        webViewUrl: "https://app.jala.tech/web_view/diseases/${data.id}",
                        shareUrl: "https://app.jala.tech/diseases/${data.id}",
                        imageUrl: 'https://app.jala.tech/storage/${data.image}',
                        title: data.fullName,
                        subtitle: data.metaDescription,
                        createdAt: data.createdAt,
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
