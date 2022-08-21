import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final animationsMap = {
  //   'containerOnPageLoadAnimation1': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(30, 0),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation2': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(50, 0),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation3': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(0, 30),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation4': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(0, 40),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation5': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(0, 30),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  //   'containerOnPageLoadAnimation6': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     hideBeforeAnimating: false,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: const Offset(0, 40),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: const Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  // };

  // @override
  // void initState() {
  //   super.initState();
  //   startPageLoadAnimations(
  //     animationsMap.values
  //         .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
  //     this,
  //   );
  //
  //   textController = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(); // Generated code for this Row Widget...
    //     Padding(
    //   padding: const EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     children: [
    //       Card(
    //         clipBehavior: Clip.antiAliasWithSaveLayer,
    //         color: Theme.of(context).primaryColor,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(40),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(40),
    //             child: Image.network(
    //               'https://images.unsplash.com/photo-1573496799652-408c2ac9fe98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    //               width: 40,
    //               height: 40,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               'John',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .labelMedium, // subtitle1 or subtitleLarge
    //             ),
    //             Text(
    //               'Hey John!',
    //               style: Theme.of(context).textTheme.bodyMedium, // bodyText2
    //             ),
    //           ],
    //         ),
    //       ),
    //       // Generated code for this Text Widget...
    //       Padding(
    //         padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
    //         child: Text(
    //           'Categories',
    //           style: Theme.of(context).textTheme.titleSmall, // title3
    //         ),
    //       ),
    //       // Generated code for this ListView Widget...
    //       ListView(
    //         primary: false,
    //         shrinkWrap: true,
    //         scrollDirection: Axis.horizontal,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             height: 20,
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).canvasColor, // secondaryColor
    //               borderRadius: const BorderRadius.only(
    //                 bottomLeft: Radius.circular(0),
    //                 bottomRight: Radius.circular(0),
    //                 topLeft: Radius.circular(12),
    //                 topRight: Radius.circular(12),
    //               ),
    //             ),
    //             child: Text(
    //               'Hello World',
    //               style: Theme.of(context).textTheme.bodyLarge, // bodyText1
    //             ),
    //           ).animated([animationsMap['containerOnPageLoadAnimation1']!]),
    //           Container(
    //             width: 230,
    //             height: 50,
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).canvasColor, // secondaryBackground
    //               boxShadow: [
    //                 const BoxShadow(
    //                   blurRadius: 4,
    //                   color: Color(0x34090F13),
    //                   offset: Offset(0, 2),
    //                 )
    //               ],
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Column(
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 Container(
    //                   height: 20,
    //                   decoration: BoxDecoration(
    //                     color: Theme.of(context).canvasColor, // tertiaryColor
    //                     borderRadius: const BorderRadius.only(
    //                       bottomLeft: Radius.circular(0),
    //                       bottomRight: Radius.circular(0),
    //                       topLeft: Radius.circular(12),
    //                       topRight: Radius.circular(12),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ).animated([animationsMap['containerOnPageLoadAnimation2']!]),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
