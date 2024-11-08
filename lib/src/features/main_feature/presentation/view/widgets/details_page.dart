import 'package:baity_task/src/core/utils/app_images.dart';
import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/details_in_icons.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/first_part_of_details_page.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/second_part_of_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.realEstate});
  final RealEstate realEstate;
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: realEstate.image!,
              height: 200,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 10,
            ),
            FirstPartOfDetails(
              realEstate: realEstate,
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            SecondPartOfDetailsPage(realEstate: realEstate)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {
            // Implement call functionality
          },
          icon: const Icon(
            Icons.call,
            color: Colors.white,
          ),
          label: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Call',
              style:
                  Styles.mediumStyle20(context).copyWith(color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
      ),
    );
  }
}
