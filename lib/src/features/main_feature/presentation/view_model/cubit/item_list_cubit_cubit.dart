import 'package:baity_task/src/features/main_feature/data/models/real_estate.dart';
import 'package:baity_task/src/features/main_feature/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'item_list_cubit_state.dart';

class ItemListCubitCubit extends Cubit<ItemListCubitState> {
  ItemListCubitCubit(this.homeRepo) : super(ItemListCubitLoading());
  final HomeRepo homeRepo;
  Future<void> fetchItems() async {
    emit(ItemListCubitLoading());
    final response = await homeRepo.fetchItems();
    print(response);
    response.fold(
        (fail) => emit(ItemListCubitFailure(message: fail.errMessage)),
        (items) => emit(ItemListCubitSuccess(itemsList: items)));
  }
}
