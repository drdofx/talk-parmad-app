import 'package:flutter/material.dart';

class SortButton extends StatefulWidget {
  @override
  _SortButtonState createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  String selectedValue = 'Latest';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Sort By:',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: selectedValue,
              dropdownColor: Colors.white,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
                // Call your custom function or perform any other actions
                handleSortByValueChange(newValue);
              },
              items: <String>[
                'Latest',
                'Most Popular',
                'Most Replies',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  void handleSortByValueChange(String? newValue) {
    // Implement your logic here based on the selected value
    print('Selected value: $newValue');
  }
}
