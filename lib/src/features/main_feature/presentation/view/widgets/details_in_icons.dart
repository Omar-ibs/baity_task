import 'package:baity_task/src/core/utils/app_images.dart';
import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsInIcons extends StatelessWidget {
  const DetailsInIcons({
    super.key,
    required this.realEstate,
  });
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      Assets.imagesBathroom,
      Assets.imagesCar,
      Assets.imagesBed,
      Assets.imagesChair,
      Assets.imagesMaximize,
    ];
    List<String> details = [
      realEstate.area.toString(),
      realEstate.noOfLivingRooms.toString(),
      realEstate.noOfBedRooms.toString(),
      realEstate.parkingCapacity.toString(),
      realEstate.noOfBathRooms.toString(),
    ];
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: index != 0
                          ? Text(
                              details[index],
                              style: Styles.regularStyle16(context)
                                  .copyWith(color: Colors.black),
                            )
                          : Text(
                              '${details[index]} m2',
                              style: Styles.regularStyle16(context)
                                  .copyWith(color: Colors.black),
                            ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      icons[index],
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
