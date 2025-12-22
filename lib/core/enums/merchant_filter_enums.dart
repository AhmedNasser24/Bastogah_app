enum MerchantFilterEnum {
  pending(0),
  waitingDriver(1),
  inprogress(2),
  completed(3),
  cancelled(4);

  final int status;
  const MerchantFilterEnum(this.status);
}
