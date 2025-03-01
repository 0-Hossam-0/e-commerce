import 'package:flutter/material.dart';
import 'package:project/ui/Public_Widgets/input_field.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool isDisabled;
  final bool isOnChange;
  final TextEditingController controller;
  final Function()? onTapFunction;
  const AppBarWidget(
      {super.key,
      this.isDisabled = false,
      this.onTapFunction,
      required this.controller,
      this.isOnChange = false});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InputField(
        placeholder: 'Search...',
        isOnChange: widget.isOnChange,
        prefixIcon: const Icon(Icons.search),
        isSecured: false,
        isDisabled: widget.isDisabled,
        onTapFunction: widget.onTapFunction,
        width: 100,
        controller: widget.controller,
      ),
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 3),
        ),
      ],
    );
  }
}




// InputField(
//             placeholder: 'Search...',
//             prefixIcon: const Icon(Icons.search),
//             isSecured: false,
//             width: 100,
//             height: 5,
//             controller: _searchController,
//           ),


//  return AppBar(
//       title: GestureDetector(
//         onTap: () {},
//         child: Container(
//           width: 100.w,
//           decoration: BoxDecoration(
//               color: Color(0xFFeeebeb),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.blue)),
//           height: 40,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 SizedBox(width: 13),
//                 Icon(
//                   Icons.search,
//                   color: Color(0xFF828282),
//                 ),
//                 SizedBox(width: 25),
//                 Text(
//                   'Search...',
//                   style: TextStyle(
//                     color: Color(0xFF828282),
//                     fontSize: 17,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       actions: [
//         Container(
//           margin: const EdgeInsets.only(top: 3),
//         ),
//       ],
//     );