import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';

class SecondPartOfDetailsPage extends StatelessWidget {
  const SecondPartOfDetailsPage({super.key, required this.realEstate});
  final RealEstate realEstate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailsRow(context, 'Offer type', realEstate.offerType!),
          buildDetailsRow(context, 'Pay Type', 'Cash'),
          buildDetailsRow(
              context, 'Price', realEstate.price!.toInt().toString(),
              isPrice: true),
          buildDetailsRow(context, 'Category and subcategory',
              '${realEstate.category!.name} - ${realEstate.subCategory!.name}'),
          buildDetailsRow(context, 'Ownership', 'Fully Owned'),
          buildDetailsRow(context, 'Ad number', '6AJF18'),
          const Divider(),
          buildDetailsRow(context, 'Area', '${realEstate.area.toString()} m²'),
          buildDetailsRow(context, 'Building Area', '210 m²'),
          buildDetailsRow(context, 'Frontage width', '8 m'),
          buildDetailsRow(context, 'Frontage depth', '30 m'),
          buildDetailsRow(context, 'Facing direction', 'North'),
          buildDetailsRow(
              context, 'Building age', '${realEstate.age.toString()} years'),
          const Divider(),
          buildDetailsRow(context, 'Address',
              '${realEstate.city!.name} - ${realEstate.district!.name} - ${realEstate.subDistrict!.name}'),
          const SizedBox(height: 16),
          Container(
            height: 200,
            color: Colors.grey[300], // Placeholder for the map image
            child: const Center(child: Text('Map View Placeholder')),
          ),
          const SizedBox(height: 16),

          const Divider(),
          // New sections based on the second screenshot
          const SizedBox(height: 16),
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Modern house for sale in Palestine Street, first class building',
            style: TextStyle(fontSize: 16),
          ),
          const Divider(),
          const SizedBox(height: 8),
          buildDetailsRow(context, 'Cladding', 'Marble'),
          buildDetailsRow(context, 'Flooring', 'Porcelain'),
          buildDetailsRow(context, 'Windows', 'Aluminum'),
          const Divider(),
          const SizedBox(height: 8),
          const Text(
            'Features',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              buildFeatureChip('Furnished', Icons.chair),
              buildFeatureChip('Negotiable', Icons.handshake),
              buildFeatureChip('Door call system', Icons.doorbell),
              buildFeatureChip('Camera system', Icons.videocam),
              buildFeatureChip('Balcony', Icons.balcony),
            ],
          ),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Offered by',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.home, color: Colors.grey[700]),
            ),
            title: const Text('Karar Almayahi'),
            subtitle: const Text('Owner'),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                'View Publisher RealEstate (1)',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('+9647716784225'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildDetailsRow(BuildContext context, String label, String value,
      {bool isPrice = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
                color: isPrice ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 20),
      label: Text(label),
    );
  }
}
