import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EggImagePosition extends ChangeNotifier {
  double _image1 = 0.35;
  double _image2 = 1.35;
  double _image3 = 2.35;

  double get image1 => ScreenUtil().screenWidth * _image1;

  get image2 => ScreenUtil().screenWidth * _image2;

  get image3 => ScreenUtil().screenWidth * _image3;

  

  void movingImages(int value) {
    _image1 = ScreenUtil().screenWidth * _image1 + value;
    _image2 = ScreenUtil().screenWidth * _image2 + value;
    _image3 = ScreenUtil().screenWidth * _image3 + value;
    notifyListeners();
  }
}
