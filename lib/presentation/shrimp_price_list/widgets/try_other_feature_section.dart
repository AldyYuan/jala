import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TryOtherFeatureSection extends StatelessWidget {
  const TryOtherFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Coba Fitur Lainnya",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),

          // Banner
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Clicked")));
                  },
                  child: SvgPicture.asset('assets/ask Jali.svg'),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Clicked")));
                  },
                  child: SvgPicture.asset('assets/Quiz by JALA.svg'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
