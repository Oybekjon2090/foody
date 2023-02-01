import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';
import 'cached_network_image.dart';

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                height: 120.h,
                width: 380.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          offset: const Offset(0, 6),
                          color: const Color(0xff5A6CEA).withOpacity(0.08))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.horizontalSpace,
                    Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: context
                                    .watch<HomeController>()
                                    .listOfProduct[index]
                                    .image ==
                                null
                            ? const SizedBox.shrink()
                            : CustomImageNetwork(
                                image: context
                                        .watch<HomeController>()
                                        .listOfProduct[index]
                                        .image ??
                                    "",
                                height: 64.h,
                                width: 64.w,
                              )),
                    20.horizontalSpace,
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  context
                                          .watch<HomeController>()
                                          .listOfProduct[index]
                                          .name ??
                                      "",
                                      maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                  style: Style.textStyleRegular()),
                            ),
                            4.verticalSpace,
                            Text(
                                context
                                        .watch<HomeController>()
                                        .listOfProduct[index]
                                        .desc ??
                                    "",
                                    maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                style: Style.textStyleRegular2(
                                    size: 14, textColor: const Color(0xff858C94))),
                      
                                    Column(
                                      children: [
                                        Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            '\$${context.watch<HomeController>().listOfProduct[index].price.toString()}',
                                            style: Style.textStyleRegular(
                                                size: 20, textColor: Style.primaryColor)),
                                      ],
                                    )
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )));
  }
}
