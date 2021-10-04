import 'package:flutter/material.dart';
import 'package:learning_management/View/Widgets/bordered_container.dart';
import 'package:learning_management/View/Widgets/text.dart';
import 'package:learning_management/constants.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarInClasses(size: size),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: BigText(text: 'Classes'),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.redish,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SmallText(
                        text: '+ New Class',
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            /// Classes by or taken
            Container(
              height: size.height * 0.75,
              child: ListView.builder(
                /// Number of classes
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06,
                        vertical: size.height * 0.01,
                      ),
                      child: BorderedContainer(
                        child: Center(
                          child: MediumText(text: 'SPM $index'),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('class $index');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppbarInClasses extends StatelessWidget {
  const AppbarInClasses({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                // size: 32,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.menu,

                // size: 32,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
