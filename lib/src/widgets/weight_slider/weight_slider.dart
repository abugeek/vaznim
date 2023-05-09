import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vaznim/data/constants.dart';

class WeightSlider extends StatefulWidget {
  WeightSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
    required this.width,
  })  : scrollController = ScrollController(
          initialScrollOffset: (value - minValue) * width / 3,
        ),
        super(key: key);

  final int minValue;
  final int maxValue;
  final int value;
  final ValueChanged<int> onChanged;
  final double width;
  final ScrollController scrollController;

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  double get itemExtent => widget.width / 3;

  int _indexToValue(int index) => widget.minValue + (index - 1);

  @override
  build(BuildContext context) {
    int itemCount = (widget.maxValue - widget.minValue) + 3;
    return NotificationListener(
      onNotification: _onNotification,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        itemCount: itemCount,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          int itemValue = _indexToValue(index);
          bool isExtra = index == 0 || index == itemCount - 1;

          return isExtra
              ? Container() //empty first and last element
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _animateTo(itemValue, durationMillis: 250),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      itemValue.toString(),
                      style: _getHighlightTextStyle(context),
                    ),
                  ),
                );
        },
      ),
    );
  }

  TextStyle _getHighlightTextStyle(BuildContext context) {
    return const TextStyle(
      color: textColorDarkBlue,
      fontSize: 18.0,
    );
  }

  bool _userStoppedScrolling(Notification notification) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        widget.scrollController.position.activity is! HoldScrollActivity;
  }

  _animateTo(int valueToSelect, {int durationMillis = 200}) {
    double targetExtent = (valueToSelect - widget.minValue) * itemExtent;
    widget.scrollController.animateTo(
      targetExtent,
      duration: Duration(milliseconds: durationMillis),
      curve: Curves.decelerate,
    );
  }

  int _offsetToMiddleIndex(double offset) =>
      (offset + widget.width / 2) ~/ itemExtent;

  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(indexOfMiddleElement);
    middleValue =
        math.max(widget.minValue, math.min(widget.maxValue, middleValue));
    return middleValue;
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);

      if (_userStoppedScrolling(notification)) {
        _animateTo(middleValue);
      }

      if (middleValue != widget.value) {
        widget.onChanged(middleValue); //update selection
      }
    }
    return true;
  }
}
