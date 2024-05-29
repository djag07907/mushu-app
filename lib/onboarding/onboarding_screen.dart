import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mushu_app/resources/styles.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      swipeableBody: [
        // 1) Manage Pets
        Center(
          child: Container(
            color: lightBlue,
            // Add pet management UI elements here
            child: Lottie.asset('assets/animations/paw_loading.json'),
          ),
        ),
        // 2) Medical Records
        Center(
          child: Container(
            color: Colors.amber,
            // Add medical records UI elements here
            child: Lottie.asset('assets/animations/paw_loading.json'),
          ),
        ),
        // 3) Create Profile
        Center(
          child: Container(
            color: Colors.black12,
            // Add profile creation UI elements here
            child: Lottie.asset('assets/animations/paw_loading.json'),
          ),
        ),
        // 4) List of Vet Clinics and Recommended Food
        Center(
          child: Container(
            color: Colors.blueGrey,
            // Add vet clinics and recommended food UI elements here
            child: Lottie.asset('assets/animations/paw_loading.json'),
          ),
        ),
      ],
      startIndex: 0,
      onPageChanges:
          (netDragDistance, pagesLength, currentIndex, slideDirection) {
        // Handle page change logic here
      },
      buildHeader: (context, netDragDistance, pagesLength, currentIndex,
          setIndex, slideDirection) {
        return Container();
        // Build header UI elements here
      },
      buildFooter: (context, netDragDistance, pagesLength, currentIndex,
          setIndex, slideDirection) {
        return Container();
        // Build footer UI elements here
      },
      animationInMilliseconds: 500, // Example animation speed
    );
  }
}
