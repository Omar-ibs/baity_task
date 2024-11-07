import 'package:baity_task/src/features/main_feature/presentation/view/widgets/item.dart';
import 'package:baity_task/src/features/main_feature/presentation/view_model/cubit/item_list_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListCubitCubit, ItemListCubitState>(
      builder: (context, state) {
        if (state is ItemListCubitSuccess) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.12,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  crossAxisCount:
                      MediaQuery.sizeOf(context).width > 800 ? 2 : 1),
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Item(
                    realEstate: state.itemsList[index],
                  ),
                );
              });
        } else if (state is ItemListCubitFailure) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.blue[800],
                  size: 60,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(state.message),
              ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
