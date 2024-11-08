import 'package:baity_task/src/core/utils/service_locator.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/main_feature.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/details_page.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/filter_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().setup();
  runApp(DevicePreview(enabled: true, builder: (context) => const BaityTask()));
}

class BaityTask extends StatelessWidget {
  const BaityTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff5f5fa),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Tajawal'),
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const FilterPage(),
    );
  }
}
