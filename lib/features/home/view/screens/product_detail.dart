import 'package:e_commerce_app/core/constant/route_names.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  final Color uiPrimaryColor = const Color(0xFF00A9B7);

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
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: uiPrimaryColor,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                const Text(
                                  'Product Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
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

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Happy New Year Special Deal\nSave 30%',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              _quantitySelector(uiPrimaryColor),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.createReview,
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.star, color: Color(0xFFFFD700)),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.8',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(width: 15),
                                  ],
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.reviews,
                                  );
                                },
                                child: Text(
                                  'Reviews',
                                  style: TextStyle(
                                    color: uiPrimaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: uiPrimaryColor,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 15),

                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, RouteNames.productDetailsScreen);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: uiPrimaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white70,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: List.generate(
                              colors.length,
                                  (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColorIndex = index;
                                  });
                                },
                                child: _buildColorOption(
                                  colors[index],
                                  selectedColorIndex == index,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: List.generate(
                              sizes.length,
                                  (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSizeIndex = index;
                                  });
                                },
                                child: _buildSizeOption(
                                  sizes[index],
                                  selectedSizeIndex == index,
                                  uiPrimaryColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),

                          const Text(
                            'Reference site about Lorem Ipsum, giving information on its origins as well as a random Lipsum generator.',
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _bottomBar(uiPrimaryColor),
          ],
        ),
      ),
    );
  }

  Widget _quantitySelector(Color uiColor) {
    return Row(
      children: [
        _qtyButton(Icons.remove, uiColor, quantity > 1 ? () {
          setState(() => quantity--);
        } : null),
        const SizedBox(width: 8),
        Text('$quantity'),
        const SizedBox(width: 8),
        _qtyButton(Icons.add, uiColor, () {
          setState(() => quantity++);
        }),
      ],
    );
  }

  Widget _qtyButton(IconData icon, Color color, VoidCallback? onTap) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected
            ? Border.all(color: Colors.black, width: 2)
            : null,
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: selected
            ? const Icon(Icons.check, color: Colors.white, size: 14)
            : null,
      ),
    );
  }

  Widget _buildSizeOption(String size, bool selected, Color uiColor) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? uiColor : Colors.white,
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

  Widget _bottomBar(Color uiColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: uiColor.withOpacity(0.15),
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
                  color: uiColor,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: uiColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Add To Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
