import 'package:flutter/material.dart';
import 'package:vilflutterapp/Product.dart';
import 'package:vilflutterapp/details_screen.dart';
import 'package:vilflutterapp/product_card.dart';
import 'package:vilflutterapp/size_config.dart';
import 'section_title.dart';

class availableProducts extends StatelessWidget {
  static const String routeName = "/available";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "All Available Products", press: () {

          }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                  if (demoProducts[index].isPopular != null)
                    return ProductCard(product: demoProducts[index],
                      press: () =>
                          Navigator.pushNamed(context, DetailsScreen
                              .routeName, arguments: ProductDetailsArguments
                            (product: demoProducts[index]),
                          ),
                      /* Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()),
                          ),*/

                    );

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}


