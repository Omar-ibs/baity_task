import 'package:baity_task/src/core/utils/styles.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/category_list_view.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/cities_choose.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/selecting_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    super.key,
  });

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool isReset = false;
  String offerType = 'Sale';
  String? selectedCategory;
  String? selectedSubCategory;
  String paymentMethod = 'All.';
  String city = 'Baghdad';
  String publisherType = 'All';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Styles.mediumStyle20(context).copyWith(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xff042f46),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Offer For Section
              const SizedBox(
                height: 10,
              ),
              Text("Offer for",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton("Sale", offerType == "Sale", screenWidth),
                  _buildToggleButton("Rent", offerType == "Rent", screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Category and Subcategory Section
              Text("Category and subcategory",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              CategoryListView(isReset: isReset),
              SizedBox(height: screenHeight * 0.02),

              // Payment Methods Section
              Text("Purchase instructions and payment methods",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              Wrap(
                spacing: 8.0,
                children: [
                  _buildToggleButton(
                      "All.", paymentMethod == "All.", screenWidth),
                  _buildToggleButton(
                      "Cash", paymentMethod == "Cash", screenWidth),
                  _buildToggleButton("Installments",
                      paymentMethod == "Installments", screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // City Selection
              Text("City and district and subDistrict",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              GestureDetector(
                onTap: () async {
                  final selectedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Animate(effects: const [
                          SlideEffect(begin: Offset(1, 0), end: Offset(0, 0)),
                        ], child: const CitiesChoose());
                      },
                    ),
                  );
                  setState(() {
                    city = selectedCity;
                  });
                },
                child: Chip(
                  label: Text(city),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Publisher Type Section
              Text("Publisher type",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children: [
                  _buildToggleButton(
                      "All", publisherType == "All", screenWidth),
                  _buildToggleButton("Real estate Co.",
                      publisherType == "Real estate Co.", screenWidth),
                  _buildToggleButton("Building Complex",
                      publisherType == "Building Complex", screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Area Section Placeholder
              Text("Area",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              const SelectingField(
                isSelected: false,
                text: 'Select Real Estate Area',
              ),
              SizedBox(height: screenHeight * 0.02),
              Text("Price",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045)),
              const SelectingField(
                isSelected: false,
                text: 'Select Price Range',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Reset filters
                      offerType = 'Sale';
                      selectedCategory = null;
                      isReset = true;
                      paymentMethod = 'All.';
                      city = 'Baghdad';
                      publisherType = 'All';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: Colors.grey[400]!,
                          ))),
                  child: Text(
                    "Reset",
                    style: Styles.mediumStyle20(context)
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff042f46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  child: Text(
                    "Results",
                    style: Styles.mediumStyle20(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, double screenWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (label == "Sale" || label == "Rent") {
            offerType = label;
          } else if (label == "All." ||
              label == "Cash" ||
              label == "Installments") {
            paymentMethod = label;
          } else {
            publisherType = label;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.05),
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label,
            style:
                TextStyle(color: Colors.black, fontSize: screenWidth * 0.04)),
      ),
    );
  }

  // Responsive Category Button
  Widget _buildCategoryButton(
      String label, String category, double screenWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.05),
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: selectedCategory == category
              ? Colors.grey[300]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(Icons.home,
                size: screenWidth * 0.06), // Replace with appropriate icon
            Text(label,
                style: TextStyle(
                    color: Colors.black, fontSize: screenWidth * 0.04)),
          ],
        ),
      ),
    );
  }
}
