import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/features/home/presentation/provider/home_slider_provider.dart';
import 'package:finalcrafty/features/shared/widgets/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _currentIndex=ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeSliderProvider>(
      builder: (context,homeSliderProvider,_) {
        if(homeSliderProvider.homeSlidersInProgress){
          return SizedBox(
              height: 190,
              child: CenterCircularProgress());
        }

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index,reason){
                  _currentIndex.value=index;
                },
                  viewportFraction: 1,
                  height: 180.0),
              items: homeSliderProvider.homeSliders.map((sliders) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),

                      alignment: .center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            sliders.photoUrl,
                            fit: BoxFit.cover,
                            height: double.maxFinite,
                            width: double.maxFinite,
                            loadingBuilder: (context,child,loadingProgress){
                              if(loadingProgress==null) return child;
                              return CenterCircularProgress();
                            },
                            errorBuilder: (context,child,loadingProgress){
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 8,),
            ValueListenableBuilder(
              valueListenable: _currentIndex, builder: ( context, value, Widget? child) {
                return Row(
              mainAxisAlignment: .center,
              children: [
              for(int i=0;i<homeSliderProvider.homeSliders.length;i++)
              Container(
              margin: EdgeInsets.only(right: 4),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value==i? AppColors.themeColor: Colors.white,
                border: Border.all(color: AppColors.themeColor)
              ),
              )
              ],
              );
            },

            )
          ],
        );
      }
    );
  }
}
