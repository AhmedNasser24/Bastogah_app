enum DriverFilterEnum {
  pending(0),
  inDelivery(2),
  completed(3),
  cancelled(4);

  final int status;
  const DriverFilterEnum(this.status);
}
