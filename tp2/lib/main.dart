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
                const SizedBox(height: 5), // Spacer
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xff0F1035),
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hospital & Medical Services",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "See more" button tap
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: Text(
                        "See more",
                        style: TextStyle(fontSize: 14),
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
                          child: ImageListView(
                            imageUrls: [
                              'https://blu-djpb.kemenkeu.go.id/images/5_1624092610504da276891e5453b002c784f824f582.jpg',
                              'https://rsgm.unpad.ac.id/wp-content/uploads/2021/03/LOGO-RSGM-UNPAD.png',
                              'https://via.placeholder.com/150?text=Image3',
                              'https://via.placeholder.com/150?text=Image4',
                              'https://via.placeholder.com/150?text=Image5',
                              // Add more image URLs here for the first list
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Spacer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialist & Polyclinic",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "See more" button tap
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: Text(
                        "See more",
                        style: TextStyle(fontSize: 14),
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
                          child: ImageListView(
                            imageUrls: [
                              'https://via.placeholder.com/150?text=Image6',
                              'https://via.placeholder.com/150?text=Image7',
                              'https://via.placeholder.com/150?text=Image8',
                              'https://via.placeholder.com/150?text=Image9',
                              'https://via.placeholder.com/150?text=Image10',
                              // Add more image URLs here for the second list
                            ],
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

class ImageListView extends StatelessWidget {
  final List<String> imageUrls;

  const ImageListView({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        imageUrls.length,
        (index) => Container(
          width: 120,
          height: 150,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white, // Changed to white
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(
                0xff090F47,
              ), // Outline color
              width: 3, // Outline width
            ),
          ),
          child: Center(
            child: Image.network(
              imageUrls[index],
              width: 80, // Adjust size as needed
            ),
          ),
        ),
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
