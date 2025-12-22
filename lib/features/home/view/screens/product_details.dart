import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  final List<Color> colors = [
    Colors.black,
    const Color(0xFF00A9B7),
    const Color(0xFF7B5244),
    const Color(0xFFD9D9D9),
    Colors.grey,
  ];

  final List<String> sizes = ['S', 'M', 'L', 'X'];

  @override
  Widget build(BuildContext context) {
    final Color activeColor = colors[selectedColorIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// IMAGE SECTION
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: const Color(0xFFF2F2F2),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios, size: 20, color: activeColor),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                const Text(
                                  'Product Details',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Transform.rotate(
                              angle: -0.2,
                              child: Image.asset(
                                'assets/images/shoe.png',
                                scale: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// DETAILS
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// TITLE + QUANTITY
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Happy New Year Special Deal\nSave 30%',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              _quantitySelector(activeColor),
                            ],
                          ),

                          const SizedBox(height: 15),

                          /// RATING
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFFFD700)),
                              const SizedBox(width: 5),
                              const Text('4.8', style: TextStyle(color: Colors.grey)),
                              const SizedBox(width: 15),
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  color: activeColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: activeColor
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: activeColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white70,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          /// COLORS
                          const Text('Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Row(
                            children: List.generate(
                              colors.length,
                                  (index) => GestureDetector(
                                onTap: () => setState(() => selectedColorIndex = index),
                                child: _buildColorOption(
                                  colors[index],
                                  selectedColorIndex == index,
                                  activeColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// SIZES
                          const Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Row(
                            children: List.generate(
                              sizes.length,
                                  (index) => GestureDetector(
                                onTap: () => setState(() => selectedSizeIndex = index),
                                child: _buildSizeOption(
                                  sizes[index],
                                  selectedSizeIndex == index,
                                  activeColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// DESCRIPTION
                          const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          const Text(
                            'Reference site about Lorem Ipsum, giving information on its origins as well as a random Lipsum generator.',
                            style: TextStyle(color: Colors.grey, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// BOTTOM BAR
            _bottomBar(activeColor),
          ],
        ),
      ),
    );
  }

  /// QUANTITY SELECTOR
  Widget _quantitySelector(Color activeColor) {
    return Row(spacing: 8,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: Container(decoration: BoxDecoration(
              color: activeColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(5),
            ),
              child: IconButton(
                onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                icon: const Icon(Icons.remove, color: Colors.white,size: 18),
              ),
            ),
          ),
          Text('$quantity', style: const TextStyle(color: Colors.black)),
          SizedBox( width: 35,
            height: 35,
            child: Container(decoration: BoxDecoration(
              color: activeColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(5),
            ),
              child: IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add, color: Colors.white,size: 18,),
              ),
            ),
          ),
        ],
      );
  }

  /// COLOR OPTION
  Widget _buildColorOption(Color color, bool selected, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected ? Border.all(color: activeColor, width: 2) : null,
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: selected ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
      ),
    );
  }

  /// SIZE OPTION
  Widget _buildSizeOption(String size, bool selected, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? activeColor : Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// BOTTOM BAR
  Widget _bottomBar(Color activeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: activeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price', style: TextStyle(color: Colors.grey)),
              Text(
                '\$1,000',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: activeColor,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: activeColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Add To Cart', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
