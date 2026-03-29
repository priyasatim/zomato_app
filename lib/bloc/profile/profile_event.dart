import 'package:equatable/equatable.dart';

/// EVENTS
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String mobile;
  final String email;
  final String dob;
  final String anniversary;
  final String gender;

  UpdateProfileEvent({required this.name, required this.mobile, required this.email,  required this.dob, required this.anniversary, required this.gender});

  @override
  List<Object?> get props => [name, mobile,email,dob,anniversary,gender];
}

/// STATES
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}