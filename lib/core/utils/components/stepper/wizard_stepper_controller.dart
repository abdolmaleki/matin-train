import 'package:flutter/cupertino.dart';

class WizardStepperController {
  final PageController pageController;
  WizardStepperController({required this.pageController});



  void nextPage(){
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void previousPage(){
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  int currentPageIndex(){
   return pageController.page!.round();
  }
}
