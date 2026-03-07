class CreateOrderParamEntity {
  final String customerFullName;
  final String customerAddress;
  final String customerCity;
  final int customerDepartment;
  final String customerPhoneNumber;

  CreateOrderParamEntity({
    required this.customerFullName,
    required this.customerAddress,
    required this.customerCity,
    required this.customerDepartment,
    required this.customerPhoneNumber,
  });
}
