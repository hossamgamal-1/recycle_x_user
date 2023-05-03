import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recyclex/business_logic/cubit/home_page/home_page_cubit.dart';
import 'package:recyclex/presentation/resources/color_manager.dart';
import 'package:recyclex/presentation/resources/text_style_manager.dart';

import '../../model/points.dart';
import '../../model/user.dart';
import '../widgets/home_page/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.user, {super.key});
  final User user;
  @override
  Widget build(BuildContext context) {
    int total = user.points.plastic +
        user.points.metal +
        user.points.organicMaterials +
        user.points.paperAndCarton;

    List<Widget> getUserTile() {
      return [
        Text('الاسم : ${user.name}'),
        Text('الرقم القومي : ${user.id}'),
        Text('العنوان : ${user.address}'),
        SizedBox(
          width: 5.w,
          child: const Divider(color: ColorManager.darkGrey),
        ),
        const Text('النقاط'),
        Text('بلاستيك : ${user.points.plastic}'),
        Text('ورق وكارتون : ${user.points.paperAndCarton}'),
        Text('معدن وصفيح : ${user.points.metal}'),
        Text('مواد عضوية : ${user.points.organicMaterials}'),
        Text('الإجمالي : $total'),
      ];
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => HomePageCubit(),
        child: Scaffold(
          appBar: AppBar(leading: const Icon(Icons.person)),
          body: DefaultTextStyle(
            style: getMediumStyle(fontSize: 26)
                .copyWith(overflow: TextOverflow.clip),
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...getUserTile(),
                    TextButton(onPressed: () {}, child: const Text('add')),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: const HomePageNavBar(),
          endDrawer: const Drawer(),
        ),
      ),
    );
  }
}

User user = (User(
    '30202260200271', 'حسام جمال', 'خلف ابو كيمو', Points(10, 12, 8, 13)));
