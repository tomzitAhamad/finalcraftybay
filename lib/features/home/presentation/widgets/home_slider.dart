import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalcrafty/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _currentIndex=ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index,reason){
              _currentIndex.value=index;
            },
              viewportFraction: 1,
              height: 180.0),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                        color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),),
                  alignment: .center,
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
          for(int i=0;i<5;i++)
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
}
