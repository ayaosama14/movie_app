part of 'validation_cubit.dart';

@immutable
sealed class AuthStates {}

final class ValidationInitial extends AuthStates {}

final class ValidationSuccessState extends AuthStates {}
final class ValidationFailedState extends AuthStates {}
////////////////////////////////////
final class UserLoadingState extends AuthStates {}
final class UserSuccessState extends AuthStates {}
final class UserFailedState extends AuthStates {}
