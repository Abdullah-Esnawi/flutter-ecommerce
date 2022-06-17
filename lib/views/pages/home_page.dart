import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/views/widget/builder_header_of_list.dart';
import 'package:e_commerce/views/widget/list_items_in_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBannerHomePageAsset,
                width: double.infinity,
                height: _size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: .2,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: _size.height * 0.3,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  "Street Clothes",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: _size.width * .03),
          BuildHeaderOfList(
              title: 'Sale', onTap: () {}, description: 'Super Summer Sale!!'),
          SizedBox(
            height: _size.width * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyProduct.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: _size.width * .02),
                    child: ListItemHome(
                      product: dummyProduct[index],
                    ),
                  );
                }),
              ),
            ),
          ),
          BuildHeaderOfList(
              title: 'New', onTap: () {}, description: 'Super New Products!!'),
          SizedBox(
            height: _size.height * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyProduct.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: _size.width * .02),
                    child: ListItemHome(
                      product: dummyProduct[index],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
