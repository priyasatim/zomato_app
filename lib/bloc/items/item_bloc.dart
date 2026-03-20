import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/item_repository.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;
  ItemBloc({required this.repository}) : super(ItemInitial()) {
    on<LoadItems>((event, emit) async {
      emit(ItemLoading());
      try {
        final items = await repository.fetchItems();
        emit(ItemLoaded(items));
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });
  }
}