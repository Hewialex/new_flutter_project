class MoneyEntity {
  int id;
  int balance;

  MoneyEntity({required this.id, required this.balance});

  // Assuming you're using JSON serialization
  factory MoneyEntity.fromJson(Map<String, dynamic> json) {
    return MoneyEntity(
      id: json['id'],
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
    };
  }
}
