
import 'package:flutter/material.dart';

import '../../../../app/extension/utils_extension.dart';

class ReviewsCardSection extends StatelessWidget {
  const ReviewsCardSection({
    super.key, required this.name, required this.description,
  });
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Card(

              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Row(

                      spacing: 8,
                      children: [
                        CircleAvatar(

                          backgroundColor: Colors.grey.withAlpha(50), // optional background
                          child: Container(
                            padding: EdgeInsets.all(6), // space between icon & border
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                            ),
                            child: Icon(
                              Icons.person_2,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Text(name,style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text(description,
                      style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.grey
                      ),)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}