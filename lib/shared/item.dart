class Item {
  final String imgPath;
  final double price;
  final String location;
  final String name;

  Item(  {this.name='Product1',this.location='Main Branch',required this.imgPath, required this.price});
}

List<Item> items = [
  Item(location: 'Abdo Shop',imgPath: 'assets/img/1.webp', price: 12.99),
  Item(name: 'Product2',imgPath: 'assets/img/2.webp', price: 13.99),
  Item(name: 'Product3',imgPath: 'assets/img/3.webp', price: 14.99),
  Item(name: 'Product4',imgPath: 'assets/img/4.webp', price: 15.99),
  Item(name: 'Product5',imgPath: 'assets/img/5.webp', price: 16.99),
  Item(name: 'Product6',imgPath: 'assets/img/6.webp', price: 17.99),
  Item(name: 'Product7',imgPath: 'assets/img/7.webp', price: 18.99),
  Item(name: 'Product8',imgPath: 'assets/img/8.webp', price: 19.99),
];
