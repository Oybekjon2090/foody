import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/user_controller.dart';
import '../Auth/Splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: context.watch<UserController>().isLoading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(context.watch<UserController>().user?.name ?? ""),
                Text(context.watch<UserController>().user?.username ?? ""),
                Text(context.watch<UserController>().user?.phone ?? ""),
                Text(context.watch<UserController>().user?.email ?? ""),
                ElevatedButton(
                    onPressed: () {
                      context.read<UserController>().logOut(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const SplashPage()),
                            (route) => false);
                      });
                    },
                    child: const Text("Log out"))
              ],
            ),
    );
  }
}
