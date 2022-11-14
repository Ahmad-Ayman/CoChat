import 'package:cochat/modules/on_boarding/data/models/page_data.dart';
import 'package:cochat/modules/on_boarding/presentation/widgets/image_widget.dart';
import 'package:cochat/modules/on_boarding/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final PageData page;

  const PageWidget({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        ImageWidget(
          page: page,
          size: 190,
          iconSize: 170,
        ),
        space(8),
        TextWidget(
          page: page,
          style: TextStyle(
            fontSize: screenHeight * 0.046,
          ),
        ),
      ],
    );
  }
}
