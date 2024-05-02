import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';

class ShrimpPriceListCard extends StatelessWidget {
  final ShrimpPriceEntity data;
  const ShrimpPriceListCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Supplier
            Row(
              children: [
                // Supplier Detail
                Expanded(
                  child: Row(
                    children: [
                      // Supplier
                      CircleAvatar(
                        backgroundImage: data.creator == null ? null : NetworkImage("https://app.jala.tech/storage/${data.creator!.avatar}"),
                        radius: 24,
                      ),
                      const SizedBox(width: 8),

                      // Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Supplier',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppTheme.primaryLight,
                                ),
                          ),
                          Text(
                            data.creator?.name ?? '-',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Verification Status
                Chip(
                  label: Text(
                    (data.creator?.buyer ?? false) ? "Terverifikasi" : "Belum Terverifikasi",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  avatar: (data.creator?.buyer ?? false) ? const Icon(Icons.star_rounded, color: Colors.amber) : null,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: EdgeInsets.zero,
                  backgroundColor: (data.creator?.buyer ?? false) ? AppTheme.yellowBgColor : AppTheme.disableBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Detail
            // Date
            Text(
              DateFormat("dd MMMM yyyy").format(DateTime.parse(data.date)),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.primaryLight,
                  ),
            ),
            const SizedBox(height: 4),

            // Region
            Text(
              data.region.provinceName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              data.region.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),

            // Price & Detail
            Row(
              children: [
                // price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // TODO: Change Size
                        'size 100',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppTheme.primaryLight,
                            ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: data.region.countryId.toLowerCase(),
                          symbol: '${data.currencyId} ',
                          decimalDigits: 0,
                        ).format(data.size100),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Verification Status
                FilledButton(
                  onPressed: () {},
                  child: const Text("Lihat Detail"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
