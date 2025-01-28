import 'package:flutter/material.dart';
import 'dummy_data.dart';  // Import the dummy data file

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  // Create an instance of DummyData to manage balance
  DummyData dummyData = DummyData();

  // Function to handle subscription and update balance
  void _subscribe() {
    setState(() {
      try {
        dummyData.subscribe(); // Call the subscribe function from DummyData
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),  // Show an error message if balance is insufficient
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Package', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
            SizedBox(height: 83),
            SizedBox(
              width: 311,
              height: 276,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1 month package', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: '200 ETB ', // Main text
                        style: TextStyle(
                          fontSize: 20, // Main font size
                          color: Color(0xFFAA7D77), // Color as per your previous design
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '/month', // Subtext
                            style: TextStyle(
                              fontSize: 14, // Smaller font size
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF959595), // Grey color for the subtext
                              height: 0.5, // Adjust vertical alignment (raises it slightly)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      width: 233,
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 22),
                    Text('80% off for yearly subscription', style: TextStyle(color: Color(0xFF959595))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
            ElevatedButton(
              onPressed: _subscribe, // Call _subscribe when clicked
              style: ElevatedButton.styleFrom(
                minimumSize: Size(302, 53),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: Color(0xFFAA7D77),
                foregroundColor: Colors.white,
              ),
              child: Text('Subscribe Now', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            SizedBox(height: 20),
            // Display the current balance from the DummyData instance
            Text(
              'Your current balance: ${dummyData.balance} ETB',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.grey), label: ''),
          BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 124,
                height: 40,
                color: Color.fromARGB(255, 240, 226, 226),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.diamond, color: Color(0xFFAA7D77)),
                    Text('Premium', style: TextStyle(color: Color(0xFFAA7D77), fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message_sharp), label: ''),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
