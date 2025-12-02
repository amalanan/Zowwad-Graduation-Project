import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../more & store management/more/widgets/alerts/alerts.dart';

class ChangePassScreen extends StatelessWidget {
  static const id = '/change-pass';

  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Change Password'),
      bottomNavigationBar: DraggableButton(
        title: 'Save Changes',
        onPressed: () => showPassChangedAlert(context),
      ),
      body: SafeArea(
        child: CustomParentContainer(
          children: [
            SizedBox(height: 16.h),
            CustomTextField(hint: 'Enter Password', label: 'Current Password'),
            SizedBox(height: 16.h),
            CustomTextField(hint: 'Enter Password', label: 'New Password'),
            SizedBox(height: 16.h),
            CustomTextField(
              hint: 'Enter Password',
              label: 'Confirm New Password',
            ),
            SizedBox(height: 250.h),
          ],
        ),
      ),
    );
  }
}
