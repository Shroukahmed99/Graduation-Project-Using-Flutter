import 'package:flutter_bloc/flutter_bloc.dart';

// States
abstract class PasswordVisibilityState {}

class PasswordVisibilityInitial extends PasswordVisibilityState {}

class PasswordVisible extends PasswordVisibilityState {}

class PasswordHidden extends PasswordVisibilityState {}
