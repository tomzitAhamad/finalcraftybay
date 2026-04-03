
import 'package:finalcrafty/app/app_colors.dart';
import 'package:finalcrafty/features/reviews/presentation/screens/create_review.dart';
import 'package:finalcrafty/features/reviews/presentation/widgets/reviews_showing_card_section.dart';
import 'package:flutter/material.dart';

import '../widgets/floating_action_bar.dart';
import '../widgets/reviews_card_section.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});
  static const String name='reviews-screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ReviewsCardSection(name: 'Tomzit Ahamad',
                  description: "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's "
                      "standard dummy text ever since the 1500s,",),
                ReviewsCardSection(name: 'Tomzit Ahamad',
                  description: "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's "
                      "standard dummy text ever since the 1500s,",),
                ReviewsCardSection(name: 'Tomzit Ahamad',
                  description: "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's "
                      "standard dummy text ever since the 1500s,",),
                ReviewsCardSection(name: 'Tomzit Ahamad',
                  description: "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's "
                      "standard dummy text ever since the 1500s,",),
              ],
            ),
          ),
          Stack(
            children: [
              ReviewsShowingCardSection(reviews: 100),

              Positioned(
                right: 10,
                top: 17,
                child: FloatingActionBar(onTap: () {
                  Navigator.pushNamed(context, CreateReview.name);
                },),
              ),
            ],
          )
        ],
      ),
    );
  }
}



