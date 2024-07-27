import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       title: Text('Post Details'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Post Details'),
          ],
        ),
      ),
    );
  }
}
