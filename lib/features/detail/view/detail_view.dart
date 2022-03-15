import 'package:flutter/material.dart';

import 'package:fake_shopping_app/features/home/model/product/product_model.dart';

class DetailView extends StatelessWidget {
  Product? product;
  DetailView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            product?.image ?? "https://dummyimage.com/600x400/000/fff",
            width: double.infinity,
            height: height * 0.4,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            product?.title ?? "",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text(product?.rating?.rate.toString() ?? ""),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      product?.description ?? "",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.black, width: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$${product?.price.toString()}",
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
