enum DriverFilterEnum {
  pending(0),
  inDelivery(1),
  completed(2),
  cancelled(3);

  final int status;
  const DriverFilterEnum(this.status);
}
