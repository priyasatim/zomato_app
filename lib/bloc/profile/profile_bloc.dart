import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/profile/profile_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SharedPreferences prefs;

  ProfileBloc(this.prefs) : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_updateProfile);
  }

  Future<void> _updateProfile(
      UpdateProfileEvent event,
      Emitter<ProfileState> emit,
      ) async {
    emit(ProfileLoading());

    try {
      // Name
      if (event.name.trim().isEmpty) {
        emit(ProfileError("Name is required"));
        return;
      }

      // Mobile
      final phone = event.mobile.replaceAll(RegExp(r'[^0-9]'), '');
      if (phone.length != 10) {
        emit(ProfileError("Enter valid 10-digit mobile number"));
        return;
      }

      // Email
      final emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(event.email)) {
        emit(ProfileError("Enter valid email"));
        return;
      }

      // DOB
      if (event.dob.isEmpty) {
        emit(ProfileError("DOB is required"));
        return;
      }

      // Gender
      if (event.gender.isEmpty) {
        emit(ProfileError("Gender is required"));
        return;
      }

      await prefs.setString("name", event.name);
      await prefs.setString("mobile", event.mobile);
      await prefs.setString("dob", event.dob);
      await prefs.setString("gender", event.gender);

      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError("Failed to update profile"));
    }
  }
}