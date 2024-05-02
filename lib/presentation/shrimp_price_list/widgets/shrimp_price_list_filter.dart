import 'package:flutter/material.dart';
import 'package:jala/core/themes/app_theme.dart';
import 'package:jala/domain/entities/region_entity.dart';

class ShrimpPriceListFilter extends StatelessWidget {
  final int shrimpSizeFilter;
  final RegionEntity? regionFilter;
  final void Function() onTapSizeFilter;
  final void Function() onTapRegionFilter;
  const ShrimpPriceListFilter({
    super.key,
    required this.shrimpSizeFilter,
    this.regionFilter,
    required this.onTapSizeFilter,
    required this.onTapRegionFilter,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: onTapSizeFilter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                color: AppTheme.primaryDarker,
                child: Row(
                  children: [
                    const Icon(
                      Icons.monitor_weight_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          "${shrimpSizeFilter}",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: InkWell(
              onTap: onTapRegionFilter,
              child: Container(
                color: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      regionFilter?.name ?? "Indonesia",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
