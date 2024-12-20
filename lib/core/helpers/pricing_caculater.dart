class TPricingCalculator {
  static double getShippingCost(double distance) {
    if (distance <= 2.0) {
      return 0;
    } else if (distance > 2.0 && distance <= 5.0) {
      return 2;
    }
    return distance * 0.1;
  }

  static double getTaxRate(double distance) {
    if (distance <= 2.0) {
      return 0;
    } else if (distance > 2.0 && distance <= 5.0) {
      return 2;
    }
    return distance * 0.1;
  }

  static String calculateTax(double productPrice, double location) {
    double taxRate = getTaxRate(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static String calculateShippingCost(double productPrice, double location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static double calculateTotalPrice(double productPrice, double location) {
    double taxRate = getTaxRate(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = taxAmount + shippingCost + productPrice;
    return totalPrice;
  }
}
