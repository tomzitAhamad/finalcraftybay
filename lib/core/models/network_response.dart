part of '../services/network_caller.dart';
class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String? errorMassage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMassage='Something went wrong',
  });
}