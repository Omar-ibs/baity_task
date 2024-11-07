import 'package:baity_task/src/core/utils/app_images.dart';
import 'package:baity_task/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff042f46),
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Real Estate Details',
              style: Styles.mediumStyle20(context).copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.ios_share_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.heart_broken,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
