import 'package:e_commerce_app/provider/cart.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/screens/details_screen.dart';
import 'package:e_commerce_app/screens/profile_page.dart';
import 'package:e_commerce_app/shared/color.dart';
import 'package:e_commerce_app/shared/item.dart';
import 'package:e_commerce_app/shared/user_image_from_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final detailsFromUserEmail=FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                 const UserAccountsDrawerHeader(
                  accountName: Text(
                    'Abdulrahman',
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail:  Text(
                    'abdo010@email.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/cover.jpg'),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPictureSize: Size.square(80),
                  currentAccountPicture: ImgUser(),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Home()));},
                ),
                ListTile(
                  title: const Text('My Product'),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Checkout()));},
                ),
                ListTile(
                  title: const Text('Profile'),
                  leading: const Icon(Icons.person),
                  onTap: () {Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>const ProfilePage(),
                  ));},
                ),
                ListTile(
                  title: const Text('About'),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: ()async {await FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: const Text(
                'Developed by Abdulrahman Alaa @2024',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: appbarGreen,
        title: const Text(
          'Home',
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Checkout()));
                      },
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
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 33,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(
                              product: items[index],
                            )));
              },
              child: GridTile(
                footer: GridTileBar(
                  trailing: Consumer<Cart>(builder: ((context, cart, child) {
                    return IconButton(
                      onPressed: () {
                        cart.add(items[index]);
                      },
                      icon: const Icon(Icons.add),
                      color: const Color.fromARGB(255, 62, 94, 70),
                    );
                  })),
                  leading: Text('\$${items[index].price}'),
                  title: const Text(''),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: -3,
                      bottom: -9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(items[index].imgPath),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
