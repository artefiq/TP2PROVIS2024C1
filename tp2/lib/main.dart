import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          title: const Text("Booking"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Hospital & Medical Services",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Spacer
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              10,
                              (index) => Container(
                                width: 120,
                                height: 150,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Changed to white
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(
                                        0xff090F47), // Outline color
                                    width: 3, // Outline width
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Content Box $index",
                                    style: TextStyle(
                                      color:
                                          const Color(0xff090F47), // Text color
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max, size: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined, size: 24),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor_heart_outlined, size: 24),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined, size: 24),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:
          const Color(0xff0F1035), // Change this to your preferred color
      unselectedItemColor: Colors.grey, // Set the unselected item color here
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
