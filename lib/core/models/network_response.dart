part of '../services/network_caller.dart';
class NetworkResponse {
  final bool isSuccessed;
  final int responseCode;
  final dynamic body;
  final String? errorMassage;

  NetworkResponse({
    required this.isSuccessed,
    required this.responseCode,
    this.body,
    this.errorMassage='Something went wrong',
  });
}