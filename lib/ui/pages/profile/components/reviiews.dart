import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/utils/constants.dart';

class Reviews extends StatelessWidget {
  final int index;

  const Reviews({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: "작성한 리뷰",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                  children: [
                    TextSpan(
                      text: " 총 35개",
                      style: TextStyle(
                        color: AppTheme.greyTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              dropDown(),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
            color: AppTheme.whiteColorF0,
          ),
          const SizedBox(height: 20),
          reviewDetails(),
          const SizedBox(height: 8),
          const Divider(height: 2, color: AppTheme.whiteColorF0),
          const SizedBox(height: 16),
          Row(
            children: [
              reviewerInfo(),
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/bookmark.svg",
                width: 24,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: AppTheme.greColor86,
        ),
      ),
      child: DropdownButton<String>(
        value: '최신순',
        style: const TextStyle(
          color: AppTheme.greyTextColor,
          fontSize: 16.0,
        ),
        isDense: true,
        onChanged: (String? newValue) {},
        items: <String>['최신순'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget reviewDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(206, 206, 206, 2),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Image.asset(
            "assets/images/product_review_1.png",
            width: 100,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AMD 라이젠 5 5600X 버미어 정품 멀티팩",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  RatingBar(
                    ignoreGestures: true,
                    itemSize: 18,
                    minRating: 2,
                    maxRating: 5,
                    initialRating: 3,
                    glowColor: Colors.transparent,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    ratingWidget: RatingWidget(
                      full: SvgPicture.asset(
                        "assets/icons/star.svg",
                      ),
                      empty: SvgPicture.asset(
                        "assets/icons/star_empty.svg",
                      ),
                      half: SvgPicture.asset(
                        "assets/icons/star_empty.svg",
                      ),
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "4.07",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget reviewerInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/user_${index + 1}.png',
          ),
          radius: 24,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name${(index + 1).toString().padLeft(2, '0')}",
            ),
            Row(
              children: <Widget>[
                RatingBar(
                  ignoreGestures: true,
                  itemSize: 16,
                  minRating: 2,
                  maxRating: 5,
                  initialRating: 3,
                  glowColor: Colors.transparent,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(
                      "assets/icons/star.svg",
                    ),
                    empty: SvgPicture.asset(
                      "assets/icons/star_empty.svg",
                    ),
                    half: SvgPicture.asset(
                      "assets/icons/star_empty.svg",
                    ),
                  ),
                  onRatingUpdate: (double value) {},
                ),
                const SizedBox(width: 10),
                const Text(
                  "2022.12.09",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
