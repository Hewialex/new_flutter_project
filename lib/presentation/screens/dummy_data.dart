class DummyData {
  List<User> users = [
    User(id: 1, balance: 500),
  ];

  // Modify subscribe to return a Future to handle async operation
  Future<bool> subscribe(int userId) async {
    // Simulate some delay for the subscription process
    await Future.delayed(Duration(seconds: 1));

    // Find the user by ID
    User? user = users.firstWhere((user) => user.id == userId, orElse: () => User(id: -1, balance: 0));

    if (user.id != -1) {
      // Check if the user has enough balance
      if (user.balance >= 200) {
        user.balance -= 200; // Deduct 200 from the user's balance
        return true; // Subscription successful
      } else {
        throw Exception("Insufficient balance");
      }
    } else {
      throw Exception("User not found");
    }
  }

  Future<void> loadData() async {
    // Simulating data loading
    await Future.delayed(Duration(seconds: 2));
  }
}

class User {
  final int id;
  int balance;

  User({required this.id, required this.balance});
}
