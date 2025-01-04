import 'package:flutter/material.dart';

const kPrimaryColor=Color(0xff100B20);
const kTransitionDuration=Duration(milliseconds: 500);
const kGtSectraFine = 'GT Sectra Fine';
const kFeaturedBox = 'featured_box';
const kNewestBox = 'newest_box';
const kSimilarBox = 'similar_box';

const List<String> newestBooks=['https://images-na.ssl-images-amazon.com/images/I/51-uhLvoZhL._SX384_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51tdkxBiMQL._SX379_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51m7gBmT8AL._SX331_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51NzCDlGNeL._SX374_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51gdXdfnvzL._SX437_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51q4MxGjbLL._SX375_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51ipw+a4lvL._SX307_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51uIc9YNW8L._SX291_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51dTxMaqQ1L._SX323_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51Aa+gIAAZOL._SX363_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51EldnTfwiL._SX514_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51dYZRw64FL._SX385_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51bLXLlCEZL._SX518_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51Ynn4sNo7L._SX492_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51RQ1GgXPPL._SX324_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51FFwxSmWWL._SX425_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51smE9St7ZL._SX329_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51kkhvi8uTL._SX350_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51lM8Quc9DL._SX288_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51TTcnYoMzL._SX223_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51zxF3D5x7L._SX514_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51xHUY+hRKL._SX317_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/615j5twmpML._SX410_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51tFQ3sjkML._SX350_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51YZKzcW0NL._SX406_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51t6fIz0h7L._SX375_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51tr8AtEN7L._SX391_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51jOtP7hEtL._SX383_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61U-EN2LMqL._SX424_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/81ktH SE51L._SX250_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51_FSfbK-7L._SX500_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/514Y14Ph1uL._SX348_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/514wMGWUvmL._SX500_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51HwoExAINL._SX424_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51TWEyqniDL._SX291_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61km+kU0zXL._SX345_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51ZNLOeGG5L._SX388_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61JgjOq4ujL._SX389_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51Wuz6I4exL._SX345_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51qQopwl91L._SX370_BO1,204,203,200_.jpg', ];

