import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class OrderSummaryItem extends StatelessWidget {
  final int itemCount;
  final String itemName;
  final List<String> itemDetails;
  final double itemPrice;

  OrderSummaryItem({
    required this.itemCount,
    required this.itemName,
    required this.itemDetails,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24 * WR,
              height: 24 * WR,
              padding:  EdgeInsets.only(top: 2 * HR, left: 2 * WR, right: 2 * WR, bottom: 2 * HR,),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFFFD600),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                itemCount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15 * HR,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 12 * WR,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15 * HR,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2 * HR,
                  ),
                  if (itemDetails.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemDetails.length,
                      itemBuilder: (context, index) {
                        final itemDetail = itemDetails[index];
                        return Text(
                          '+ $itemDetail',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11 * HR,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2 * HR,
                        );
                      },
                    ),
                ],
              ),
            ),
            Spacer(),
            Text(
              '\$$itemPrice',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15 * HR,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
