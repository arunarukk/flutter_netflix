import 'package:flutter/material.dart';
import 'package:netflix_tmdb/data/data_controller.dart';

Future<void> showCatagoriesDialog(BuildContext context, String title) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        bool isChecked = false;
        return StatefulBuilder(builder: (context, setState) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(100)
            ,color: Colors.white,
                ),
                child: Icon(Icons.close),
              ),
            ),
            backgroundColor: Colors.black87,
            body:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: SimpleDialogOption(
                    child: SizedBox(
                        height: 600,
                        width: 200,
                        child: FutureBuilder<List<dynamic>>(
                            future: ContentController.instance.GetCategories(),
                            builder: (context, item) {
                              //final x = item.data[0].id
                              if (item.data == null)
                                return Center(
                                  child: Text('Nothing Found'),
                                );

                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: item.data!.length,
                                itemBuilder: (ctx, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: Center(
                                      child: Text(
                                        item.data![index]["name"],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey
                                        ),
                                      ),
                                    )),
                                separatorBuilder: (ctx, index) => SizedBox(
                                  height: 18,
                                ),
                              );
                            })),
                  ),
                ),
              ],
              ),
            )  );
        });
      });
}
