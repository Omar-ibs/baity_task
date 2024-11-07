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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Animate(effects: const [
                      SlideEffect(
                          duration: Duration(milliseconds: 300),
                          begin: Offset(1, 0),
                          end: Offset(0, 0)),
                    ], child: const DetailsPage())));
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
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: realEstate.image!,
                  height: 180,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 10,
            ),
            PriceAndDate(realEstate: realEstate),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                realEstate.title!,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ItemInfoLine(realEstate: realEstate),
            const SizedBox(
              height: 10,
            ),
            DetailsInIcons(
              realEstate: realEstate,
            ),
            const SizedBox(
              height: 10,
            ),
            LocationNames(realEstate: realEstate),
          ],
        ),
      ),
    );
  }
}
