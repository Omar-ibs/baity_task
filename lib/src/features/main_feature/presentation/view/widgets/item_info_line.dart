import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';

class ItemInfoLine extends StatelessWidget {
  const ItemInfoLine({super.key, required this.realEstate});
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        realEstate.category != null && realEstate.subCategory != null
            ? Text(
                '${realEstate.category!.name!} - ${realEstate.subCategory!.name!}',
                style: Styles.regularStyle14(context),
              )
            : const Text(' '),
        const SizedBox(
          width: 5,
        ),
        Text(
          '|',
          style: TextStyle(color: Colors.grey[300], fontSize: 14),
        ),
        const SizedBox(
          width: 5,
        ),
        realEstate.age != null
            ? Text(
                'Building age: ${realEstate.age.toString()} years',
                style: Styles.regularStyle14(context),
              )
            : const Text(' '),
        realEstate.age != null
            ? Text(
                ' | ',
                style: TextStyle(color: Colors.grey[300], fontSize: 14),
              )
            : const SizedBox(
                width: 0,
              ),
        Expanded(
          child: Text(
            'Publisher: ${realEstate.ownerType!} .',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Styles.regularStyle14(context),
          ),
        ),
      ],
    );
  }
}
