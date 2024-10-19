import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';

class ObBoardingWidgetBody extends StatelessWidget{
  ObBoardingWidgetBody ({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        itemCount: onBoardingData.length,
        // ignore: non_constant_identifier_names
        itemBuilder: (context, Index){
          return Column(
            children: [
                Container(
                  height: 290,
                  width: 343,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        onBoardingData[Index].imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: _controller),
              const SizedBox(height: 32),
              Text(
                onBoardingData[Index].title,
                style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
              Text(
                onBoardingData[Index].subtitle,
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                maxLines: 2,
                ),
            ],
          );
        }
      ),
    );
  }
}
