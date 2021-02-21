library rating_widget;

import 'package:flutter/material.dart';

/*
Package Developed by Destiny Ed on Feb 19 2021
dikeachaeze@gmail.com
*/

class Rating extends StatefulWidget {
  final int rating;
  final Function(int) onRatingSelected;
  final Color unSelectedColor;
  final Color selectedColor;
  final double iconSize;
  final bool horizontal;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final int initialRating;

  Rating(
      {this.rating = 6,
      this.onRatingSelected,
      this.selectedColor,
      this.unSelectedColor,
      this.iconSize = 24.0,
      this.horizontal = true,
      this.initialRating = 1,
      this.unSelectedIcon,
      this.selectedIcon})
      : assert(onRatingSelected != null),
        assert(initialRating <= rating);
  //Assert : onRatingSelected must not be null
  //Assert : InitialRating must be less than or equal to rating

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _currentStar;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentStar = widget.initialRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Use Horizontal View if widget.horizontal is true
    //Else
    //Use Vertical View
    return widget.horizontal == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.rating,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentStar = index + 1;
                    });

                    //OnRatingSelected returns the _currentStar selected by User
                    widget.onRatingSelected(_currentStar);
                  },
                  child: index < _currentStar
                      ? Icon(
                          widget.selectedIcon ?? Icons.star,
                          color: widget.selectedColor ?? Colors.black,
                          size: widget.iconSize,
                        )
                      : Icon(
                          widget.unSelectedIcon ?? Icons.star_border,
                          color: widget.unSelectedColor,
                          size: widget.iconSize,
                        ),
                );
              },
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.rating,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentStar = index + 1;
                    });

                    //OnRatingSelected send _currentStar selected to User
                    widget.onRatingSelected(_currentStar);
                  },
                  child: index < _currentStar
                      ? Icon(
                          widget.selectedIcon ?? Icons.star,
                          color: widget.selectedColor ?? Colors.black,
                          size: widget.iconSize,
                        )
                      : Icon(
                          widget.unSelectedIcon ?? Icons.star_border,
                          color: widget.unSelectedColor,
                          size: widget.iconSize,
                        ),
                );
              },
            ),
          );
  }
}
