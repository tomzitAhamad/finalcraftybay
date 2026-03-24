
import 'package:flutter/material.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});
  static const String name='create-review';

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 19,),
        TextFormField(
        decoration: InputDecoration(hintText: 'First Name'),

            ),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Last Name'
              ),
            ),
            TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Write Review',


              ),
              
            ),
            FilledButton(onPressed: (){}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
