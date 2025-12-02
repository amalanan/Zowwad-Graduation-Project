// import 'package:Zowwad/constants/constants.dart';
// import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
// import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
// import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/additional-note.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/alerts/alerts.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/customer-card.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/order-card.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/order-items-container.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/widgets/payment-card.dart';
// import 'package:Zowwad/screens/main/ui/screens/main_screen.dart';
// import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more-2/widgets/confirm-cancel-button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class PendingOrderDetailsScreen extends StatelessWidget {
//   static const id = '/order-details';

//   const PendingOrderDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Order Details'),

//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: CustomParentContainer(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 16.0.h),
//                 child: OrderCard(
//                   status: 'Pending',
//                   statusColor: pendingColor,
//                   orderId: '#12341',
//                   orderDate: '24 Mar 2025, 3:24 AM',
//                 ),
//               ),
//               CustomerDetailsCard(
//                 name: '',
//                 address: 'Alquds Street, Lorem Ipsum',
//                 imageUrl: person,
//                 onChatPressed: () {},
//               ),
//               SizedBox(height: 16.h),
//               AdditionalNoteCard(
//                 note:
//                     'Please call upon arrival and leave the package at the door. Thank you!',
//               ),
//               SizedBox(height: 16.h),

//               OrderItemList(),
//               SizedBox(height: 16.h),
//               PaymentCard(
//                 subtotal: '₪ 999.4',
//                 tax: '₪9384',
//                 fees: '₪99.3',
//                 discount: '₪0.00',
//               ),
//               SizedBox(height: 16.h),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: DraggableButton(
//         upperWidget: ConfirmCancelButton(
//           onCancelPressed: () => Navigator.pushNamed(context, MainScreen.id),
//           onPressed: () => showConfirmOrderAlert(context),
//         ),
//         title: 'Print Invoice',
//         icon: SvgPicture.asset(printerIcon, height: 24.h, width: 24.w),
//       ),
//     );
//   }
// }
