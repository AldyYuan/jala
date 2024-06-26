import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/core/widgets/post_card.dart';
import 'package:jala/presentation/shrimp_post/bloc/shrimp_post_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShrimpPostPage extends StatelessWidget {
  const ShrimpPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShrimpPostBloc>();

    return SmartRefresher(
      controller: read.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () {
        read.add(ShrimpPostGet());
      },
      onLoading: () {
        read.add(ShrimpPostGet());
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: BlocBuilder<ShrimpPostBloc, ShrimpPostState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kabar Terbaru",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.primaryDarker,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),

                // First Loading
                if (state.status == ShrimpPostStatus.loading && state.data.isEmpty && !read.refreshController.isRefresh) const LinearProgressIndicator(),

                // Failure
                if (state.status == ShrimpPostStatus.failure) const Text('Something went wrong!'),

                // Empty
                if (state.status == ShrimpPostStatus.success && state.data.isEmpty) const Text('Data is Empty!'),

                // List
                if (state.data.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      var data = state.data[index];

                      return PostCard(
                        titlePage: "Kabar Udang",
                        webViewUrl: "https://app.jala.tech/web_view/posts/${data.id}",
                        shareUrl: "https://app.jala.tech/posts/${data.id}",
                        imageUrl: 'https://app.jala.tech/storage/${data.image}',
                        title: data.title,
                        subtitle: data.excerpt,
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
