// //part1-2
// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: Page()));

// class Page extends StatefulWidget {
//   const Page({super.key});

//   @override
//   State<Page> createState() => _MyPageState();
// }

// class _MyPageState extends State<Page> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stateful widget - Button")),
//       body: Center(
//         child: SizedBox(
//           width: 400,
//           height: 100,
//           child: ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 isSelected = !isSelected;
//               });
//             },
//             child: ColoredBox(
//               color: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
//               child: Center(
//                 child: Text(
//                   isSelected ? "Selected" : "Not Selected",
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




//part3
// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: Page()));

// class Page extends StatefulWidget {
//   const Page({super.key});

//   @override
//   State<Page> createState() => _MyPageState();
// }

// class _MyPageState extends State<Page> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stateful widget - Button")),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               width: 400,
//               height: 100,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isSelected = !isSelected;
//                   });
//                 },
//                 child: ColoredBox(
//                   color: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
//                   child: Center(
//                     child: Text(
//                       isSelected ? "Selected" : "Not Selected",
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 400,
//               height: 100,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isSelected = !isSelected;
//                   });
//                 },
//                 child: ColoredBox(
//                   color: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
//                   child: Center(
//                     child: Text(
//                       isSelected ? "Selected" : "Not Selected",
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(
//               width: 400,
//               height: 100,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isSelected = !isSelected;
//                   });
//                 },
//                 child: ColoredBox(
//                   color: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
//                   child: Center(
//                     child: Text(
//                       isSelected ? "Selected" : "Not Selected",
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(
//               width: 400,
//               height: 100,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isSelected = !isSelected;
//                   });
//                 },
//                 child: ColoredBox(
//                   color: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
//                   child: Center(
//                     child: Text(
//                       isSelected ? "Selected" : "Not Selected",
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







