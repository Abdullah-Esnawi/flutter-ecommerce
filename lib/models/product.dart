import 'package:e_commerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final double price;
  final int? rate;
  final String imgUrl;
  final double? discountValue;
   Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.rate,
  });
}


List<Product> dummyProduct = [
  Product(id: '1', title: 'T-shirt1', category: 'Clothes', price: 300, imgUrl: AppAssets.tempProductAsset1,discountValue: 18),
  Product(id: '2', title: 'T-shirt2', category: 'Clothes', price: 275, imgUrl: AppAssets.tempProductAsset2,discountValue: 10),
  Product(id: '3', title: 'T-shirt3', category: 'Clothes', price: 320, imgUrl: AppAssets.tempProductAsset3,discountValue: 20),
  Product(id: '4', title: 'T-shirt4', category: 'Clothes', price: 310, imgUrl: AppAssets.tempProductAsset4,discountValue: 17),
];