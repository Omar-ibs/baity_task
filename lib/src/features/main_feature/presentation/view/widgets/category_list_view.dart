import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/subCategories.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key, required this.isReset});
  final bool isReset;
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int? selectedIconIndex;
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.apartment,
      Icons.apartment_rounded,
      Icons.factory,
      Icons.agriculture,
    ];

    List<String> subCategories = [
      'Resdential',
      'Building Complex',
      'Commercial',
      'Industrial',
      'Agricultural',
    ];
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIconIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: selectedIconIndex == index
                            ? const Color(0xff042f46)
                            : null,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[500]!, width: 1),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              icons[index],
                              size: 40,
                              color: selectedIconIndex == index
                                  ? Colors.white
                                  : null,
                            ),
                            Text(
                              subCategories[index],
                              style: Styles.regularStyle16(context).copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: selectedIconIndex == index
                                      ? Colors.white
                                      : Colors.grey[400]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        selectedIconIndex != null
            ? SizedBox(
                height: 40,
                child: Subcategories(
                  category: subCategories[selectedIconIndex!],
                  onReset: widget.isReset == true
                      ? () {
                          setState(() {
                            selectedIconIndex = null;
                          });
                        }
                      : null,
                ))
            : const SizedBox(
                height: 10,
              ),
      ],
    );
  }
}
