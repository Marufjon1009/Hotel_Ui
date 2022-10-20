import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/const/consts.dart';
import 'package:flutter_application_6/const/tetx_Styles.dart';
import 'package:flutter_application_6/model/hoytels_model.dart';
import 'package:flutter_application_6/widget/customm_gradiet_widget.dart';

class FirstPage extends StatefulWidget {
  static const paht = 'first page';
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ScrollController? _controller;
  TextEditingController? _textEditingController;
  Size? _size;
  bool? _isVisible = false;
  late final List<Hotel?> _hotelList = [];
  @override
  void initState() {
    _controller = ScrollController();
    _textEditingController = TextEditingController();
    _controller!.addListener(() {
      if (_controller!.position.pixels > 153) {
        _isVisible = true;
        setState(() {});
      } else {
        _isVisible = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    _hotelList.addAll([
      Hotel(
          name: "Hotel 1",
          image: AppImages.hotelOne,
          isFavourite: true,
          imageOne: AppImages.heart),
      Hotel(
          name: "Hotel 2",
          image: AppImages.hotelTwo,
          isFavourite: false,
          imageOne: AppImages.heart),
      Hotel(
          name: "Hotel 3",
          image: AppImages.hotelThree,
          isFavourite: true,
          imageOne: AppImages.heart),
      Hotel(
          name: "Hotel 4",
          image: AppImages.hotelFour,
          isFavourite: false,
          imageOne: AppImages.heart),
      Hotel(
          name: "Hotel 5",
          image: AppImages.hotelFive,
          isFavourite: false,
          imageOne: AppImages.heart),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          expandedHeight: _size!.height * 0.25,
          floating: false,
          snap: false,
          primary: true,
          pinned: true,
          stretch: true,
          title: _isVisible!
              ? customTetxFiled(controllerText: _textEditingController)!
              : null,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
            background: CustomGradientWidget(
              image: AppImages.hotelsHeader,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _size!.height * 0.07,
                  ),
                  Text(
                    "Best Hotels Ever",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold, height: 1.1),
                  ),
                  const SizedBox(height: 20),
                  customTetxFiled(controllerText: _textEditingController)!,
                ],
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),

        ///text
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Business Hotels",
              style: AppTextStyles.regular.copyWith(
                  color: const Color(0xFF424242),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _hotelList.length,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _hotelWidget(hotel: _hotelList[index]))),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 25),
        ),

        ///text
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Airport Hotels",
                    style: AppTextStyles.regular.copyWith(
                        fontSize: 20,
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.bold)))),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        ///sliver list
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemCount: _hotelList.length,
                itemBuilder: (context, index) =>
                    _hotelWidget(hotel: _hotelList[index])),
          ),
        ),

        ///tetx
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Resort Hotels",
              style: AppTextStyles.regular.copyWith(
                  color: const Color(0xFF424242),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),

        ///sliver list
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemCount: _hotelList.length,
                itemBuilder: (context, index) =>
                    _hotelWidget(hotel: _hotelList[index])),
          ),
        )
      ],
    ));
  }

  Widget? customTetxFiled({TextEditingController? controllerText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          controller: controllerText,
          decoration: InputDecoration(
              isDense: false,
              contentPadding: const EdgeInsets.only(bottom: 5, top: 10),
              hintText: 'Search for hotels',
              hintStyle: AppTextStyles.medium
                  .copyWith(fontSize: 17)
                  .copyWith(color: Colors.grey),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: InputBorder.none),
        ),
      ),
    );
  }

//hotel iwdget
  Widget _hotelWidget({Hotel? hotel}) {
    return Card(
      margin: const EdgeInsets.only(right: 15),
      color: Colors.transparent,
      elevation: .0,
      child: AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: AssetImage(hotel!.image!), fit: BoxFit.cover)),
          child: ClipRRect(
              child: hotel.isFavourite!
                  ? Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.1),
                            ]),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Text(
                            hotel.name!,
                            style: AppTextStyles.medium.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 140,
                          ),
                          const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          )
                        ],
                      ))
                  : Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.1),
                            ]),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Text(
                            hotel.name!,
                            style: AppTextStyles.medium.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 140,
                          ),
                          const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          )
                        ],
                      ))),
        ),
      ),
    );
  }
}
