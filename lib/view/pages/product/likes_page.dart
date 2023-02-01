import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../components/cached_network_image.dart';
import '../../style/style.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
   @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().getProduct(isLimit: false);
      context.read<HomeController>().getCategory(isLimit: false);
      context.read<HomeController>()
        ..getProduct(isLimit: false)
        ..getCategory(isLimit: false)
        ..getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return Scaffold(
      appBar: AppBar(title: Text("Likes")),
      body: Column(children: [
         state.setFilter || (state.selectIndex == -1)
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(24),
                    
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child:
                      Text(state.listOfCategory[state.selectIndex].name ?? ""),
                ),
          Expanded(
            child: state.setFilter
                ? Wrap(
                    children: [
                      for (int i = 0; i < state.listOfCategory.length; i++)
                        InkWell(
                          onTap: () {
                            event.changeIndex(i);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: state.selectIndex == i
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.pinkAccent),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            child: Text(state.listOfCategory[i].name ?? ""),
                          ),
                        )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        context.watch<HomeController>().listOfProduct.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        height: 120.h,
                        width: 380.w,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  offset: const Offset(0, 6),
                                  color:
                                      const Color(0xff5A6CEA).withOpacity(0.08))
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            12.horizontalSpace,
                            state.listOfProduct[index].image == null
                                ? const SizedBox.shrink()
                                : CustomImageNetwork(
                                    image:
                                        state.listOfProduct[index].image ?? "",
                                    height: 90.h,
                                    width: 80.w,
                                  ),
                            20.horizontalSpace,
                            Expanded(
                            
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                          state.listOfProduct[index].name ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Style.textStyleRegular()),
                                    ),
                                    4.verticalSpace,
                                    Text(state.listOfProduct[index].desc ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Style.textStyleRegular2(
                                            size: 14,
                                            textColor:
                                                const Color(0xff858C94))),
                                    Column(
                                      children: [
                                        Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            '\$${state.listOfProduct[index].price.toString()}',
                                            style: Style.textStyleRegular(
                                                size: 20,
                                                textColor: Style.primaryColor)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                            onPressed: () {
                              event.changeLike(index);
                            },
                            icon: (state.listOfProduct[index].isLike)
                                ? Icon(Icons.favorite,color: Colors.pink,)
                                : Icon(Icons.favorite_border))
                          ],
                        ),
                      );
                    }),
          )

      ]),
    );
  }
}