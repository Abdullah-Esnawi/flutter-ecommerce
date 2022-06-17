import 'package:e_commerce/utilities/assets.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
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
                      "${product.discountValue.toStringAsFixed(0)}%",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
  SizedBox(height: 8.0,),
        Text(product.category, style: Theme.of(context).textTheme.caption!.copyWith(
          color: Colors.grey
        ),),
        Text(product.title, style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500),),
        Text("${product.price}\$", style: Theme.of(context).textTheme.caption!.copyWith(),)
        ],
      ),
    );
  }
}
