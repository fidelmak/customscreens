import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';

class DemosScreen extends StatefulWidget {
  const DemosScreen({super.key});

  @override
  State<DemosScreen> createState() => _DemosScreenState();
}

class _DemosScreenState extends State<DemosScreen> {
  int _currentIndex = 0;
  int _selectedButtonIndex =
      -1; // Track which button is selected (-1 means none)

  final Color defaultButtonColor = const Color.fromARGB(46, 47, 56, 1);
  final Color selectedButtonColor = Colors.yellow;
  final Color defaultTextColor = Colors.white;
  final Color selectedTextColor = Colors.black;

  final List<String> buttonTitles = [
    "Workout",
    "Yoga",
    "Meditation",
    "Nutrition",
    "Sleep",
  ];

  void _handlePreviousButtonClick() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _handleButtonClick(int index) {
    setState(() {
      // If clicking the same button, deselect it. Otherwise, select the new one.
      _selectedButtonIndex = _selectedButtonIndex == index ? -1 : index;
      print(
        "Button '${buttonTitles[index]}' selected: ${_selectedButtonIndex == index}",
      );
    });
  }

  void _handleNextButtonClick() {
    setState(() {
      _currentIndex++;
    });
  }

  Widget _buildButton(String title, int index) {
    bool isSelected = _selectedButtonIndex == index;

    return Container(
      // width: 110,
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ), // Add spacing between buttons
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? selectedButtonColor : defaultButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => _handleButtonClick(index),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? selectedTextColor : defaultTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "Roboto",
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons() {
    return buttonTitles.asMap().entries.map((entry) {
      int index = entry.key;
      String title = entry.value;
      return _buildButton(title, index);
    }).toList();
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(
      child: Text(
        'HOME',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'GUIDE',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'ADD NEW',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'STATISTICS',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'REWARDS',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget _buildNavItem(
    int index,
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
  ) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected ? Colors.amber[600] : Colors.grey[600],
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.amber[600] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    bool isSelected = _selectedIndex == 2;

    return GestureDetector(
      onTap: () => _onItemTapped(2),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber[700] : Colors.amber[600],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 8, 29, 1),
      appBar: AppBar(
        title: Text(
          "Browse",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(20, 22, 28, 1),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Colors.black.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_outlined, Icons.home, 'HOME'),
            _buildNavItem(1, Icons.book_outlined, Icons.book, 'GUIDE'),

            _buildNavItem(
              3,
              Icons.bar_chart_outlined,
              Icons.bar_chart,
              'STATISTICS',
            ),
            _buildNavItem(
              4,
              Icons.card_giftcard_outlined,
              Icons.card_giftcard,
              'REWARDS',
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(20, 22, 28, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.07,
                            viewportFraction:
                                0.37, // Adjusted for better spacing
                            initialPage: 0,
                            autoPlay: false,
                            enableInfiniteScroll: false,
                            padEnds: false, // Remove extra padding
                          ),
                          items: _buildButtons(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1, // Line thickness
                          height: 20, // Total height including spacing
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                            Expanded(
                              child: Text(
                                "Filter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                            Expanded(
                              child: Text(
                                "Sort",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                            Expanded(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //////////
                ///
                Card(
                  elevation: 8,
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/gym5.jpeg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                            0.6,
                          ), // Dark overlay for text readability
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Section
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                  "assets/images/gym4.jpeg",
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FitZone Gym Center',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Premium Fitness Experience',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Spacer(),

                          // Content Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transform Your Body,\nElevate Your Mind",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Join our premium fitness community and unlock your potential with:",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12),
                              Column(
                                children: [
                                  _buildFeatureRow(
                                    Icons.fitness_center,
                                    "State-of-the-art equipment",
                                  ),
                                  _buildFeatureRow(
                                    Icons.person,
                                    "Certified personal trainers",
                                  ),
                                  _buildFeatureRow(
                                    Icons.group,
                                    "Dynamic group classes",
                                  ),
                                  _buildFeatureRow(
                                    Icons.access_time,
                                    "24/7 member access",
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              // Rating Section
                              Row(
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "4.9 (250+ reviews)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///////////
                GymCard(
                  myImage: AssetImage("assets/images/gym1.jpeg"),
                  myImage2: AssetImage("assets/images/gym2.jpeg"),
                ),
                GymCard(
                  myImage: AssetImage("assets/images/gym3.jpeg"),
                  myImage2: AssetImage("assets/images/gym4.jpeg"),
                ),
                GymCard(
                  myImage: AssetImage("assets/images/gym6.jpeg"),
                  myImage2: AssetImage("assets/images/gym7.jpeg"),
                ),
                GymCard(
                  myImage: AssetImage("assets/images/gym5.jpeg"),
                  myImage2: AssetImage("assets/images/gym9.jpeg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class GymCard extends StatelessWidget {
  const GymCard({super.key, required this.myImage, required this.myImage2});
  final ImageProvider myImage;
  final ImageProvider myImage2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(image: myImage2, fit: BoxFit.cover),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Chest Workout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Complete Guide",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.play_arrow, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    "45 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Hard",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.app_shortcut, color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8), // Add spacing between cards
          Expanded(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: myImage, // Different image
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Broader Shoulders",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Complete Guide",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.play_arrow, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    "45 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Easy",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
