// import 'dart:async';
// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_widgets/Custom_Widgets/customAppBar.dart';
// import 'package:flutter_widgets/app_setup/core/extensions/routes_extenstion.dart';
// import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
// import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
// import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';
// import 'package:provider/provider.dart';

// class RestaurantDetailScreen extends StatefulWidget {
//   RestaurantDetailScreen({super.key,});


//   @override
//   State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
// }

// // shifting
// final List<GlobalKey> keys = [
//   GlobalKey(),
//   GlobalKey(),
//   GlobalKey(),
// ];

// late ScrollController scrollController;
// BuildContext? tabcontext;
// void animateToTab() {
//   // Get the current scroll position
//   final scrollPosition = scrollController.offset;

//   // Calculate the positions of each section
//   final List<double> positions = [];
//   for (var i = 0; i < keys.length; i++) {
//     if (keys[i].currentContext == null) continue;
//     final box = keys[i].currentContext!.findRenderObject() as RenderBox;
//     final position = box.localToGlobal(Offset.zero).dy;
//     positions.add(position);
//   }

//   // Determine which tab should be active
//   int activeIndex = 0;
//   for (var i = 0; i < positions.length; i++) {
//     // Add some threshold (e.g., 50 pixels) before switching to the next tab
//     if (scrollPosition >= positions[i] - 50) {
//       activeIndex = i;
//     } else {
//       break;
//     }
//   }

//   // Only animate if we're not already on the correct tab
//   if (DefaultTabController.of(tabcontext!).index != activeIndex) {
//     DefaultTabController.of(tabcontext!).animateTo(
//       activeIndex,
//       duration: const Duration(milliseconds: 100),
//     );
//   }
// }

// Future<void> scrollToIndex(int index) async {
//   scrollController.removeListener(animateToTab);
//   final tab = keys[index].currentContext!;
//   await Scrollable.ensureVisible(tab,
//       duration: const Duration(milliseconds: 500));

//   scrollController.addListener(animateToTab);
// }

// class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
//   late final Debouncer _debouncer;
//   late VoidCallback _scrollListener;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the debouncer with 100ms delay
//     _debouncer = Debouncer(milliseconds: 100);

//     // Create the scroll listener that uses the debouncer
//     _scrollListener = () {
//       _debouncer.run(() => animateToTab());
//     };

//     // Initialize scroll controller and add listener
//     scrollController = ScrollController();
//     scrollController.addListener(_scrollListener);


//   }

//   @override
//   void dispose() {
//     // Remove listener and dispose controller
//     scrollController.removeListener(_scrollListener);
//     scrollController.dispose();

//     // Cancel any pending debouncer timers
//     _debouncer._timer?.cancel();

//     super.dispose();
//   }



//   @override
//   Widget build(BuildContext context) {

//     return 
// DefaultTabController(
//           length: 3,
//           child: Scaffold(
//             appBar: PreferredSize(
//                 preferredSize: const Size.fromHeight(50),
//                 child: CustomAppBar(actions: [
//                   SvgPicture.asset(
//                     "assets/profile/Info Circle.svg",
//                     height: 22.h,
//                     width: 22.w,
//                     // colorFilter: const ColorFilter.mode(
//                     //     AppColors.textBlackColor, BlendMode.srcIn),
//                   ),
//                   AppSizes.smallX,
//                   SvgPicture.asset(
//                     "assets/home/favorite.svg",
//                     height: 22.h,
//                     width: 22.w,
//                     colorFilter: const ColorFilter.mode(
//                         AppColors.textBlackColor, BlendMode.srcIn),
//                   ),
//                   AppSizes.smallX,
//                   SvgPicture.asset(
//                     "assets/profile/share.svg",
//                     height: 22.h,
//                     width: 22.w,
//                     colorFilter: const ColorFilter.mode(
//                         AppColors.textBlackColor, BlendMode.srcIn),
//                   ),
//                   AppSizes.smallX,
//                 ], onPressed: () => context.pop())),
//             body: Container(
//               width: context.wid,
//               height: context.hei,
//               padding: AppPaddings.normal,
//               child: Builder(builder: (context) {
//                 tabcontext = context;
//                 return CustomScrollView(
//                   controller: scrollController,
//                   slivers: [
               
                    
//                       SliverToBoxAdapter(
//                       ),
         
                    
//                       SliverPersistentHeader(
//                         pinned: true,
//                         delegate: _TabBarDelegate(TabBar(
//                           indicator: const BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Colors.black,
//                                 width: 3.0,
//                               ),
//                             ),
//                           ),
//                           labelColor: Colors.black,
//                           unselectedLabelColor: Colors.grey,
//                           onTap: (int index) => scrollToIndex(index),
//                           tabs: [
//                             Tab(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Expanded(
//                                     child: SvgPicture.asset(
//                                       'assets/home/offers.svg',
//                                     ),
//                                   ),
//                                   // Adds spacing between icon and text
//                                   const Text("offers for you"),
//                                 ],
//                               ),
//                             ),
//                             const Tab(text: 'Popular'),
//                             const Tab(text: 'Celebration Deals'),
//                           ],
//                         )),
//                       ),
//                       SliverToBoxAdapter(
//                         child: AppSizes.smallY,
//                       ),
//                       SliverToBoxAdapter(
//                           child: buildGridTitle(context, "offers for you", 0)),
//                       SliverToBoxAdapter(
//                           child:
//                               buildItemGrid(context,[])),
//                       SliverToBoxAdapter(
//                           child: buildGridTitle(context, "Popular", 1)),
//                       SliverToBoxAdapter(
//                           child:
//                               buildItemGrid(context, [])),
//                       SliverToBoxAdapter(
//                           child:
//                               buildGridTitle(context, "Celebration Deals", 2)),
//                       SliverToBoxAdapter(
//                           child:
//                               buildItemGrid(context, homeProvider.menuItems)),
//                     ],
//                   ],
//                 );
//               }),
//             ),
//           ),
//         );
//   }
// }

// class CustomButton {
// }

// Widget buildGridTitle(BuildContext context, String title, int index) {
//   return Padding(
//     key: keys[index],
//     padding: AppPaddings.tinyY,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                   color: AppColors.textBlackColor,
//                 )),
//         const Divider(
//           thickness: 2,
//         ),
//       ],
//     ),
//   );
// }

// Widget buildItemGrid(BuildContext context, {required List items  }) {
//   return GridView.builder(
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       childAspectRatio: MediaQuery.of(context).size.width /
//           (MediaQuery.of(context).size.height * 0.7),
//       crossAxisCount: 2,
//     ),
//     itemCount: items.length,

//     itemBuilder: (context, index) {
//       return Card();
//     },
//   );
// }

// class _TabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar _tabBar;

//   _TabBarDelegate(this._tabBar);

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: _tabBar,
//     );
//   }

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
// }

// // Debouncer class
// class Debouncer {
//   final int milliseconds;
//   Timer? _timer;

//   Debouncer({required this.milliseconds});

//   void run(VoidCallback action) {
//     _timer?.cancel();
//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }
