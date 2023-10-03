import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:trucker/screen/friends_screen/contacts.dart';
// import 'package:trucker/screen/friends_screen/group_add.dart';
// import 'package:trucker/widgets/custom_widget/pop_menu_custom.dart';
// import 'package:trucker/widgets/custom_widget/pop_widget.dart';
import 'package:trucker_email_login/screens/sample_page.dart';

class CommunicationGroupsMute extends StatefulWidget {
  const CommunicationGroupsMute({super.key});

  @override
  State<CommunicationGroupsMute> createState() =>
      _CommunicationGroupsMuteState();
}

class _CommunicationGroupsMuteState extends State<CommunicationGroupsMute> {
  TextEditingController textEditingController = TextEditingController();
  String item1 = 'First item';
  String item2 = 'Second item';
  Offset? _tabPosition;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF2F4F7),
      child: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  width: 361,
                  height: 56,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(43),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.black,
                          textCapitalization: TextCapitalization.words,
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintText: 'Groups',
                            hintStyle: TextStyle(color: Color(0xFF475467)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SvgPicture.asset(
                      //         'assets/image/search.svg',
                      //         width: 18,
                      //         height: 18,
                      //         fit: BoxFit.scaleDown,
                      //       ),
                      //       const PopupMenuExample(),
                      //     ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 361.0,
                  height: 147.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0, // Move it to the right
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 66.0,
                                      maxHeight: 40.0,
                                    ),
                                    child: Align(
                                      alignment:
                                          Alignment.center, // Center alignment
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              43.846153259277344),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0, // Keep it on the left
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment
                                            .centerLeft, // Move to the left
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color:
                                                  Colors.white, // Border color
                                              width: 2, // Border width
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BFF',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      // color: Colors.grey.shade600,
                                      color: Color(0xFF475467),
                                    ),
                                  ),
                                  Text(
                                    '12 member',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF98A2B3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTapDown: (position) {
                              _tabPosition = position.globalPosition;
                              showPopupMenu(context, _tabPosition!);
                            },
                            child: const Icon(
                              Icons.more_vert,
                              size: 24.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0, // Move it to the right
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment
                                            .centerRight, // Move to the right
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color:
                                                  Colors.white, // Border color
                                              width: 2, // Border width
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
// The center image remains unchanged
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 66.0,
                                      maxHeight: 40.0,
                                    ),
                                    child: Align(
                                      alignment:
                                          Alignment.center, // Center alignment
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              43.846153259277344),
                                          border: Border.all(
                                            color: Colors.white, // Border color
                                            width: 2, // Border width
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0, // Keep it on the left
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment
                                            .centerLeft, // Move to the left
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color:
                                                  Colors.white, // Border color
                                              width: 2, // Border width
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Indian Truckers',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF475467),
                                    ),
                                  ),
                                  Text(
                                    '12 member',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF98A2B3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTapDown: (position) {
                              _tabPosition = position.globalPosition;
                              showPopupMenu(context, _tabPosition!);
                            },
                            child: const Icon(
                              Icons.more_vert,
                              size: 24.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0, // Move it to the right
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment
                                            .centerRight, // Move to the right
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color:
                                                  Colors.white, // Border color
                                              width: 2, // Border width
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 66.0,
                                      maxHeight: 40.0,
                                    ),
                                    child: Align(
                                      alignment:
                                          Alignment.center, // Center alignment
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              43.846153259277344),
                                          border: Border.all(
                                            color: Colors.white, // Border color
                                            width: 2, // Border width
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0, // Keep it on the left
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 66.0,
                                        maxHeight: 40.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment
                                            .centerLeft, // Move to the left
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                43.846153259277344),
                                            border: Border.all(
                                              color:
                                                  Colors.white, // Border color
                                              width: 2, // Border width
                                            ),
                                          ),
                                          child: const CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'American Truckers',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF475467),
                                    ),
                                  ),
                                  Text(
                                    '12 member',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF98A2B3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTapDown: (position) {
                              _tabPosition = position.globalPosition;
                              showPopupMenu(context, _tabPosition!);
                            },
                            child: const Icon(
                              Icons.more_vert,
                              size: 24.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width,
        position.dy + 12,
        52.0,
        0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      items: [
        PopupMenuItem(
          padding: const EdgeInsets.fromLTRB(12, 12, 40, 12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SamplePage(),
              ),
            );
          },
          child: Text(
            item1,
            style: const TextStyle(
              color: Color(0xFF475466),
              fontSize: 16,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.fromLTRB(12, 12, 40, 12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SamplePage(),
              ),
            );
          },
          child: Text(
            item2,
            style: const TextStyle(
              color: Color(0xFF475466),
              fontSize: 16,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
