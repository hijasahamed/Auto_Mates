import 'package:flutter/material.dart';

class SellerDetailsWidget extends StatelessWidget {
  const SellerDetailsWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenSize.height / 5,
                width: screenSize.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://67cdn.co.uk/90/6/167300977163b81a6bc69c9_ccs-revisedhome.jpg?width=479&height=251&crop=auto'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline_rounded,
                          size: 15,
                          color: Colors.red,
                        )),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Seller information',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
                Divider(color: Colors.white,thickness: 2,),
                SellersDetail(icon: Icons.person, data: "CCS Car Sales"),
                SellersDetail(icon: Icons.call, data: "7907721095"),
                SellersDetail(icon: Icons.star, data: "4.2"),
                SellersDetail(icon: Icons.place, data: "Malappuram"),
                Divider(color: Colors.white,thickness: 2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SellersDetail extends StatelessWidget {
  const SellersDetail({super.key,required this.icon,required this.data});
  final IconData icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Icon(icon),
          Text(data,style: const TextStyle(fontWeight: FontWeight.w600,color: Color(0xFF424141)),)
        ],
      ),
    );
  }
}
