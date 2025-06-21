import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      body: Center(
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
                          viewportFraction: 0.37, // Adjusted for better spacing
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
            ],
          ),
        ),
      ),
    );
  }
}
