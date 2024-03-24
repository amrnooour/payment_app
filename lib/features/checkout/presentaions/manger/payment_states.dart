abstract class PaymentStates{}
class InitialPaymentState extends PaymentStates{}
class LoadingPaymentState extends PaymentStates{}
class FailurePaymentState extends PaymentStates{
  final String errorMessage;
  FailurePaymentState({required this.errorMessage});
}
class SuccessPaymentState extends PaymentStates{}