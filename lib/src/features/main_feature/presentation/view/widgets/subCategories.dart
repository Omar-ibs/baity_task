import 'package:baity_task/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Subcategories extends StatefulWidget {
  const Subcategories({super.key, required this.category, this.onReset});
  final String category;
  final VoidCallback? onReset;
  @override
  State<Subcategories> createState() => _SubcategoriesState();
}

class _SubcategoriesState extends State<Subcategories> {
  @override
  int? selectedIndex;
  void reset() {
    setState(() {
      selectedIndex = null;
    });
    widget.onReset?.call();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> Categories = {
      'Resdential': ['Land', 'Flat', 'Villa', 'Building'],
      'Building Complex': ['Flat', 'Villa'],
      'Commercial': [
        'Flat',
        'Building',
        'Land',
        'Warehouse',
        'shop Store',
        'Villa'
      ],
      'Industrial': ['Land', 'Factory', 'Workshop'],
      'Agricultural': ['Land', 'Farm', 'Grove'],
    };

    final subCategories = Categories[widget.category];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: subCategories?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? const Color(0xff042f46)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: selectedIndex == index
                          ? const Color(0xff042f46)
                          : Colors.grey[300]!,
                      width: 1),
                ),
                child: Text(
                  subCategories![index],
                  style: Styles.regularStyle12(context).copyWith(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
