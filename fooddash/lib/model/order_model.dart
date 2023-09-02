class OrderDetails {
  String orderId; // Unique identifier for the order.
  String customerName;
  String shippingAddress;
  String itemName; // Corrected property name.
  DateTime orderDate;

  OrderDetails({
    required this.orderId,
    required this.customerName,
    required this.shippingAddress,
    required this.orderDate,
    required this.itemName, // Corrected property name.
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'customerName': customerName,
      'shippingAddress': shippingAddress,
      'itemName': itemName, // Use the correct property name.
      'orderDate': orderDate.toUtc().toIso8601String(), // Convert DateTime to ISO8601 string.
    };
  }
}
