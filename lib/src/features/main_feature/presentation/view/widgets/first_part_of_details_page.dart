import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/details_in_icons.dart';
import 'package:flutter/material.dart';

class FirstPartOfDetails extends StatelessWidget {
  const FirstPartOfDetails({
    super.key,
    required this.realEstate,
  });
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Row(
          children: [
            Text(realEstate.createdAt!),
            const Spacer(),
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              realEstate.imagesCount.toString(),
              style:
                  Styles.semiBoldStyle16(context).copyWith(color: Colors.grey),
            ),
            const SizedBox(
              width: 3,
            ),
            const Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              realEstate.views.toString(),
              style:
                  Styles.semiBoldStyle16(context).copyWith(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          realEstate.title!,
          style:
              Styles.mediumStyle20(context).copyWith(color: Colors.blue[800]),
        ),
        const SizedBox(
          height: 20.0,
        ),
        DetailsInIcons(
          realEstate: realEstate,
          height: 50,
          width: 50,
        ),
      ]),
    );
  }
}
