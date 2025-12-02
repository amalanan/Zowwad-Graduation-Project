import 'dart:ui';

import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../confirm-cancel-button.dart';

void showDatePickerDialog(
  BuildContext context,
  TextEditingController dateController,
) {
  DateTime selectedDay = DateTime.now();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder:
            (context, setState) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),

              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),

                content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TableCalendar(
                          firstDay: DateTime(1900),
                          lastDay: DateTime(2026),
                          focusedDay: selectedDay,
                          selectedDayPredicate: (day) {
                            return isSameDay(selectedDay, day);
                          },
                          headerStyle: HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            leftChevronIcon: Icon(
                              CupertinoIcons.left_chevron,
                              size: 16.sp,
                              color: titleColor,
                            ),
                            rightChevronIcon: Icon(
                              CupertinoIcons.right_chevron,
                              size: 16.sp,
                              color: titleColor,
                            ),
                            titleTextStyle: TextStyle(
                              color: blackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(
                              color: calendarColor,
                              fontSize: 12.sp,
                            ),
                            weekendStyle: TextStyle(
                              color: calendarColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: TextStyle(
                              fontSize: 16.sp,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            outsideTextStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              selectedDay = selectedDay;
                            });
                            dateController.text =
                                "${selectedDay.toLocal()}".split(' ')[0];
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ConfirmCancelButton(
                    onCancelPressed: () {},
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
      );
    },
  );
}
