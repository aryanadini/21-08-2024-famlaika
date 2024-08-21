// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FatherFamilyTreePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Sample data
//     final String fatherImage = "assets/images/father.png"; // Replace with your image asset
//     final String fatherName = "John Doe";
//
//     final List<Map<String, String>> familyMembers = [
//       {"name": "Mother", "image": "assets/images/mother.png"},
//       {"name": "Sibling 1", "image": "assets/images/sibling1.png"},
//       {"name": "Sibling 2", "image": "assets/images/sibling2.png"},
//       {"name": "Spouse", "image": "assets/images/spouse.png"},
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$fatherName's Family Tree"),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0.w), // Adjust padding based on screen size
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Father's Profile
//             CircleAvatar(
//               radius: 50.r, // Responsive radius
//               backgroundImage: AssetImage(fatherImage),
//             ),
//             SizedBox(height: 8.h), // Responsive spacing
//             Text(
//               fatherName,
//               style: TextStyle(
//                 fontSize: 24.sp, // Responsive font size
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.h), // Responsive spacing
//
//             // Family Members
//             Expanded(
//               child: ListView.builder(
//                 itemCount: familyMembers.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(familyMembers[index]["image"]!),
//                     ),
//                     title: Text(
//                       familyMembers[index]["name"]!,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.edit, color: Colors.white),
//                       onPressed: () {
//                         // Handle edit action
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.black, // Background color
//     );
//   }
// }
import 'package:flutter/cupertino.dart';

class FatherFamilyTreePage extends StatefulWidget {
  const FatherFamilyTreePage({super.key});

  @override
  State<FatherFamilyTreePage> createState() => _FatherFamilyTreePageState();
}

class _FatherFamilyTreePageState extends State<FatherFamilyTreePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
