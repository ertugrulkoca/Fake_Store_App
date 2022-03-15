import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../detail/view/detail_view.dart';
import '../viewModel/home_view_model.dart';

final _viewModel = HomeViewModel();

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final int _index = 0;
  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
        child: Column(
          children: [
            searchBar(context),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: categoriesListView(context),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: productListView(),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Fake Store'),
          Text(
            'Perfect Choice!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Container searchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }

  Widget categoriesListView(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              _viewModel.fetchProducts();
              _viewModel.categoryIndex = -1;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: _viewModel.categoryIndex == -1
                    ? Theme.of(context).primaryColor
                    : null,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "All",
                style: TextStyle(
                  color: _viewModel.categoryIndex == -1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _viewModel.categories.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _viewModel.fetchProductsByCategory(
                        _viewModel.categories.categories[index]);
                    _viewModel.categoryIndex = index;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: _viewModel.categoryIndex == index
                          ? Theme.of(context).primaryColor
                          : null,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      _viewModel.categories.categories[index],
                      style: TextStyle(
                        color: _viewModel.categoryIndex == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }

  Observer productListView() {
    return Observer(builder: (_) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _viewModel.productItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailView(
                            product: _viewModel.productItems[index])));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      _viewModel.productItems[index].image ??
                          "https://dummyimage.com/600x400/000/fff",
                      height: 130,
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _viewModel.productItems[index].title ?? "",
                            style: Theme.of(context).textTheme.bodyLarge,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$${_viewModel.productItems[index].price}"),
                              const SizedBox(width: 50),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Buy",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Bag"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
