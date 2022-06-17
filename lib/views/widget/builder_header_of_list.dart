import 'package:flutter/material.dart';

class BuildHeaderOfList extends StatelessWidget {
  BuildHeaderOfList(
      {Key? key, required this.title, required this.description, this.onTap})
      : super(key: key);

  String title;
  String description;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        // top: 24.0,
        right: _size.width * .05,
        left: _size.width * .05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
