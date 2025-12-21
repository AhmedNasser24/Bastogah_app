enum RolesEnum {
  merchant("merchant"),
  customer("customer");

  final String value;
  const RolesEnum(this.value);
  RolesEnum getValue(String value) {
    switch (value) {
      case "merchant":
        return RolesEnum.merchant;
      case "customer":
        return RolesEnum.customer;
      default:
        return RolesEnum.customer;
    }
  }
}
