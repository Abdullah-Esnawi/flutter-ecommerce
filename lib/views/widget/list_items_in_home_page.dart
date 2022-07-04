import 'package:e_commerce/utilities/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  ListItemHome({Key? key, required this.product}) : super(key: key);
  final product;
  bool _isFavorited = false;
  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.cover,
                  height: _size.height * .26,
                  width: _size.width * .5,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: SizedBox(
                  width: 40,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                        child: Text(
                      "-${product.discountValue}%",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    )),
                  ),
                ),
              ),
              Positioned(
                  bottom: -20,
                  right: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50.0),
                    onTap: () {
                      // setState(() {
                      //   if (_isFavorited) {
                      //     _isFavorited = false;
                      //     _iconColor = Colors.grey;
                      //   } else {
                      //     _isFavorited = true;
                      //     _iconColor = Colors.redAccent;
                      //   }
                      // });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(blurRadius: 8.0, color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(50.0)),
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        _isFavorited
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: _iconColor,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.grey),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${product.price}\$",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: ' ${(product.price * product.discountValue / 100).round()}\$',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
