import 'package:cochat/modules/on_boarding/data/models/page_data.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/components/app_colors.dart';

class OnBoardingHelper {
  static final pages = [
    PageData(
      icon: Icons.bubble_chart,
      title: "Intro 1",
      textColor: AppColors.mainColor1,
      bgColor: AppColors.mainColor3,
    ),
    PageData(
      icon: Icons.format_size,
      title: "Intro 2",
      textColor: AppColors.mainColor3,
      bgColor: AppColors.mainColor1,
    ),
    PageData(
      icon: Icons.hdr_weak,
      title: "Intro 3",
      textColor: AppColors.mainColor1,
      bgColor: AppColors.mainColor3,
    ),
    PageData(
      icon: Icons.hdr_weak,
      title: "Intro 3",
      textColor: AppColors.mainColor3,
      bgColor: AppColors.mainColor1,
    ),
  ];
}
