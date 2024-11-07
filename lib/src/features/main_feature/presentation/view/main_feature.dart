import 'package:baity_task/src/core/utils/app_images.dart';
import 'package:baity_task/src/core/utils/service_locator.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo.dart';
import 'package:baity_task/src/features/main_feature/presentation/view/widgets/items_list.dart';
import 'package:baity_task/src/features/main_feature/presentation/view_model/cubit/item_list_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainFeature extends StatelessWidget {
  const MainFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff042f46),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              const Icon(
                Icons.menu,
                color: Color(0xfff5f5fa),
              ),
              Image.asset(
                Assets.imagesAppBar,
                width: 200,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocProvider(
            create: (context) =>
                ItemListCubitCubit(getIt.get<HomeRepo>())..fetchItems(),
            child: const ItemList(),
          ),
        ));
  }
}
