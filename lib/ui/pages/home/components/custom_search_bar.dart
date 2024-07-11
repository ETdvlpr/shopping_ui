import 'package:flutter/material.dart';
import 'package:shopping_ui/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [Color(0xFF3C41BF), Color(0xFF74FBDE)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: '검색어를 입력하세요',
          suffixIcon: const Icon(Icons.search, color: AppTheme.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 10),
        ),
        onChanged: (query) {},
      ),
    );
  }
}
