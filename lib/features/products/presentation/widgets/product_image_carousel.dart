import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalcrafty/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex=ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index,reason){
                _currentIndex.value=index;
              },
              viewportFraction: 1,
              height: 220.0),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(

                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(

                      color: Colors.grey.withAlpha(50)
                  ),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0),),
                  alignment: .center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex, builder: ( context, value, Widget? child) {
            return Row(
              mainAxisAlignment: .center,
              children: [
                for(int i=0;i<5;i++)
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: value==i? AppColors.themeColor: Colors.white,
                        
                    ),
                  )
              ],
            );
          },
          
          ),
        )
      ],
    );
  }
}
