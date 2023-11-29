
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 200 * HR,
                  ),
                  Center(child: Text('Wish List')),
                  // ImageIcon(AssetImage(''))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}