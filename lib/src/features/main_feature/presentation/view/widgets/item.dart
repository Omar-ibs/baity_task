import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/details_in_icons.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/details_page.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/item_info_line.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/location_names.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/price_and_date.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.realEstate,
  });

  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth > 800 ? 200.0 : 150.0;
    final spacing = screenWidth > 800 ? 12.0 : 8.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Animate(
                        effects: const [
                          SlideEffect(
                              duration: Duration(milliseconds: 300),
                              begin: Offset(1, 0),
                              end: Offset(0, 0)),
                        ],
                        child: DetailsPage(
                          realEstate: realEstate,
                        ))));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[800]!, width: 1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: realEstate.image!,
                  height: imageHeight,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: spacing,
            ),
            PriceAndDate(realEstate: realEstate),
            SizedBox(
              height: spacing,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                realEstate.title!,
                overflow: TextOverflow.ellipsis,
                style: Styles.semiBoldStyle16(context)
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: spacing),
            ItemInfoLine(realEstate: realEstate),
            SizedBox(height: spacing),
            DetailsInIcons(
              realEstate: realEstate,
              height: 25,
              width: 25,
            ),
            SizedBox(height: spacing),
            LocationNames(realEstate: realEstate),
          ],
        ),
      ),
    );
  }
}
