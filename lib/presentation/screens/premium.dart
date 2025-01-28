import 'package:flutter/material.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Package'),
            SizedBox(height: 83,),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text('1 month package'),
                  SizedBox(height: 10,),
                  Text('200 ETB/month'),
                  SizedBox(height: 13,),
                  Container(
                    width: 233,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 22,),
                  Text('80% off for yearly subscription')


                ],
              ),
            ),
            SizedBox(height: 90,),
            ElevatedButton(onPressed: (){}, child: Text('Subscribe Now'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Row(
            children: [
              Icon(Icons.diamond), 
              Text('premium' , style: TextStyle(fontSize: 10),),
            ],
          ),
          label: ''
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          ],
        ),

    );
  }
}