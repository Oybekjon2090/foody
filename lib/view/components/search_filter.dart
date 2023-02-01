import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/product/product_page.dart';
import 'custom_textform.dart';

class SearchFilter extends StatelessWidget {
  SearchFilter({super.key});
  final TextEditingController homeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 45.h,
          width: 316.w,
          child: CustomTextFrom(
            prefixicon: Icon(Icons.search),
            hintext: '',
            controller: homeController,
            label: 'Search',
          ),
        ),
        Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: const Color(0xffF43F5E).withOpacity(0.1)),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => ProductListPage())));
                  },
                  icon: Icon(
                    Icons.filter_list,
                    color: Color(0xffF43F5E),
                  )),
            ))
      ],
    );
  }
}
