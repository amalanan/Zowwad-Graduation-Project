// import 'package:Zowwad/constants/constants.dart';
// import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
// import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
// import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/confirmed-order-details/widgets/alerts/alerts.dart';
// import 'package:Zowwad/screens/home%20&%20wallet/confirmed-order-details/widgets/cook-button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../pending-order-details/widgets/customer-card.dart';
// import '../pending-order-details/widgets/order-card.dart';
// import '../pending-order-details/widgets/order-items-container.dart';
// import '../pending-order-details/widgets/payment-card.dart';

// class ConfirmedOrderDetailsScreen extends StatelessWidget {
//   static const id = '/conf-order-details';

//   const ConfirmedOrderDetailsScreen({super.key});

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
//                   status: 'Confirmed',
//                   statusColor: pendingColor,
//                   orderId: '#12341',
//                   orderDate: '24 Mar 2025, 3:24 AM',
//                 ),
//               ),
//               CustomerDetailsCard(
//                 name: '',
//                 address: '',
//                 imageUrl: person,
//                 onChatPressed: () {},
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
//         upperWidget: FadedButton(
//           title: 'Cook',
//           onPressed: () => showCookInfoAlert(context),
//         ),
//         title: 'Print Invoice',
//         icon: SvgPicture.asset(printerIcon, height: 24.h, width: 24.w),
//       ),
//     );
//   }
// }
