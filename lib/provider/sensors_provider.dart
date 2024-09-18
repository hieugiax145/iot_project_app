import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iot_app/model/action_model.dart';
import 'package:iot_app/network/api_base/api_response.dart';
import 'package:iot_app/network/api_request.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/sensors_data_model.dart';

class SensorsProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SensorsDataModel _latest = SensorsDataModel();
  SensorsDataModel _latest2 = SensorsDataModel();
  List<SensorsDataModel> _list = [];
  List<SensorsDataModel> _listRealtime = [];

  late final IO.Socket socket;

  SensorsDataModel get latest => _latest;
  SensorsDataModel get latest2 => _latest2;
  List<SensorsDataModel> get list => _list;
  List<SensorsDataModel> get listRealtime => _listRealtime;

  List<ActionModel> _actions = [];
  List<ActionModel> get actions => _actions;

  int totalItem = 0;
  int _currentPage = 1;
  final int _size = 10;

  int get totalPage => (totalItem / _size).ceil();
  int get size => _size;

  get currentPage => _currentPage;

  SensorsProvider() {
    socket = IO.io('http://192.168.88.108:3000',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print("connected");
      getNewData();
    });
  }

  getNewData() {
    socket.on('latestData', (data) {
      print(data);
      _latest2 = SensorsDataModel.fromJson(data);
      if (_listRealtime.length == 6) {
        _listRealtime.removeAt(0);
      }
      _listRealtime.add(_latest2);
      notifyListeners();
    });
  }

  listRemove(int index) {
    _listRealtime.removeAt(index);
    notifyListeners();
  }

  Future<void> getLatest() async {
    await ApiRequest.getLatestData().then((res) {
      if (res.message == "Success") {
        final data = SensorsDataModel.fromJson(res.data);
        _latest = data;
        notifyListeners();
      }
    });
  }

  Query query = Query();
  resetQuery() {
    query = Query();
    // notifyListeners();
  }

  setPage(int? page) {
    query.page = page;
    // notifyListeners();
  }

  pageSensorsChange(int page) {
    _currentPage = page;
    setPage(page);
    getSensorsData();
  }

  firstSensorsData() {
    resetQuery();
    pageSensorsChange(1);
  }

  Future<void> getSensorsData() async {
    loading = true;
    await ApiRequest.getSensorsData(
            page: query.page ?? _currentPage,
            limit: query.limit ?? _size,
            order: query.order)
        .then((res) {
      if (res.message == "Success") {
        final List<SensorsDataModel> list = res.data
            .map<SensorsDataModel>((e) => SensorsDataModel.fromJson(e))
            .toList();
        _list
          ..clear()
          ..addAll(list);
        totalItem = res.totalCount!;
        notifyListeners();
      }
    }).whenComplete(() => loading = false);
  }

  int _totalActivity = 0;
  int get totalActivity => _totalActivity;
  int get totalActivityPage => (_totalActivity / _size).ceil();

  pageActivityChange(int page) {
    _currentPage = page;
    setPage(page);
    getActionData();
  }

  firstActivityData() {
    resetQuery();
    pageActivityChange(1);
  }

  Future<void> getActionData() async {
    loading = true;
    await ApiRequest.getActionData(
            page: query.page ?? _currentPage,
            limit: query.limit ?? _size,
            order: query.order)
        .then((res) {
      if (res.message == "Success") {
        final List<ActionModel> list =
            res.data.map<ActionModel>((e) => ActionModel.fromJson(e)).toList();
        _actions
          ..clear()
          ..addAll(list);
        _totalActivity = res.totalCount!;
        notifyListeners();
      }
    }).whenComplete(() => loading = false);
  }
}

class Query {
  int? page = 1;
  int? limit = 10;
  String? order;

  Query({this.page, this.limit, this.order = "DESC"});
}
