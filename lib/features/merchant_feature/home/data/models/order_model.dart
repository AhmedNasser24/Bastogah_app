class OrderModel {
  final String? orderId, customerPhone, customerAddress;
  final String? netSalary, deliveryFee;
  final String? driverName, reasonForCancellation;
  const OrderModel({
    this.orderId,
    this.customerPhone,
    this.customerAddress,
    this.netSalary,
    this.deliveryFee,
    this.driverName,
    this.reasonForCancellation,
  });
}
