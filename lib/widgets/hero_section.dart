import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "کارها رو مدیریت کن",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "با App راکت کارهای شخصی خودت رو منظم کن و با مدیریت کامل به اون ها رسیدگی کن",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    ); //Hero Section
  }
}
