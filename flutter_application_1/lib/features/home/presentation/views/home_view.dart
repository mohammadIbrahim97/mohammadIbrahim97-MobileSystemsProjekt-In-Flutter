
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_header_text.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 28)),
            SliverToBoxAdapter(
              child: CustomHomeViewAppBar(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalPeriods),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HistoricalPeriods(),
            )
          ],
        ),
      ),
    );
  }
}


class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(),
        HistoricalPeriodItem(),
      ],
    );
  }
}

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 223, 223),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: AppColors.deepGrey, blurRadius: 10, offset: const Offset(0, 7))],
      ),
      width: 164,
      height: 96,
      child: Row(
        children: [
          const SizedBox(width: 16),
          SizedBox(
            height: 48,
            width: 64,
            child: Text(
              "Ancient Egypt",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: CustomTextStyles.poppins500style18.copyWith( fontSize: 16, color: AppColors.deebBrown),
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesFrame,
                )
              )
            ),
          ),
          const SizedBox(width: 16),     
        ],
      ),
    );
  }
}
