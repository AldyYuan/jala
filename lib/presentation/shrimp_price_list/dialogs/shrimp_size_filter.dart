import 'package:flutter/material.dart';
import 'package:jala/core/themes/app_theme.dart';

class ShrimpSizeFilter extends StatelessWidget {
  final int oldSelected;
  const ShrimpSizeFilter({super.key, required this.oldSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Tutup"),
              ),
            ],
          ),
        ),
        const Divider(),

        // List Filter
        Expanded(
          child: ListView(
            children: [
              for (int filter = 20; filter <= 200; filter += 10) ...[
                ListTile(
                  dense: true,
                  onTap: () => Navigator.of(context).pop(filter),
                  title: Text(
                    "$filter",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: filter == oldSelected ? AppTheme.primaryColor : null,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
