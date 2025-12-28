enum DriverFilterEnum {
  pending(0, "merchant.filter.pending"),
  inDelivery(1, "merchant.filter.waiting_for_delivery"),
  completed(2, "merchant.filter.completed"),
  cancelled(3, "merchant.filter.cancelled");

  final int status;
  final String title;
  const DriverFilterEnum(this.status, this.title);
}

List<DriverFilterEnum> get driverOrderFilters => DriverFilterEnum.values;
