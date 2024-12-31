import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_header_text.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter_application_1/features/home/presentation/views/detail_view.dart';

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
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalCharacters),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HistoricalCharacters(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalSouvenirs),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HistoricalSouvenirs(),
            ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(
          text: "Ancient Egypt",
          image: Assets.imagesFrame,
        ),
        HistoricalPeriodItem(
          text: "Islamic Era",
          image: Assets.imagesFrame2,
        ),
      ],
    );
  }
}

class HistoricalPeriodItem extends StatelessWidget {
  final String text;
  final String image;

  const HistoricalPeriodItem({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(itemName: text),
          ),
        );
      },
      child: Container(
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
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CustomTextStyles.poppins500style18.copyWith(fontSize: 16, color: AppColors.deebBrown),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 64,
              width: 47,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class HistoricalCharacters extends StatelessWidget {
  const HistoricalCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalCharacterItem(name: AppStrings.person1, image: Assets.imagesFrame3),
        HistoricalCharacterItem(name: AppStrings.person2, image: Assets.imagesPerson2),
        HistoricalCharacterItem(name: AppStrings.person3, image: Assets.imagesPerson3),
        HistoricalCharacterItem(name: AppStrings.person4, image: Assets.imagesPerson4),
      ],
    );
  }
}

class HistoricalCharacterItem extends StatelessWidget {
  final String name;
  final String image;

  const HistoricalCharacterItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(itemName: name),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 223, 223),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: AppColors.deepGrey, blurRadius: 10, offset: const Offset(0, 7))],
        ),
        width: 80,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18.copyWith(fontSize: 14, color: AppColors.deebBrown),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoricalSouvenirs extends StatelessWidget {
  const HistoricalSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalSouvenirItem(name: AppStrings.souvenir1, image: Assets.imagesItem1),
        HistoricalSouvenirItem(name: AppStrings.souvenir2, image: Assets.imagesItem2),
        HistoricalSouvenirItem(name: AppStrings.souvenir3, image: Assets.imagesItem3),
        HistoricalSouvenirItem(name: AppStrings.souvenir4, image: Assets.imagesItem4),
      ],
    );
  }
}

class HistoricalSouvenirItem extends StatelessWidget {
  final String name;
  final String image;

  const HistoricalSouvenirItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(itemName: name),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 223, 223),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: AppColors.deepGrey, blurRadius: 10, offset: const Offset(0, 7))],
        ),
        width: 80,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18.copyWith(fontSize: 14, color: AppColors.deebBrown),
            ),
          ],
        ),
      ),
    );
  }
}