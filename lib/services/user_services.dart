import 'dart:convert';
import 'package:blank_mobile/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class UserServices extends ChangeNotifier {
  List<Follow> followingArray = [];
  List<Follow> followerArray = [];
  final String _rpcUrl = 'HTTP://127.0.0.1:7545';
  final String _wsUrl = 'ws://127.0.0.1:7545';

  final String _privateKey =
      '4c00c599d865d86227679dda25e6db9da0e084fed835dae69a322e5161bfcb87';

  late Web3Client _web3client;

  UserServices() {
    init();
  }

  Future<void> init() async {
    _web3client = Web3Client(_rpcUrl, http.Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getABI();
    await getCredentials();
    await getDeployedContract();
  }

  late ContractAbi _contractAbi;
  // late EthereumAddress _contractAddress;
  late EthereumAddress _contractAddress;


  Future<void> getABI() async {
    String abiFile = await rootBundle.loadString('contracts/abi/User.json');
    var jsonABI = jsonDecode(abiFile);
    _contractAbi =
        ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'I dont know');
    _contractAddress =
        EthereumAddress.fromHex(jsonABI["networks"]["5777"]["address"]);
  }

  late EthPrivateKey _creds;
  Future<void> getCredentials() async {
    _creds = EthPrivateKey.fromHex(_privateKey);
  }

  late DeployedContract _deployedContract;
  late ContractFunction _follow;
  late ContractFunction _getFollowing;
  late ContractFunction _getFollowers;

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_contractAbi, _contractAddress);
    _follow = _deployedContract.function('follow');
    _getFollowing = _deployedContract.function('getFollowing');
    _getFollowers = _deployedContract.function('getFollowers');
    fetchFollowers();
  }

  Future<void> fetchFollowers() async {
    List FollowersList = await _web3client
        .call(contract: _deployedContract, function: _getFollowers, params: []);
    int followerLen = FollowersList[0].toInt();
    followerArray.clear();
    for (var i = 0; i < followerLen; i++) {
      var temp = await _web3client.call(
          contract: _deployedContract,
          function: _getFollowers,
          params: [BigInt.from(i)]);
      if (temp[1] != "") {
        followerArray.add(Follow(
          userName: (temp[0] as BigInt).toInt(),
          userAddress: (temp[1] as BigInt).toInt(),
        ));
      }
    }
    print(followerArray);
    notifyListeners();
  }
}
