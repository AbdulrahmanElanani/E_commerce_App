// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/provider/cart.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/shared/color.dart';
import 'package:e_commerce_app/shared/item.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  final Item product;

  const Details({
    super.key,
    required this.product,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: appbarGreen,
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        actions: [
          Consumer<Cart>(builder: ((context, cart, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 164, 255, 193),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cart.selectedProduct.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout()));},
                      icon: const Icon(Icons.add_shopping_cart),
                      style: const ButtonStyle(
                          iconColor: WidgetStatePropertyAll(Colors.white),
                          iconSize: WidgetStatePropertyAll(18)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '\$ ${cart.price.round()}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            );
          })),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath),
            const SizedBox(
              height: 11,
            ),
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 129, 129),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                        size: 26,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                        size: 26,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                        size: 26,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                        size: 26,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                        size: 26,
                      ),
                    ],
                  ),
                  const Spacer(),
                    Row(
                    children: [
                      const Icon(
                        Icons.edit_location,
                        color: Color.fromARGB(168, 3, 65, 27),
                        size: 26,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.product.location,
                        style: const TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: const Text(
                'Details',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower. These petals attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes. The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the ovary. ',
                style: const TextStyle(fontSize: 18),
                maxLines: isShowMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? 'Show more' : 'Show less',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
