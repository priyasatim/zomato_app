import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:food_delivery_app/model/explore_model.dart';
import 'package:food_delivery_app/model/food_model.dart';

import '../../model/category_model.dart';

abstract class RestaurantBlocState {}

class RestaurantBlocInitial extends RestaurantBlocState {}

class RestaurantBlocLoading extends RestaurantBlocState {}

class RestaurantBlocLoaded extends RestaurantBlocState {
  final List<FoodModel> food;
  RestaurantBlocLoaded(this.food);
}

class RestaurantBlocError extends RestaurantBlocState {
  final String message;
  RestaurantBlocError(this.message);
}