// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/API_Classes/HomeModuleRelated/cartData/cartClass.dart';
import '/Pages/HomePageModule/cartScreen/my_basket_screen.dart';
import '/Widgets/home_module/molecule_widgets/cart_item_listview.dart';

class CartListviewItem extends StatefulWidget {
  final PlaceCartData cartData;
  final String title;
  final String subtitle;
  final String imageUrl;
  final int quantity;
  final double subtotal;

  CartListviewItem({
    required this.cartData,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.quantity,
    required this.subtotal,
    required this.onItemClicked,
  });

  final void Function(int) onItemClicked;

  @override
  State<CartListviewItem> createState() => _CartListviewItemState();
}

class _CartListviewItemState extends State<CartListviewItem> {

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  void _submitForm() {
    widget.cartData.printPlaceCartData();
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>CartDetailsPage( onClose: () { Navigator.of(context).pop(); }, cartData: widget.cartData),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.cartData.printPlaceCartData();

    return GestureDetector(
      onTap: () {
        _submitForm();
      },
      child: Row(
        children: [
          Container(
            // width:  343* WR,
            margin: EdgeInsets.only(right: 32 * WR),
            height: 86 * HR,
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, 0));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: 180 * WR,
                  ),
                ),
                SizedBox(height: 10 * HR,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      limitTextWithEllipsis(widget.title, 10),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17 * HR,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1 * HR,),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13 * HR,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1 * HR,),
                    Text(
                      'Subtotal' + ' \$${widget.subtotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13 * HR,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 24 * HR,
                padding: EdgeInsets.symmetric(horizontal: 8 * WR, vertical: 3 * HR),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.quantity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13 * HR,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8 * WR,
              ),
              SvgPicture.asset(
                'assets/images/homeScreen/homeScreen/icons/arrow_icons/arrow_forward_ios.svg',
                width: 24 * WR,
                height: 24 * HR,
              )
            ],
          )
        ],
      ),
    );
  }
}