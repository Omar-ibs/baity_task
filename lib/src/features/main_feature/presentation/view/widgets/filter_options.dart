import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function(RealEstate) onApplyFilter;

  const FilterWidget({required this.onApplyFilter, super.key});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final RealEstate filterOptions = RealEstate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          TextButton(
            onPressed: () {
              widget.onApplyFilter(filterOptions);
              Navigator.pop(context);
            },
            child: const Text('Apply', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: filterOptions.category == null || filterOptions.city == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Category Dropdown
                  DropdownButtonFormField<String>(
                    hint: const Text("Select Category"),
                    value: filterOptions.category!.id!,
                    items: [
                      DropdownMenuItem(
                        value: filterOptions.category!.id,
                        child: Text(filterOptions.category!.name!),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => filterOptions.category!.id = value);
                    },
                  ),

                  const SizedBox(height: 10),

                  // City Dropdown
                  DropdownButtonFormField<String>(
                    hint: const Text("Select City"),
                    value: filterOptions.city!.id,
                    items: [
                      DropdownMenuItem(
                        value: filterOptions.city!.id,
                        child: Text(filterOptions.city!.name!),
                      )
                    ],
                    onChanged: (value) {
                      setState(() => filterOptions.city!.id = value);
                    },
                  ),

                  const SizedBox(height: 10),

                  // Offer Type Dropdown
                  DropdownButtonFormField<String>(
                    hint: const Text("Select Offer Type"),
                    value: filterOptions.offerType,
                    items: ['SELL', 'RENT'].map((offerType) {
                      return DropdownMenuItem(
                        value: offerType,
                        child: Text(offerType),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => filterOptions.offerType = value);
                    },
                  ),

                  const SizedBox(height: 10),

                  // Building Age Slider
                  Slider(
                    label: 'Building Age: ${filterOptions.age ?? 0} years',
                    value: (filterOptions.age ?? 0).toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (value) {
                      setState(() => filterOptions.age = value.toInt());
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
