import 'package:flutter/material.dart';

class OwnerProfil extends StatelessWidget {
  const OwnerProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile",style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.abc,color: Colors.orange.shade800,),
        backgroundColor: Colors.orange.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade800,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))
              ),
              child:  Column(
                children: [
                const   SizedBox(height: 10,),
                 const  Text("Available Balance",style: TextStyle(color: Colors.white,fontSize: 20),),
                 const   Text("₹ 30000",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),

                   Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        
                      ),
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                    child:const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text("Withdraw",style: TextStyle(color: Colors.white,fontSize: 20),),
                        
                      ],
                    ),
                   ),
                  
                    
                ],
              )),
            
           
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Order history'),
              onTap: () {
              
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.reviews),
              title: const Text('User Review'),
              onTap: () {
               
              },
            ),
           const Divider(),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title:const  Text('Statics'),
              onTap: () {
                
              },
            ),
           const  Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
               
              },
            ),
          ],
        ),
      ),
    );
  }
}