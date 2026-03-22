// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class SelectDeliveryLocationPage extends StatefulWidget {
//   const SelectDeliveryLocationPage({super.key});
//
//   @override
//   State<SelectDeliveryLocationPage> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<SelectDeliveryLocationPage> {
//   GoogleMapController? mapController;
//
//   final LatLng initialPosition =
//   const LatLng(19.1176, 72.9060); // Andheri East
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       /// 🔹 APP BAR + SEARCH
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 _topBar(),
//                 Expanded(child: _mapView()),
//               ],
//             ),
//
//             /// 🔹 BOTTOM SHEET
//             _bottomSheet(),
//
//             /// 🔹 SAVE BUTTON
//             _saveButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 TOP BAR
//   Widget _topBar() {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         children: [
//           Row(
//             children: const [
//               Icon(Icons.arrow_back),
//               SizedBox(width: 10),
//               Text(
//                 "Select delivery location",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: 12),
//
//           /// SEARCH
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.search, color: Colors.red),
//                 SizedBox(width: 8),
//                 Text(
//                   "Search for area, street name...",
//                   style: TextStyle(color: Colors.grey),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   /// 🔹 GOOGLE MAP
//   Widget _mapView() {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: initialPosition,
//         zoom: 14,
//       ),
//       onMapCreated: (controller) {
//         print("MAP CREATED");
//         mapController = controller;
//       },
//       myLocationEnabled: true,
//       myLocationButtonEnabled: true,
//     );
//   }
//
//   /// 🔹 DRAGGABLE BOTTOM SHEET
//   Widget _bottomSheet() {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.35,
//       minChildSize: 0.3,
//       maxChildSize: 0.7,
//       builder: (context, controller) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),
//           ),
//           child: SingleChildScrollView(
//             controller: controller,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 /// DRAG HANDLE
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 5,
//                     margin: const EdgeInsets.only(bottom: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//
//                 const Text(
//                   "Delivery details",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//
//                 /// ADDRESS CARD
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: const [
//                       Icon(Icons.location_on, color: Colors.red),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           "Mahakali Darshan, Gundavali Gaothan, Andheri East, Mumbai",
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Icon(Icons.arrow_forward_ios, size: 14)
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 /// ADDRESS FIELD
//                 _textField("Address details*"),
//
//                 const SizedBox(height: 6),
//                 const Text(
//                   "E.g. Floor, House no.",
//                   style: TextStyle(color: Colors.grey, fontSize: 12),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 const Text(
//                   "Receiver details for this address",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 _textField("Name"),
//                 const SizedBox(height: 10),
//                 _textField("Phone number"),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   /// 🔹 TEXT FIELD
//   Widget _textField(String hint) {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           hint,
//           style: const TextStyle(color: Colors.grey),
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 SAVE BUTTON
//   Widget _saveButton() {
//     return Positioned(
//       bottom: 10,
//       left: 16,
//       right: 16,
//       child: Container(
//         height: 55,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: const Center(
//           child: Text(
//             "Save address",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }