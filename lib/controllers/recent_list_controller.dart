

import 'dart:convert';

import 'package:admin_panal_ui_responsive/models/Recent_Model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecentListController extends GetxController{




  final List<RecentModel> list=<RecentModel>[].obs;
  final List<RecentModel> newList=<RecentModel>[].obs;

  var isLoading=false;

  setLoadingFalse()
  {
    isLoading=false;
    update();

  }
  setLoadingTrue(){
    isLoading=true;
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRecentListData();

  }

  void fetchRecentListData() async{

    final url="https://jsonplaceholder.typicode.com/todos";
    final response= await http.get(Uri.parse(url));

    var result=jsonDecode(response.body);
    Iterable l = json.decode(response.body);
    List<RecentModel> posts =
    List<RecentModel>.from(l.map((model) => RecentModel.fromJson(model)));
    list.clear();
    list.addAll(posts);
    

    setLoadingTrue();
    update();

  }


}