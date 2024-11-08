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
                  childAspectRatio: MediaQuery.sizeOf(context).width > 800
                      ? 1.1 / 1.2
                      : 1 / 1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  crossAxisCount:
                      MediaQuery.sizeOf(context).width > 800 ? 2 : 1),
              physics: const BouncingScrollPhysics(),
              itemCount: state.itemsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Item(
                    realEstate: state.itemsList[index],
                  ),
                );
              });
        } else if (state is ItemListCubitFailure) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.error_outline,
              color: Colors.blue[800],
              size: 80,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
