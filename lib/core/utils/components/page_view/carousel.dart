import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/images/rounded_image.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomCarousel extends StatelessWidget {
  CustomCarousel({super.key, required this.urls});

  final PageController _pageController = PageController();
  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width * 0.55;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(child: SizedBox()),
        GestureDetector(
            onTap: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
            child: SizedBox(width: 28, height: 28, child: AppIcon.arrowBack)),
        const SizedBox(width: 10),
        SizedBox(
          height: imageWidth / 2,
          width: imageWidth,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: urls.length,
              itemBuilder: (context, index) =>
                  _isImageAttachment(_getFileExtension(urls[index]))
                      ? CustomRoundedImage(
                          imageProvider: NetworkImage(urls[index]),
                          width: imageWidth,
                          height: imageWidth / 2,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : Container(
                          width: imageWidth,
                          height: imageWidth / 2,
                          decoration: BoxDecoration(
                              color: AppColors.primaryLighter,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(child: Text(_getFileExtension(urls[index]),style: Theme.of(context).textTheme.titleLarge,)),
                        )),
        ),
        const SizedBox(width: 10),
        GestureDetector(
            onTap: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
            child:
                SizedBox(width: 28, height: 28, child: AppIcon.arrowForward)),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  String _getFileExtension(String url) {
    try {
      List<String> splitPath = url.split('/');
      String extension = splitPath[splitPath.length - 1].split(".")[1];
      return extension.toUpperCase();
    } catch (e) {
      return "image";
    }
  }

  bool _isImageAttachment(String fileExtension) {
    return fileExtension.toLowerCase() == "jpg" ||
        fileExtension.toLowerCase() == "png" ||
        fileExtension.toLowerCase() == "image" ||
        fileExtension.toLowerCase() == "webp";
  }
}
