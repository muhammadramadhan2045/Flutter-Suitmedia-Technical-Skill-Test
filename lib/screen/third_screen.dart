import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/controller/user_controller.dart';
import 'package:suitmedia_test/model/user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ScrollController scrollController = ScrollController();
  List<User> _users = [];
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasNextPage = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadNextPage();
    }
  }

  Future<void> _loadUsers() async {
    if (_isFetching || !_hasNextPage) return;

    setState(() {
      _isFetching = true;
    });

    final url = 'https://reqres.in/api/users?page=$_currentPage&per_page=10';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      List<User> users = [];
      for (var userJson in jsonData['data']) {
        User user = User.fromJson(userJson);
        users.add(user);
      }

      setState(() {
        _users.addAll(users);
        _isFetching = false;
        _currentPage++;
        _hasNextPage = (_currentPage <= jsonData['total_pages']);
      });
    } else {
      setState(() {
        _isFetching = false;
      });
    }
  }

  Future<void> _loadNextPage() async {
    if (_isFetching || !_hasNextPage) return;
    await _loadUsers();
  }

  void _selectUser(User user) {
    Get.find<SelectedUserController>().setSelectedUserName(user.fullName);
  }

  Widget _buildUserItem(User user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text(
        user.fullName,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xff04021D),
        ),
      ),
      subtitle: Text(
        user.email,
        style: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          color: Color(0xff686777),
        ),
      ),
      onTap: () {
        _selectUser(user);
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Third Screen",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff04021D),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
      body: _users.isEmpty
          ? _isFetching
              ? const Center(child: CircularProgressIndicator())
              : const Center(child: Text('No users found.'))
          : RefreshIndicator(
              onRefresh: () async {
                _currentPage = 1;
                _users.clear();
                await _loadUsers();
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: _users.length + (_hasNextPage ? 1 : 0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  if (index < _users.length) {
                    return _buildUserItem(_users[index]);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: _isFetching
                            ? const CircularProgressIndicator()
                            : TextButton(
                                child: const Text('Load More'),
                                onPressed: () {
                                  _loadNextPage();
                                },
                              ),
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }
}
