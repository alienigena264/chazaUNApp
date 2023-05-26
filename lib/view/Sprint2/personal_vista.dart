import 'package:chazaunapp/Services/services_menu_personalactivo_chazero.dart';
import 'package:chazaunapp/view/colors.dart';
import 'package:flutter/material.dart';

class PersonalVista extends StatelessWidget{
  const PersonalVista({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(175),
            child: AppBar(
              bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: "Activos",
                    ),
                    Tab(
                      text: "Candidatos"
                    )
                  ],
                unselectedLabelColor: Colors.black87,
                unselectedLabelStyle: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Inder"
                ),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Inder"
                ),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 3
                  ),
                  insets: EdgeInsets.only(bottom: 5)
                ),
                indicatorSize: TabBarIndicatorSize.label,
              ),
              title: const Text("Personal"),
              titleTextStyle: const TextStyle(
                color:  Colors.white,
                fontSize: 60.0
              ),
              toolbarHeight: 175,
              centerTitle: true,
              backgroundColor: colorPrincipal,
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                future: getPersonalActivoPorchaza("0QmjUiDOy4viKrv3dzpF"),
                builder: ((context, snapshot) {
                  if (snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: Text(snapshot.data?[index]['nombres']),
                            )
                          ],

                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              ),
              const Text("A")
            ],

          ),
        )
    );
  }
}