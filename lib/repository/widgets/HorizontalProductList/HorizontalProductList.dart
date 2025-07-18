import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalProductList extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;

  final bool showPrice;
  final bool showDeliveryTime;
  final bool showAddButton;
  final Function(Map<String, dynamic> product)? onAddTap;

  const HorizontalProductList({
    super.key,
    required this.title,
    required this.products,
    this.showPrice = true,
    this.showDeliveryTime = false,
    this.showAddButton = true,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Section Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // 🔹 Horizontal Scrollable Cards
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final product = products[index];
              return _productCard(context, product);
            },
          ),
        ),
      ],
    );
  }

  // ✅ Single Product Card
  Widget _productCard(BuildContext context, Map<String, dynamic> product) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                product["image"],
                height: 60.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),

            // 🏷 Product Name
            Text(
              product["name"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 4.h),

            // ✅ Delivery Time (optional)
            if (showDeliveryTime && product["deliveryTime"] != null)
              Text(
                "${product["deliveryTime"]} mins",
                style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
              ),

            const Spacer(),

            // ✅ Price + ADD Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showPrice)
                  Text(
                    "₹${product["price"]}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),

                if (showAddButton)
                  GestureDetector(
                    onTap: () => onAddTap?.call(product),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
}
