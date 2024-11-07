import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';

class LocationNames extends StatelessWidget {
  const LocationNames({super.key, required this.realEstate});
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            size: 20,
            color: Colors.blue[800],
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '${realEstate.city!.name!} - ${realEstate.district!.name} - ${realEstate.subDistrict!.name}',
              overflow: TextOverflow.ellipsis,
              style: Styles.regularStyle14(context).copyWith(
                color: Colors.blue[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
