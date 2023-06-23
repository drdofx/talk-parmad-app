import 'package:flutter/material.dart';

class DiscoverForumCarousel extends StatefulWidget {
  const DiscoverForumCarousel({Key? key}) : super(key: key);

  @override
  _DiscoverForumCarouselState createState() => _DiscoverForumCarouselState();
}

class _DiscoverForumCarouselState extends State<DiscoverForumCarousel> {
  final List<String> cardData = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
  ];

  late ScrollController _scrollController;
  bool _isScrollable = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Scrolled to the right end
      setState(() {
        _isScrollable = false;
      });
    } else if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Scrolled to the left end
      setState(() {
        _isScrollable = false;
      });
    } else {
      // Scrolled within the middle range
      setState(() {
        _isScrollable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              final screenWidth = MediaQuery.of(context).size.width;
              final cardWidth = screenWidth * 0.8; // Adjust the value as needed

              return Container(
                width: cardWidth,
                margin: EdgeInsets.only(right: 16.0),
                color: Colors.blue, // Replace with your card design
                child: Center(
                  child: Text(
                    cardData[index],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 16.0,
            child: AnimatedOpacity(
              opacity: _isScrollable ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              // child: Icon(
              //   Icons.arrow_back,
              //   color: Colors.white,
              // ),
            ),
          ),
          Positioned(
            right: 16.0,
            child: AnimatedOpacity(
              opacity: _isScrollable ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              // child: Icon(
              //   Icons.arrow_forward,
              //   color: Colors.white,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
