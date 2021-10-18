import 'package:admin_panal_ui_responsive/controllers/recent_list_controller.dart';
import 'package:admin_panal_ui_responsive/models/RecentFile.dart';
import 'package:admin_panal_ui_responsive/models/Recent_Model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constant.dart';

class RecentFiles extends StatelessWidget {

  RecentListController controller=Get.put(RecentListController());

   RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: GetBuilder<RecentListController>(

        builder: (controllerRecentList) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Files",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              controllerRecentList.isLoading==false?const Center(child: CircularProgressIndicator()): SizedBox(
                width: double.infinity,
                child: DataTable2(
                  columnSpacing: defaultPadding,
                  minWidth: 600,
                  columns: const [
                    DataColumn(
                      label: Text("File Name"),
                    ),
                    DataColumn(
                      label: Text("Date"),
                    ),
                    DataColumn(
                      label: Text("Size"),
                    ),
                  ],
                  rows:  List.generate(
                    controllerRecentList.list.length,

                    // demoRececonntFiles.length,
                    (index) => recentFileDataRow(controllerRecentList.list[index]),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

DataRow recentFileDataRow(RecentModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/Figma_file.svg",
              height: 30,
              width: 30,
            ),
            Container(
              width: 130,
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title.toString(),overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.userId.toString())),
      DataCell(Text(fileInfo.completed.toString())),
    ],
  );
}
