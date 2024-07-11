import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/utils/constants.dart';
import 'package:shopping_ui/utils/enum.dart';

class ProductCard extends StatelessWidget {
  final int number;
  final String name;
  final List<String> reviews;
  final double rating;
  final int reviewsCount;
  final List<String> features;
  final String image;
  final ProductStatus status;

  const ProductCard({
    super.key,
    required this.number,
    required this.name,
    required this.reviews,
    required this.rating,
    required this.reviewsCount,
    required this.features,
    required this.image,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.whiteColorCE),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/${status.icon}",
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    number.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Container(
                width: 104,
                height: 104,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 13),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              ...reviews.take(2).map((line) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "• ${line.trimRight()}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    child: SvgPicture.asset(
                      "assets/icons/star.svg",
                      width: 16,
                      height: 16,
                    ),
                  ),
                  TextSpan(
                    text: ' $rating ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.goldColor,
                    ),
                  ),
                  TextSpan(
                    text: '($reviewsCount)',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.whiteColorC4,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 12),
              features.isNotEmpty
                  ? Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: features
                          .map((feature) => Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppTheme.whiteColorF0,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  feature,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
