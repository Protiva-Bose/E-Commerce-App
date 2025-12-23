import 'package:e_commerce_app/core/constant/route_names.dart';
import 'package:e_commerce_app/features/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../../widgets/category_item.dart';
import '../../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/logo_nav.svg',
          width: 30.w,
          height: 30.h,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _actionIcon(Icons.people_outline),
                const SizedBox(width: 12),
                _actionIcon(Icons.call),
                const SizedBox(width: 12),
                _actionIcon(Icons.notifications_active_outlined),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: _border(),
                  enabledBorder: _border(),
                  focusedBorder: _border(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 160.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (_, index) {
                    return _carouselCard();
                  },
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: _currentIndex == index ? 15 : 15,
                    height: _currentIndex == index ? 15 : 15,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? AppColors.primary
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
             SectionHeader(title: 'All Categories',onSeeAllTap: (){
               Navigator.pushNamed(context, RouteNames.categoriesScreen);
             },),
              SizedBox(height: 10.h),
              Row(
                spacing: 15,
                children: const [
                  CategoryItem(
                    title: 'Electronics',
                    iconPath: 'assets/icons/tv.png',
                  ),
                  CategoryItem(
                    title: 'Food',
                    iconPath: 'assets/icons/fruites1.png',
                  ),
                  CategoryItem(
                    title: 'Fashion',
                    iconPath: 'assets/icons/diamond1.png',
                  ),
                  CategoryItem(
                    title: 'Furniture',
                    iconPath: 'assets/icons/bed1.png',
                  ),
                ],
              ),

              SizedBox(height: 15.h),
              SectionHeader(title: 'Popular',onSeeAllTap: (){
                Navigator.pushNamed(context, RouteNames.seeAllProducts);
              },),
              SizedBox(height: 10.h),
              ProductCard(),
              SizedBox(height: 15.h),
              SectionHeader(title: 'Special',onSeeAllTap: (){
                Navigator.pushNamed(context, RouteNames.seeAllProducts);
              },),
              SizedBox(height: 10.h),
              ProductCard(),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.seeAllProducts);
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ProductCard(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carouselCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset('assets/images/shoes.png', scale: 1.7),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Happy New Year\nSpecial Deal\nSave 30%',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: 120.w,
                  height: 35.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(icon, color: Colors.grey.shade700),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    );
  }
}