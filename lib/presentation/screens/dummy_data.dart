class DummyData {
  // Initialize the dummy balance (e.g., 1000 ETB)
  double balance = 1000;

  // Function to handle subscription and update balance
  void subscribe() {
    if (balance >= 200) {
      balance -= 200;  // Deduct 200 ETB for subscription
    } else {
      throw Exception("Insufficient balance!");
    }
  }
}
