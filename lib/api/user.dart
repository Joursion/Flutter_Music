//用户接口
import 'dart:async';
import 'fetch.dart';

import 'package:dio/dio.dart';

// 用户-获取信息
Future<Response> getUserInfo(String uid) => fetch.request('/user/detail', params: {'uid': uid});

// 用户-邮箱登录
Future<Response> loginByEmail(String email, String password) => 
  fetch.request('post /login', params: {'email': email, 'password': password});

// 用户-获取用户歌单
Future<Response> getUserPlayList(String uid) => fetch.request('/user/playlist', params: {'uid': uid});