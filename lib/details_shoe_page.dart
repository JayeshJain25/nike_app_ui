import 'package:flutter/material.dart';
import 'package:nike_app_ui/shoe_model.dart';

class DetailsShoePage extends StatefulWidget {
  const DetailsShoePage({Key? key, required this.shoes}) : super(key: key);

  final ShoeModel shoes;

  @override
  State<DetailsShoePage> createState() => _DetailsShoePageState();
}

class _DetailsShoePageState extends State<DetailsShoePage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double sizeShoes(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                tween: Tween(begin: 0, end: 1),
                builder: (context, value, _) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: value * (size.height * 0.5),
                    width: value * (size.height * 0.5),
                    decoration: BoxDecoration(
                      color: widget.shoes.listImage[valueIndexColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FittedBox(
                child: Text(
                  widget.shoes.category,
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 250,
            ),
            right: sizeShoes(valueIndexSize, size),
            left: sizeShoes(valueIndexSize, size),
            top: size.height * 0.22,
            child: Hero(
              tag: widget.shoes.name,
              child: Image.asset(
                widget.shoes.listImage[valueIndexColor].image,
              ),
            ),
          ),
          Positioned(
            right: 16,
            left: 16,
            top: size.height * 0.6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoes.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.shoes.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.shoes.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: widget.shoes.punctuation > index
                              ? widget.shoes.listImage[valueIndexColor].color
                              : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'SIZE',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                            right: 16.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              valueIndexSize = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == valueIndexSize
                                    ? widget
                                        .shoes.listImage[valueIndexColor].color
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 7}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'COLOR',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: List.generate(
                        widget.shoes.listImage.length,
                        (index) => GestureDetector(
                          onTap: () {
                            valueIndexColor = index;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 8,
                            ),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.shoes.listImage[index].color,
                              border: index == valueIndexColor
                                  ? Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 100,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.shoes.listImage[valueIndexColor].color,
                  ),
                  child: const Center(
                    child: Text(
                      'BUY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
