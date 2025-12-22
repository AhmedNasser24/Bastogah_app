part of 'merchant_login_cubit.dart';

abstract class MerchantLoginState {}

class MerchantLoginInitial extends MerchantLoginState {}

class MerchantLoginLoading extends MerchantLoginState {}

class MerchantLoginSuccess extends MerchantLoginState {}

class MerchantLoginFailure extends MerchantLoginState {
  final String errMessage;
  MerchantLoginFailure({required this.errMessage});
}
