/* README : this is a custom tab view with N no of tabs with N numbers of headers if you want
it provides List<List<Map<String, dynamic>>>  to populate the 
values of tabviews list 

*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/Custom_Widgets/customButton.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/themes/app_paddings.dart';

class Customtabviewwidget extends StatefulWidget {
  const Customtabviewwidget({
    super.key,
    required this.tabNames,
    required this.dataLists,
  });
  final List<String> tabNames;
  final List<List<Map<String, dynamic>>> dataLists;

  @override
  State<Customtabviewwidget> createState() => _CustomtabviewwidgetState();
}

class _CustomtabviewwidgetState extends State<Customtabviewwidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            labelColor: AppColors.textWhiteColor,
            indicator: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(10.sp),
            ),

            controller: _tabController,
            unselectedLabelColor: Colors.black,

            dividerColor: AppColors.buttonColor,
            labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(),
            labelPadding: AppPaddings.smallX,
            tabs: widget.tabNames.map((tabName) {
              return Tab(text: " $tabName ");
            }).toList(),
          ),
          AppSizes.tinyY,
          Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 234, 235, 1),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("S.no"),
                Text("Location Details"),
                Text("No. of Guards"),
                Text("Action"),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.dataLists.map((dataList) {
                return TabBarWidget(
                  itemCount: dataList.length,
                  items: dataList,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.itemCount, required this.items});
  final int itemCount;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          child: Row(
            children: [
              Container(
                height: 57.h,
                width: 53.w,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(109, 182, 254, 1),
                  borderRadius: BorderRadius.circular(22.sp),
                ),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 30.sp),
                  ),
                ),
              ),
              AppSizes.smallX,
              SizedBox(
                width: 160.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      item['id'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color.fromRGBO(0, 104, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 30.h, width: 1.5.w, color: Colors.teal),
              AppSizes.smallX,
              SizedBox(
                width: 20.w,
                child: Center(
                  child: Text(
                    "${item['guards']}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              AppSizes.smallX,
              Container(height: 30.h, width: 1.5.w, color: Colors.teal),
              Spacer(),
              Custombutton(
                width: 80.w,
                height: 24.h,
                text: "Attendance",
                textSize: 13,
                onTap: () {},
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
