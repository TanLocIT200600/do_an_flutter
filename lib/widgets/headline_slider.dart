import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeadlingSliderWidget extends StatefulWidget {
  @override
  _HeadlingSliderWidgetState createState() => _HeadlingSliderWidgetState();
}

class _HeadlingSliderWidgetState extends State<HeadlingSliderWidget> {
  final controller = CarouselController();
  int activeIndex = 0;
  final urlImages = [
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/22/41/Lukaku.jpg',
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/41/mu-vs-arsenal.jpg',
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/8/maguire300400.jpg',
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/22/41/Lukaku.jpg',
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/41/mu-vs-arsenal.jpg',
    'https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/8/maguire300400.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuilderImageSlider(),
          const SizedBox(height: 18),
          buildIndicator(),
        ],
      )),
    );
  }

  Widget BuilderImageSlider() => CarouselSlider.builder(
        options: CarouselOptions(
            height: 270,
            initialPage: 0,
            // viewportFraction: 1,
            // autoPlay: true,
            pageSnapping: false,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            // reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index)),
        itemCount: urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = urlImages[index];
          return buildImage(urlImage, index);
        },
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: SlideEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
        ),
      );
}
