import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jala/presentation/webview/page/webview_page.dart';
import 'package:share_plus/share_plus.dart';

class PostCard extends StatelessWidget {
  final String titlePage;
  final String webViewUrl;
  final String shareUrl;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String createdAt;

  const PostCard({
    super.key,
    required this.titlePage,
    required this.webViewUrl,
    required this.shareUrl,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return WebViewPage(
              titlePage: titlePage,
              webViewUrl: webViewUrl,
              shareUrl: shareUrl,
            );
          }),
        );
      },
      child: Card.outlined(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 160,
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
                    title,
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
                    subtitle,
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
                        DateFormat("dd MMMM yyyy", 'id_ID').format(DateTime.parse(createdAt)),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),

                      // Share
                      InkWell(
                        onTap: () {
                          Share.shareUri(Uri.parse(shareUrl));
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
      ),
    );
  }
}
