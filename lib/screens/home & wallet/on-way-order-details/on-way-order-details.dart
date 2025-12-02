// import 'package:Zowwad/constants/constants.dart';
// import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
// import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../pending-order-details/widgets/customer-card.dart';
// import '../pending-order-details/widgets/order-card.dart';
// import '../pending-order-details/widgets/order-items-container.dart';
// import '../pending-order-details/widgets/payment-card.dart';

// class OnWayOrderDetailsScreen extends StatelessWidget {
//   static const id = '/on-way-order-details';

//   const OnWayOrderDetailsScreen({super.key});

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
//                   status: 'On The Way',
//                   statusColor: deepGreenColor,
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

//               OrderItemList(),
//               SizedBox(height: 16.h),
//               PaymentCard(
//                 hasTotal: true,
//                 subtotal: '₪ 999.4',
//                 tax: '₪9384',
//                 fees: '₪99.3',
//                 discount: '₪0.00',
//                 total: '₪10.5',
//               ),
//               SizedBox(height: 16.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
