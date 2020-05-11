import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_loja/widgets/category_tile.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    
    super.build(context);
    
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("products").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        else
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                return CategoryTile(snapshot.data.documents[index]);
              }
          );
      },
    );
  }

  @override//isso faz a tela continuar em execução mesmo indo para outra tela
  //e para isso precisar ser stful e precisa ter a extenção AutomaticKeepAliveClientMixin e o super.build(context);
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

