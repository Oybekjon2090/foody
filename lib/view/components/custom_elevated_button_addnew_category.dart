import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import 'custom_textform.dart';

class CustomNewCategory extends StatefulWidget {
  const CustomNewCategory({super.key});

  @override
  State<CustomNewCategory> createState() => _CustomNewCategoryState();
}

class _CustomNewCategoryState extends State<CustomNewCategory> {
  final TextEditingController newCategoryTextEditController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: CustomTextFrom(
                    label: "New Category",
                    controller: newCategoryTextEditController,
                    hintext: '', onChange: (s) {  },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<ProductController>().addCategory(
                              name: newCategoryTextEditController.text
                                  .toLowerCase(),
                              onSuccess: () {
                                Navigator.pop(context);
                                context.read<ProductController>().getCategory();
                              }, image: '');
                        },
                        child: Text("Save"))
                  ],
                );
              });
        },
        child: Text("Add Category"));
    
  }
}