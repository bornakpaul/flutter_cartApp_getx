import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getxcart/widgets/favourite_products.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  //* Carousel
  int _current = 0;
  List imgList = [
    'assets/images/blue.png',
    'assets/images/green.png',
    'assets/images/blueDark.png',
    'assets/images/brown.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  //*
  TextEditingController searchStationaryCntlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        title: Text(
          "EcoCart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                searchStationaryCntlr: searchStationaryCntlr,
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1,
                  height: 150.0,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Color(0xff0957DE),
                            borderRadius: BorderRadius.circular(6.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.asset(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map(
                  imgList,
                  (index, url) {
                    return Container(
                      width: 18,
                      height: 4,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(3),
                        color: _current == index
                            ? Color(0xff0957DE)
                            : Color(0xff1877F2).withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Choose a product',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              //*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/books.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Books',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/Notebook.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Notebook',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/spiral.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Diary',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/pens.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Pens',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/pencil.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Pencil',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/highlighter.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Highlighter',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/colouredpages.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'A4 sheet',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/stickynotes.jpeg',
                      fit: BoxFit.fill,
                    ),
                    text: 'StickyNotes',
                  ),
                  CategorySectionCards(
                    img: Image.asset(
                      'assets/images/others.jpg',
                      fit: BoxFit.fill,
                    ),
                    text: 'Other Items',
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Most Purchased',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FavouriteProducts(),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySectionCards extends StatelessWidget {
  final Image img;
  final String text;
  const CategorySectionCards({
    required this.img,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              height: 80,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: img,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required this.searchStationaryCntlr,
  }) : super(key: key);

  final TextEditingController searchStationaryCntlr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          width: 2,
          color: Colors.blue.withOpacity(0.4),
        ),
      ),
      child: TextFormField(
        controller: searchStationaryCntlr,
        onFieldSubmitted: (value) {
          //! We will call a function here to search the medicines.
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintText: 'Search Stationary',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
