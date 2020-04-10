import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 170,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.8,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: Text(
                                  order.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '+',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontSize: 16,
                // color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);

            // return Container(
            //   margin: EdgeInsets.all(10),
            //   height: 100,
            //   color: Colors.red,
            // );
          },
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                height: 1,
              ),
          itemCount: currentUser.cart.length),
    );
  }
}
