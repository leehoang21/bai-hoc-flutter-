import 'package:couwn_douwn/color.dart';
import 'package:couwn_douwn/images.dart';
import 'package:couwn_douwn/provider/provider_images_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EggImagePosition(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return Scaffold(
          backgroundColor: ColorApp.lightOrange,
          appBar: AppBar(
            backgroundColor: Colors.blue,
          ),
          drawer: const Drawer(),
          body: SizedBox.fromSize(
            size: Size(
              ScreenUtil().screenWidth,
              ScreenUtil().screenHeight,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  right: ScreenUtil().screenWidth * 0.5,
                  child: const Text(
                    'data',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                arrows(
                  const Icon(Icons.arrow_back_ios),
                  true,
                ),
                animationImages(1, ImageApp.imagesSoftBoiledEgg),
                animationImages(2, ImageApp.imagesHardBoiledEgg),
                animationImages(3, ImageApp.imagesPoachedEgg),
                arrows(
                  const Icon(Icons.arrow_forward_ios),
                  false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Consumer animationImages(int i, String imagesApp) {
    return Consumer<EggImagePosition>(
      builder: (context, value, child) { 
        return AnimatedPositioned(
          right: value.,
          bottom: ScreenUtil().screenHeight * 0.45,
          child: SizedBox(
            width: ScreenUtil().screenWidth * 0.3,
            height: ScreenUtil().screenHeight * 0.3,
            child: Image.asset(imagesApp),
          ),
          duration: const Duration(
            milliseconds: 200,
          ),
        );
      },
    );
  }
double selectImages(int i) {
    if (i == 1) {
      return ScreenUtil().screenWidth * _image1;
    } else if (i == 2) {
      return ScreenUtil().screenWidth * _image2;
    } else {
      return ScreenUtil().screenWidth * _image3;
    }
  }
  Positioned arrows(Icon iconArrow, bool isLeft) {
    return Positioned(
      top: ScreenUtil().screenHeight * 0.3,
      right: isLeft ? null : 10,
      left: isLeft ? 10 : null,
      child: IconButton(
        onPressed: () {},
        icon: iconArrow,
      ),
    );
  }
}
