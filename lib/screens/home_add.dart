import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdd extends StatelessWidget {
  const HomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leadingWidth: 75,
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Cancle',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        title: const Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: const Center(
                child: Icon(
                  Icons.photo,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.photo_camera,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  isCollapsed: true,
                  label: Text(
                    'Product Name',
                    style: TextStyle(
                      color: Color.fromARGB(255, 75, 113, 179),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 111, 197),
                      width: 2.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  label: Text(
                    'Price',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 136, 194),
                      fontSize: 17,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(189, 189, 189, 0.5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  label: Text(
                    'Description',
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 136, 194),
                      fontSize: 17,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(189, 189, 189, 0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
