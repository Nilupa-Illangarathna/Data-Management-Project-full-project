import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/API_Classes/HomeModuleRelated/placeData/place_data_init.dart';


class AddonListView extends StatelessWidget {
  final Map<String, Addon> addons;
  late Map<String, Addon> Tempaddons;
  final Function(double) updateTotalAddonsPrice;

  AddonListView({
    required this.addons,
    required this.updateTotalAddonsPrice,
  });

  @override
  Widget build(BuildContext context) {
    Tempaddons=addons;
    return ListView(
      children: Tempaddons.entries.map((entry) {
        final key = entry.key;
        final addon = entry.value;

        return Container(
          height: 40 * HR,
          margin: EdgeInsets.only(bottom: 12 * HR),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    addon.addonName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15 * HR,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "+\$${addon.addonPrice}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15 * HR,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: addon.isAdded,
                activeColor: Color(0xFF007AFF),
                checkColor: Colors.white,
                onChanged: (value) {
                  // Update the isAdded state in the original dictionary
                  addon.isAdded = value!;

                  // Step 3: Call the function to update total addons price
                  if (value != null) {
                    double addonPrice = value ? addon.addonPrice : -addon.addonPrice;
                    updateTotalAddonsPrice(addonPrice);
                    addon.isAdded=value;
                    print(addon.addonName + " " + addon.isAdded.toString());
                  }
                },
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}