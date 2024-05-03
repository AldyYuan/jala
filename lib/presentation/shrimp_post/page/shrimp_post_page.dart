import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/presentation/shrimp_post/bloc/shrimp_post_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';

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

                      return Card.outlined(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: CachedNetworkImage(
                                imageUrl: 'https://app.jala.tech/storage/${data.image}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Transform.scale(
                                  scale: 0.2,
                                  child: const CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            const Divider(height: 0),

                            // Content
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Title
                                  Text(
                                    data.title,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),

                                  // Excerpt
                                  const SizedBox(height: 4),
                                  Text(
                                    data.excerpt,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),

                                  // Created At & Share
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat("dd MMMM yyyy", 'id_ID').format(DateTime.parse(data.createdAt)),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),

                                      // Share
                                      InkWell(
                                        onTap: () {
                                          Share.shareUri(Uri.parse("https://app.jala.tech/posts/${data.id}"));
                                        },
                                        child: Icon(
                                          Icons.share_rounded,
                                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
