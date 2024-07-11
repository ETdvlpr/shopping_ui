import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_ui/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteColorEE,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LOGO Inc.",
            style: TextStyle(color: Colors.grey[700], fontSize: 20.0),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("회사 소개"),
              Container(
                color: Colors.grey[700],
                width: 1.0,
                height: 10.0,
              ),
              const Text("인재 채용"),
              Container(
                color: Colors.grey[700],
                width: 1.0,
                height: 10.0,
              ),
              const Text("기술 블로그"),
              Container(
                color: Colors.grey[700],
                width: 1.0,
                height: 10.0,
              ),
              const Text("리뷰 저작권"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/send.svg",
                width: 12,
                height: 12,
              ),
              const SizedBox(width: 10),
              Text(
                "review@logo.com",
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: const Color(0xff868686),
                  ),
                ),
                child: DropdownButton<String>(
                  value: 'KOR',
                  isDense: true,
                  onChanged: (String? newValue) {},
                  items: <String>['KOR', 'ENG', 'JPN']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[400],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "@2022-2022 LOGO Lab, Inc. (주)아무개 서울시 강남구",
              style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
