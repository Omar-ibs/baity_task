part of 'item_list_cubit_cubit.dart';

@immutable
sealed class ItemListCubitState {}

final class ItemListCubitLoading extends ItemListCubitState {}

final class ItemListCubitSuccess extends ItemListCubitState {
  final List<RealEstate> itemsList;

  ItemListCubitSuccess({required this.itemsList});
}

final class ItemListCubitFailure extends ItemListCubitState {
  final String message;

  ItemListCubitFailure({required this.message});
}
