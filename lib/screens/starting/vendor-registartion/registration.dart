import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/provider.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/steps/congrats.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/steps/pass-info.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/steps/student-or-graduate.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/steps/user-information.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  static const id = '/registration';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل حساب جديد',
        onBack: stepperProvider.previousStep,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomParentContainer(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CustomStepper(
                        isActive: stepperProvider.currentStep == 0,
                        isCompleted: stepperProvider.currentStep > 0,
                      ),
                      SizedBox(width: 8.w),
                      CustomStepper(
                        isActive: stepperProvider.currentStep == 1,
                        isCompleted: stepperProvider.currentStep > 1,
                      ),
                      SizedBox(width: 8.w),

                      CustomStepper(
                        isActive: stepperProvider.currentStep == 2,
                        isCompleted: false,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0.h),
                    child: Divider(color: verticalDividerColor, thickness: 1.h),
                  ),
                ],
              ),

              IndexedStack(
                index: stepperProvider.currentStep,
                children: [
                  StudentOrGraduate(),
                  UserInformation(),
                  PassInformation(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DraggableButton(
        title: stepperProvider.currentStep == stepperProvider.stepTitles.length - 1
            ? 'سجّل'
            : 'التالي',
        onPressed: stepperProvider.currentStep ==
            stepperProvider.stepTitles.length - 1
            ? () async {
          try {
            // Call provider submit

            await stepperProvider.submitRegistration();

            // If success → navigate to Congrats screen
            Navigator.pushReplacementNamed(
              context,
              CongratulationsScreen.id,
            );
          } catch (e) {
            // Show error in SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  e.toString(),
                  textDirection: TextDirection.rtl,
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
            : stepperProvider.nextStep,
      ),

    );
  }
}
