import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';

class PriceAndDate extends StatelessWidget {
  const PriceAndDate({super.key, required this.realEstate});
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${realEstate.price.toString()} IQD',
          style: Styles.mediumStyle16(context).copyWith(
            color: Colors.blue[800],
          ),
        ),
        const Spacer(),
        Text(
          realEstate.createdAt!.split(' ')[0],
          style: Styles.regularStyle14(context),
        ),
      ],
    );
  }
}
