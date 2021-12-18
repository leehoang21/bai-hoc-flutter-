import 'package:count_down_timer/time_button.dart';
import 'animation_images.dart';
import 'arrow_button.dart';
import 'blocs/bloc_animation_images/animation.dart';
import 'blocs/bloc_time/time.dart';
import 'circular_progress.dart';
import 'color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return Scaffold(
          backgroundColor: ColorApp.lightOrange,
          appBar: AppBar(
            backgroundColor: ColorApp.lightOrange,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const Text(
                  'bất ngờ chưa',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
                Image.asset(ImagePath.imagesGif),
              ],
            ),
          ),
          body: SizedBox.fromSize(
            size: Size(
              ScreenUtil().screenWidth,
              ScreenUtil().screenHeight,
            ),
            child: Stack(
              children: [
                AnimationImages.name(
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[0],
                  nameImage: NameImages.soft,
                ),
                AnimationImages.name(
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[1],
                  nameImage: NameImages.poached,
                ),
                AnimationImages.name(
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[2],
                  nameImage: NameImages.hardBoiled,
                ),
                const ArrowButton(
                    icon: Icon(Icons.arrow_back_ios), isRight: false),
                AnimationImages(
                  imagePath: ImagePath.imagesSoftBoiledEgg,
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[0],
                ),
                AnimationImages(
                  imagePath: ImagePath.imagesPoachedEgg,
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[1],
                ),
                AnimationImages(
                  imagePath: ImagePath.imagesHardBoiledEgg,
                  rightPosition:
                      context.watch<BlocAnimation>().state.imagesPosition[2],
                ),
                const ArrowButton(
                    icon: Icon(Icons.arrow_forward_ios), isRight: true),
                const CircularProgress(),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: Text(
                    (context.watch<TimeBloc>().time),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                    ),
                  ),
                ),
                TimeButton()
              ],
            ),
          ),
        );
      },
    );
  }
}
