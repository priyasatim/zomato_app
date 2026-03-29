import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/category/categories_repository.dart';
import 'package:food_delivery_app/bloc/explore/explore_event.dart';
import 'package:food_delivery_app/bloc/explore/explore_state.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/explore_model.dart';
import 'package:food_delivery_app/bloc/explore/explore_repository.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreRepository repository;
  ExploreBloc({required this.repository}) : super(ExploreInitial()) {
    on<LoadExplore>((event, emit) async {
      emit(ExploreLoading());
      try {
        final explore = await repository.fetchExplore();
        emit(ExploreLoaded(explore.cast<Explore>()));
      } catch (e) {
        // emit(ExploreLoaded(e.toString() as List<Explore>));
      }
    });
  }
}