import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/utils/constants.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSection({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.greyTextColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/icons/arrow_forward.svg",
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
