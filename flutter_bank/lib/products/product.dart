class Product {

  Product({this.name, this.balance});

  final String? name;
  final double? balance;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      balance: json['balance'],
    );
  }
}