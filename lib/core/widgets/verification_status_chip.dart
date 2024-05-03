import 'package:flutter/material.dart';
import 'package:jala/core/themes/app_theme.dart';

class VerificationStatusChip extends StatelessWidget {
  final bool isVerified;
  const VerificationStatusChip({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        isVerified ? "Terverifikasi" : "Belum Terverifikasi",
        style: Theme.of(context).textTheme.labelSmall,
      ),
      avatar: isVerified ? const Icon(Icons.star_rounded, color: Colors.amber) : null,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      labelPadding: EdgeInsets.zero,
      backgroundColor: isVerified ? AppTheme.yellowBgColor : AppTheme.disableBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: const BorderSide(color: Colors.transparent),
      ),
    );
  }
}
