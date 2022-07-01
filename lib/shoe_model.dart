import 'package:flutter/material.dart';

class ShoeModel {
  final String category;
  final String name;
  final String price;
  final List<ListImage> listImage;
  final int punctuation;

  ShoeModel({
    required this.category,
    required this.name,
    required this.price,
    required this.listImage,
    required this.punctuation,
  });
}

class ListImage {
  final String image;
  final Color color;

  ListImage({
    required this.image,
    required this.color,
  });
}

List<ShoeModel> listShoes = [
  ShoeModel(
    category: "NIKE AIR",
    name: "AIR JORDAN 1 MID SE GC",
    price: "\$120.00",
    listImage: [
      ListImage(
        image: "assets/J_001.png",
        color: const Color(0xFFb17d22),
      ),
      ListImage(
        image: "assets/J_002.png",
        color: const Color(0xFF008a75),
      ),
      ListImage(
        image: "assets/J_003.png",
        color: const Color(0xFF8e0107),
      ),
      ListImage(
        image: "assets/J_004.png",
        color: const Color(0xFF007445),
      ),
    ],
    punctuation: 4,
  ),
  ShoeModel(
    category: "NIKE AIR",
    name: "NIKE BLAZER MID",
    price: "\$150.00",
    listImage: [
      ListImage(
        image: "assets/Z_001.png",
        color: const Color(0xFF018b72),
      ),
      ListImage(
        image: "assets/Z_002.png",
        color: const Color(0xFFba0214),
      ),
      ListImage(
        image: "assets/Z_003.png",
        color: const Color(0xFF00781f),
      ),
      ListImage(
        image: "assets/Z_004.png",
        color: const Color(0xFFc35018),
      ),
    ],
    punctuation: 3,
  ),
  ShoeModel(
    category: "NIKE ZOOM",
    name: "ZoomX Vaporfly",
    price: "\$180.00",
    listImage: [
      ListImage(
        image: "assets/N_001.png",
        color: const Color(0xFF5d5c37),
      ),
      ListImage(
        image: "assets/N_002.png",
        color: const Color(0xFF252034),
      ),
      ListImage(
        image: "assets/N_003.png",
        color: const Color(0xFF1d1c22),
      ),
      ListImage(
        image: "assets/N_004.png",
        color: const Color(0xFF437151),
      ),
    ],
    punctuation: 3,
  ),
];
