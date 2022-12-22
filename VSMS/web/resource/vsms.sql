-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2016 at 05:08 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--
Drop database vsms;

create database vsms;
use vsms;

CREATE TABLE `dish` (
  `dish_id` int(11) NOT NULL,
  `dish_name` varchar(100) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `dish_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`dish_id`, `dish_name`, `vendor_id`, `dish_description`) VALUES
(1, 'Espresso', 1, 'Coffee for your tired self'),
(2, 'Duck Confit', 1, 'Compilations of duck products'),
(3, 'Rib Eye Steak', 1, 'Tender meat to complement your wine'),
(4, 'Burger', 1, 'Juicy and spiceful burger to suit your taste'),
(5, 'Roast Chicken', 1, 'Hot and fresh Roasted Chicken'),
(6, 'Green Chicken', 1, 'Thai Chicken with Green Soup'),
(7, 'Breaded Ginger Pigeon', 15, 'western dish made out of Pigeon'),
(8, 'Oven-Grilled Apricot & Basil Mutton', 5, 'asian dish made out of Mutton'),
(9, 'Engine-Cooked Mango & Pine Crab', 7, 'western dish made out of Crab'),
(10, 'Slow-Cooked Honey Herring', 8, 'western dish made out of Herring'),
(11, 'Stuffed Light Beer Lasagne', 10, 'asian dish made out of Lasagne'),
(12, 'Thermal-Cooked Watercress Scrambled Egg', 14, 'beverage dish made out of Egg'),
(13, 'Cranberry and Date Pastry', 4, 'western dish made out of Pastry'),
(14, 'Lemon and Mint Gingerbread', 2, 'asian dish made out of Gingerbread'),
(15, 'Apple Buns', 12, 'western dish made out of Buns'),
(16, 'Dark Chocolate Tarte Tatin', 9, 'beverage dish made out of Tatin'),
(17, 'Fire-Grilled Hot & Spicy Pheasant', 2, 'asian dish made out of Pheasant'),
(18, 'Oven-Baked Chilli Rabbit', 12, 'western dish made out of Rabbit'),
(19, 'Barbecued Curry of Herring', 13, 'beverage dish made out of Herring'),
(20, 'Gentle-Fried Hot & Spicy Crocodile', 8, 'western dish made out of Crocodile'),
(21, 'Barbecued Mint & Orange Pasta', 10, 'asian dish made out of Pasta'),
(22, 'Stir-Fried Pine Spring vegetables', 12, 'western dish made out of Vegetables'),
(23, 'Rum and Nutmeg Split', 2, 'asian dish made out of Split'),
(24, 'Melon and Chestnut Toffee', 10, 'asian dish made out of Toffee'),
(25, 'Almond Bread', 5, 'asian dish made out of Bread'),
(26, 'Cocoa Pud', 9, 'beverage dish made out of Pud'),
(27, 'Pan-Fried Garlic & Lime Boar', 7, 'western dish made out of Boar'),
(28, 'Stuffed Cranberry Duck', 10, 'asian dish made out of Duck'),
(29, 'Oven-Grilled Confit of Scallops', 9, 'beverage dish made out of Scallops'),
(30, 'Baked Egg & Beet Shrimps', 12, 'western dish made out of Shrimps'),
(31, 'Marinated Curry of Buns', 6, 'vegetable dish made out of Buns'),
(32, 'Stewed Garlic & Tomato Rice', 14, 'beverage dish made out of Rice'),
(33, 'White Chocolate and Walnut Sundae', 14, 'beverage dish made out of Sundae'),
(34, 'Orange and Vanilla Cake', 12, 'western dish made out of Cake'),
(35, 'Chestnut Pastry', 7, 'western dish made out of Pastry'),
(36, 'Cherry Toast', 15, 'western dish made out of Toast'),
(37, 'Slow-Cooked Mountain Turkey', 13, 'beverage dish made out of Turkey'),
(38, 'Shallow-Fried Peppermint Turkey', 3, 'fusion dish made out of Turkey'),
(39, 'Cured Garlic & Rosemary Herring', 13, 'beverage dish made out of Herring'),
(40, 'Fried Mushroom Prawns', 9, 'beverage dish made out of Prawns'),
(41, 'Tea-Smoked Cucumber & Bread', 6, 'vegetable dish made out of Bread'),
(42, 'Fire-Roasted Carrots & Ginger Linguine', 13, 'beverage dish made out of Linguine'),
(43, 'Chocolate and Walnut Yogurt', 15, 'western dish made out of Yogurt'),
(44, 'Grape and Blueberry Pound Cake', 2, 'asian dish made out of Cake'),
(45, 'Peach Wafer', 13, 'beverage dish made out of Wafer'),
(46, 'Lime Roll', 2, 'asian dish made out of Roll'),
(47, 'Oven-Baked Carrots & Ginger Mutton', 13, 'beverage dish made out of Mutton'),
(48, 'Brined Rosemary Chicken', 4, 'western dish made out of Chicken'),
(49, 'Marinated Sweet & Fresh Lobster', 11, 'fusion dish made out of Lobster'),
(50, 'Shallow-Fried Basil & Clove Fish', 8, 'western dish made out of Fish'),
(51, 'Oven-Grilled Basil & Clove Soup', 15, 'western dish made out of Soup'),
(52, 'Simmered Pasta & Taco', 8, 'western dish made out of Taco'),
(53, 'Cherry and Raspberry Cheesecake', 14, 'beverage dish made out of Cheesecake'),
(54, 'Passion Fruit and Coconut Gingerbread', 9, 'beverage dish made out of Gingerbread'),
(55, 'Praline Buns', 5, 'asian dish made out of Buns'),
(56, 'Walnut Sorbet', 3, 'fusion dish made out of Sorbet'),
(57, 'Fire-Grilled Lime & Ginger Boar', 8, 'western dish made out of Boar'),
(58, 'Slow-Cooked Beets & Lemon Venison', 8, 'western dish made out of Venison'),
(59, 'Broasted Fennel & Lemon Tuna', 12, 'western dish made out of Tuna'),
(60, 'Barbecued Peppermint Cockles', 5, 'asian dish made out of Cockles'),
(61, 'Engine-Cooked Onions & Tomato Winter vegetables', 2, 'asian dish made out of Vegetables'),
(62, 'Stewed Chilli Tart', 4, 'western dish made out of Tart'),
(63, 'Coconut and Passion Fruit Roll', 4, 'western dish made out of Roll'),
(64, 'Coffee and Milk Chocolate Genoise', 14, 'beverage dish made out of Genoise'),
(65, 'Hazelnut Bombe', 2, 'asian dish made out of Bombe'),
(66, 'Peanut Yogurt', 6, 'vegetable dish made out of Yogurt'),
(67, 'Marinated Forest Lamb', 4, 'western dish made out of Lamb'),
(68, 'Broasted Egg & Beans Pork', 2, 'asian dish made out of Pork'),
(69, 'Gentle-Fried Rhubarb Oysters', 7, 'western dish made out of Oysters'),
(70, 'Thermal-Cooked Souther-Style Prawns', 3, 'fusion dish made out of Prawns'),
(71, 'Pressure-Cooked Orange & Mustard Spring Greens', 15, 'western dish made out of Greens'),
(72, 'Poached Carrots & Ginger Pasta', 3, 'fusion dish made out of Pasta'),
(73, 'Peach and Passion Fruit Molten Cake', 3, 'fusion dish made out of Cake'),
(74, 'Mango and Lemon Split', 14, 'beverage dish made out of Split'),
(75, 'Ginger Gingerbread', 5, 'asian dish made out of Gingerbread'),
(76, 'Rum Cookies', 12, 'western dish made out of Cookies'),
(77, 'Cooked Sweet & Spicy Turkey', 9, 'beverage dish made out of Turkey'),
(78, 'Fire-Grilled Garlic & Ginger Ostrich', 3, 'fusion dish made out of Ostrich'),
(79, 'Oven-Baked Dark Ale Oysters', 13, 'beverage dish made out of Oysters'),
(80, 'Dried Carrot & Corriander Frog', 7, 'western dish made out of Frog'),
(81, 'Dried Fennel & Garlic Spring Greens', 11, 'fusion dish made out of Greens'),
(82, 'Seared Nuts & Walnuts', 12, 'western dish made out of Walnuts'),
(83, 'Pecan and Red Wine Bonbons', 13, 'beverage dish made out of Bonbons'),
(84, 'Red Wine and Orange Roll', 14, 'beverage dish made out of Roll'),
(85, 'Saffron Fruitcake', 10, 'asian dish made out of Fruitcake'),
(86, 'Strawberry Sundae', 7, 'western dish made out of Sundae'),
(87, 'Blanched Peach & Vinegar Quail', 11, 'fusion dish made out of Quail'),
(88, 'Pan-Fried Wasabi Horse', 2, 'asian dish made out of Horse'),
(89, 'Infused Juniper Crab', 5, 'asian dish made out of Crab'),
(90, 'Poached Forest Oysters', 3, 'fusion dish made out of Oysters'),
(91, 'Barbecued Orange Forest Mushrooms', 6, 'vegetable dish made out of Mushrooms'),
(92, 'Simmered Egg & Coconut Winter Vegetables', 15, 'western dish made out of Vegetables'),
(93, 'Guava and Date Pie', 7, 'western dish made out of Pie'),
(94, 'Honey and Avocado Bombe', 12, 'western dish made out of Bombe'),
(95, 'Apple Fruitcake', 4, 'western dish made out of Fruitcake'),
(96, 'Pistachio Fudge', 3, 'fusion dish made out of Fudge');

-- --------------------------------------------------------

--
-- Table structure for table `dish_order`
--

CREATE TABLE `dish_order` (
  `dish_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favourite_supplier`
--

CREATE TABLE `favourite_supplier` (
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite_supplier`
--

INSERT INTO `favourite_supplier` (`vendor_id`, `supplier_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `supplier_id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `supply_unit` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `ingredient_description` text NOT NULL,
  `offered_price` float NOT NULL,
  `minimum_order_quantity` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
   `picture` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`supplier_id`, `ingredient_name`, `supply_unit`, `category`, `ingredient_description`, `offered_price`,`minimum_order_quantity`,`status`) VALUES
(1, 'Coffee Beans', 'can', 'misc', 'Fresh Coffee Beans from the market', 1,0,'available'),
(1, 'Lettuce', 'package', 'vegetable', 'Green fresh Lettuce for your salad', 0.3,0,'available'),
(1, 'Pink oranges', 'package', 'fruit', 'Unique pink oranges', 0.6,0,'available'),
(1, 'Potatoes', 'g', 'vegetable', 'Sweet and healthy', 0.3,0,'available'),
(1, 'Purple apples', 'piece', 'fruit', 'Weird but good', 0.4,0,'available'),
(1, 'Rainbow pineapple', 'piece', 'fruit', 'Taste like rainbow', 1,0,'available'),
(1, 'Strawberry', 'g', 'fruit', 'Red and juicy', 0.3,0,'available'),
(1, 'Tomatoes', 'g', 'vegetable', 'Red and Red', 0.1,0,'available'),
(1, 'Whole Chickens', 'piece', 'Meat', 'Tender and healthy', 8.3,0,'available'),
(2, 'Chicken feet', 'package', 'Meat', 'Your local delicacy', 3.3,0,'available'),
(2, 'Foreign chicken', 'piece', 'Meat', 'Your foreign delicacy', 13.4,0,'available'),
(2, 'Local chicken', 'piece', 'Meat', 'White and healthy', 10.3,0,'available'),
(2, 'White Sugar', 'cup', 'Bakery', 'White sugar to fulfill your sweet needs', 1,0,'available'),
(3, 'Blue spinach', 'package', 'vegetable', 'Healthy blue spinach', 1.1,0,'available'),
(3, 'Organic olives', 'package', 'vegetable', 'Healthy organic olives', 1.1,0,'available'),
(3, 'Rainbow cabbage', 'package', 'vegetable', 'Rainbow colored cabbage', 1.1,0,'available'),
(4, 'Ground Beef', 'can', 'Meat', 'Grounded Meat', 2.1,0,'available'),
(4, 'Leg of Duck', 'package', 'Meat', 'Your duck legs', 3,0,'available'),
(4, 'Rib Eye', 'piece', 'Meat', 'For your steak and wine dinner', 10,0,'available'),
(5, 'Leg of Duck', 'package', 'Meat', 'Duck legs from heaven', 3,0,'available'),
(5, 'Parsley', 'g', 'Spice', 'Nice spice', 0.1,0,'available'),
(5, 'Rosemary', 'g', 'Spice', 'Nice spice', 0.1,0,'available'),
(5, 'Sage', 'g', 'Spice', 'Nice spice', 0.1,0,'available'),
(5, 'Thyme', 'g', 'Spice', 'Nice spice', 0.1,0,'available'),
(6,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,4,'available'),
(6,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,4,'available'),
(6,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,5,'available'),
(6,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,2,'available'),
(6,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,1,'available'),
(6,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,4,'available'),
(7,'borscht','bottle','asian','borscht is a very nice food and beverage category that is categorized under asian cuisine',5.4,3,'available'),
(7,'coconut oil','bottle','asian','coconut oil is a very nice food and beverage category that is categorized under asian cuisine',5.9,2,'available'),
(7,'cornmeal','can','asian','cornmeal is a very nice food and beverage category that is categorized under asian cuisine',2.1,0,'available'),
(7,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,1,'available'),
(7,'leeks','package','asian','leeks is a very nice food and beverage category that is categorized under asian cuisine',4.6,5,'available'),
(7,'mushrooms','can','asian','mushrooms is a very nice food and beverage category that is categorized under asian cuisine',4.4,3,'available'),
(7,'salmon','piece','asian','salmon is a very nice food and beverage category that is categorized under asian cuisine',5.8,2,'available'),
(8,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,2,'available'),
(8,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,2,'available'),
(8,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,5,'available'),
(8,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,5,'available'),
(8,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(8,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,5,'available'),
(8,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,4,'available'),
(8,'salmon','piece','asian','salmon is a very nice food and beverage category that is categorized under asian cuisine',5.8,4,'available'),
(9,'apples','package','fusion','apples is a very nice food and beverage category that is categorized under fusion cuisine',2.5,0,'unavailable'),
(9,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(9,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,5,'available'),
(9,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,4,'available'),
(9,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,5,'available'),
(9,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,5,'available'),
(10,'beets','can','vegetable','beets is a very nice food and beverage category that is categorized under vegetable cuisine',3.2,4,'available'),
(10,'cornstarch','can','vegetable','cornstarch is a very nice food and beverage category that is categorized under vegetable cuisine',3.9,3,'available'),
(10,'granola','can','vegetable','granola is a very nice food and beverage category that is categorized under vegetable cuisine',1.8,5,'available'),
(10,'nectarines','can','vegetable','nectarines is a very nice food and beverage category that is categorized under vegetable cuisine',2,2,'available'),
(10,'pea beans','can','vegetable','pea beans is a very nice food and beverage category that is categorized under vegetable cuisine',3.4,3,'available'),
(10,'pinto beans','can','vegetable','pinto beans is a very nice food and beverage category that is categorized under vegetable cuisine',4.1,4,'available'),
(10,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,1,'available'),
(11,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,1,'available'),
(11,'black-eyed peas','can','beverage','black-eyed peas is a very nice food and beverage category that is categorized under beverage cuisine',2.5,1,'available'),
(11,'broccoli','package','beverage','broccoli is a very nice food and beverage category that is categorized under beverage cuisine',1.5,1,'available'),
(11,'chard','can','beverage','chard is a very nice food and beverage category that is categorized under beverage cuisine',3.9,3,'available'),
(11,'chestnuts','can','beverage','chestnuts is a very nice food and beverage category that is categorized under beverage cuisine',2.9,2,'available'),
(11,'fennel','can','beverage','fennel is a very nice food and beverage category that is categorized under beverage cuisine',4,3,'available'),
(11,'jicama','package','beverage','jicama is a very nice food and beverage category that is categorized under beverage cuisine',1.4,3,'available'),
(11,'sesame seeds','package','vegetable','sesame seeds is a very nice food and beverage category that is categorized under vegetable cuisine',5.3,1,'available'),
(12,'amaretto','package','beverage','amaretto is a very nice food and beverage category that is categorized under beverage cuisine',1.1,0,'available'),
(12,'baking soda','can','beverage','baking soda is a very nice food and beverage category that is categorized under beverage cuisine',3.9,1,'available'),
(12,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,1,'available'),
(12,'brandy','bottle','beverage','brandy is a very nice food and beverage category that is categorized under beverage cuisine',10.7,5,'available'),
(12,'broccoli','package','beverage','broccoli is a very nice food and beverage category that is categorized under beverage cuisine',1.5,5,'available'),
(12,'cayenne pepper','can','beverage','cayenne pepper is a very nice food and beverage category that is categorized under beverage cuisine',3.1,2,'available'),
(12,'jicama','package','beverage','jicama is a very nice food and beverage category that is categorized under beverage cuisine',1.4,2,'available'),
(12,'rose water','bottle','beverage','rose water is a very nice food and beverage category that is categorized under beverage cuisine',8.9,2,'available'),
(13,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,1,'unavailable'),
(13,'black-eyed peas','can','beverage','black-eyed peas is a very nice food and beverage category that is categorized under beverage cuisine',2.5,2,'available'),
(13,'broccoli','package','beverage','broccoli is a very nice food and beverage category that is categorized under beverage cuisine',1.5,4,'available'),
(13,'jicama','package','beverage','jicama is a very nice food and beverage category that is categorized under beverage cuisine',1.4,1,'available'),
(13,'rose water','bottle','beverage','rose water is a very nice food and beverage category that is categorized under beverage cuisine',8.9,4,'available'),
(14,'cantaloupes','piece','asian','cantaloupes is a very nice food and beverage category that is categorized under asian cuisine',6.9,0,'available'),
(14,'coconut oil','bottle','asian','coconut oil is a very nice food and beverage category that is categorized under asian cuisine',5.9,3,'available'),
(14,'cornmeal','can','asian','cornmeal is a very nice food and beverage category that is categorized under asian cuisine',2.1,0,'available'),
(14,'gelatin','can','asian','gelatin is a very nice food and beverage category that is categorized under asian cuisine',2,4,'available'),
(14,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,2,'available'),
(14,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,5,'available'),
(14,'Marsala','can','beverage','Marsala is a very nice food and beverage category that is categorized under beverage cuisine',5.1,2,'available'),
(14,'mushrooms','can','asian','mushrooms is a very nice food and beverage category that is categorized under asian cuisine',4.4,5,'available'),
(15,'baking soda','can','beverage','baking soda is a very nice food and beverage category that is categorized under beverage cuisine',3.9,2,'available'),
(15,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,3,'available'),
(15,'brandy','bottle','beverage','brandy is a very nice food and beverage category that is categorized under beverage cuisine',10.7,1,'available'),
(15,'buckwheat','package','beverage','buckwheat is a very nice food and beverage category that is categorized under beverage cuisine',5.6,2,'available'),
(15,'chard','can','beverage','chard is a very nice food and beverage category that is categorized under beverage cuisine',3.9,1,'available'),
(15,'cooking wine','can','beverage','cooking wine is a very nice food and beverage category that is categorized under beverage cuisine',2.4,4,'available'),
(15,'tea','package','asian','tea is a very nice food and beverage category that is categorized under asian cuisine',3.2,3,'available'),
(16,'apples','package','fusion','apples is a very nice food and beverage category that is categorized under fusion cuisine',2.5,2,'available'),
(16,'cooking wine','can','beverage','cooking wine is a very nice food and beverage category that is categorized under beverage cuisine',2.4,3,'available'),
(16,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,3,'available'),
(16,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,0,'available'),
(16,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,4,'available'),
(16,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(16,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,4,'available'),
(16,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,5,'available'),
(17,'cremini mushrooms','can','asian','cremini mushrooms is a very nice food and beverage category that is categorized under asian cuisine',2.4,5,'available'),
(17,'gelatin','can','asian','gelatin is a very nice food and beverage category that is categorized under asian cuisine',2,0,'available'),
(17,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,4,'available'),
(17,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,3,'available'),
(17,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,0,'available'),
(17,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,0,'available'),
(18,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,1,'available'),
(18,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,5,'available'),
(18,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,2,'available'),
(18,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,3,'available'),
(18,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(18,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,0,'available'),
(18,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,3,'available'),
(18,'tea','package','asian','tea is a very nice food and beverage category that is categorized under asian cuisine',3.2,3,'available'),
(19,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,5,'available'),
(19,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,2,'available'),
(19,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,1,'available'),
(19,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,5,'available'),
(19,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,0,'available'),
(19,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,1,'available'),
(19,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,2,'available'),
(19,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,5,'available'),
(20,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,3,'available'),
(20,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,3,'available'),
(20,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,5,'available'),
(20,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,5,'available'),
(20,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,4,'available'),
(20,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,3,'available'),
(21,'cantaloupes','piece','asian','cantaloupes is a very nice food and beverage category that is categorized under asian cuisine',6.9,1,'available'),
(21,'corn','can','asian','corn is a very nice food and beverage category that is categorized under asian cuisine',5.1,3,'available'),
(21,'cornmeal','can','asian','cornmeal is a very nice food and beverage category that is categorized under asian cuisine',2.1,4,'available'),
(21,'gelatin','can','asian','gelatin is a very nice food and beverage category that is categorized under asian cuisine',2,5,'available'),
(21,'mushrooms','can','asian','mushrooms is a very nice food and beverage category that is categorized under asian cuisine',4.4,5,'available'),
(21,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,4,'available'),
(22,'amaretto','package','beverage','amaretto is a very nice food and beverage category that is categorized under beverage cuisine',1.1,3,'available'),
(22,'brandy','bottle','beverage','brandy is a very nice food and beverage category that is categorized under beverage cuisine',10.7,3,'available'),
(22,'buckwheat','package','beverage','buckwheat is a very nice food and beverage category that is categorized under beverage cuisine',5.6,3,'available'),
(22,'fennel','can','beverage','fennel is a very nice food and beverage category that is categorized under beverage cuisine',4,2,'available'),
(22,'mussels','package','asian','mussels is a very nice food and beverage category that is categorized under asian cuisine',6.2,4,'available'),
(22,'tomato puree','can','beverage','tomato puree is a very nice food and beverage category that is categorized under beverage cuisine',3.4,1,'available'),
(23,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,5,'available'),
(23,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,5,'available'),
(23,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,1,'available'),
(23,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,0,'available'),
(23,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,1,'available'),
(23,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,5,'available'),
(23,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,1,'available'),
(23,'tomato puree','can','beverage','tomato puree is a very nice food and beverage category that is categorized under beverage cuisine',3.4,0,'available'),
(24,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,0,'available'),
(24,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,1,'available'),
(24,'french fries','package','western','french fries is a very nice food and beverage category that is categorized under western cuisine',2.2,3,'available'),
(24,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,0,'available'),
(24,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,2,'available'),
(24,'hash browns','package','western','hash browns is a very nice food and beverage category that is categorized under western cuisine',4.6,2,'available'),
(24,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,2,'available'),
(24,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,3,'available'),
(25,'borscht','bottle','asian','borscht is a very nice food and beverage category that is categorized under asian cuisine',5.4,1,'available'),
(25,'corn','can','asian','corn is a very nice food and beverage category that is categorized under asian cuisine',5.1,3,'available'),
(25,'cornmeal','can','asian','cornmeal is a very nice food and beverage category that is categorized under asian cuisine',2.1,4,'available'),
(25,'gelatin','can','asian','gelatin is a very nice food and beverage category that is categorized under asian cuisine',2,2,'available'),
(25,'leeks','package','asian','leeks is a very nice food and beverage category that is categorized under asian cuisine',4.6,4,'available'),
(25,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,2,'available'),
(25,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,4,'available'),
(25,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,1,'available'),
(26,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,0,'available'),
(26,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,1,'available'),
(26,'corned beef','can','western','corned beef is a very nice food and beverage category that is categorized under western cuisine',5.1,5,'available'),
(26,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,1,'available'),
(26,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,1,'available'),
(26,'salmon','piece','asian','salmon is a very nice food and beverage category that is categorized under asian cuisine',5.8,5,'available'),
(27,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,2,'available'),
(27,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,4,'available'),
(27,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,4,'available'),
(27,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,0,'available'),
(27,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,3,'available'),
(27,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,5,'available'),
(28,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(28,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(28,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,4,'available'),
(28,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,1,'available'),
(28,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,2,'available'),
(28,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,5,'available'),
(28,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,1,'available'),
(29,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,5,'available'),
(29,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,2,'available'),
(29,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,0,'available'),
(29,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,1,'available'),
(29,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(29,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,2,'available'),
(29,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,2,'available'),
(30,'black-eyed peas','can','beverage','black-eyed peas is a very nice food and beverage category that is categorized under beverage cuisine',2.5,1,'available'),
(30,'brandy','bottle','beverage','brandy is a very nice food and beverage category that is categorized under beverage cuisine',10.7,4,'available'),
(30,'fennel','can','beverage','fennel is a very nice food and beverage category that is categorized under beverage cuisine',4,3,'available'),
(30,'jicama','package','beverage','jicama is a very nice food and beverage category that is categorized under beverage cuisine',1.4,1,'available'),
(30,'rose water','bottle','beverage','rose water is a very nice food and beverage category that is categorized under beverage cuisine',8.9,3,'available'),
(30,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,5,'available'),
(31,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,4,'available'),
(31,'chard','can','beverage','chard is a very nice food and beverage category that is categorized under beverage cuisine',3.9,0,'available'),
(31,'chestnuts','can','beverage','chestnuts is a very nice food and beverage category that is categorized under beverage cuisine',2.9,2,'available'),
(31,'Marsala','can','beverage','Marsala is a very nice food and beverage category that is categorized under beverage cuisine',5.1,0,'available'),
(31,'rose water','bottle','beverage','rose water is a very nice food and beverage category that is categorized under beverage cuisine',8.9,1,'available'),
(31,'tomato puree','can','beverage','tomato puree is a very nice food and beverage category that is categorized under beverage cuisine',3.4,2,'available'),
(32,'cabbage','piece','fusion','cabbage is a very nice food and beverage category that is categorized under fusion cuisine',4.9,0,'available'),
(32,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,1,'available'),
(32,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(32,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,5,'available'),
(32,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,4,'available'),
(32,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,4,'available'),
(32,'rose water','bottle','beverage','rose water is a very nice food and beverage category that is categorized under beverage cuisine',8.9,5,'available'),
(33,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,2,'available'),
(33,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,4,'available'),
(33,'french fries','package','western','french fries is a very nice food and beverage category that is categorized under western cuisine',2.2,1,'available'),
(33,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,5,'available'),
(33,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,1,'available'),
(33,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,3,'available'),
(34,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,3,'available'),
(34,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,3,'available'),
(34,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,0,'available'),
(34,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,1,'available'),
(34,'french fries','package','western','french fries is a very nice food and beverage category that is categorized under western cuisine',2.2,0,'unavailable'),
(34,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,3,'available'),
(35,'borscht','bottle','asian','borscht is a very nice food and beverage category that is categorized under asian cuisine',5.4,0,'available'),
(35,'cremini mushrooms','can','asian','cremini mushrooms is a very nice food and beverage category that is categorized under asian cuisine',2.4,2,'available'),
(35,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,4,'available'),
(35,'leeks','package','asian','leeks is a very nice food and beverage category that is categorized under asian cuisine',4.6,2,'unavailable'),
(35,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,3,'available'),
(35,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,5,'available'),
(36,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,4,'available'),
(36,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,3,'available'),
(36,'french fries','package','western','french fries is a very nice food and beverage category that is categorized under western cuisine',2.2,2,'available'),
(36,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,3,'available'),
(36,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,0,'available'),
(36,'sauerkraut','can','western','sauerkraut is a very nice food and beverage category that is categorized under western cuisine',4,1,'available'),
(36,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,2,'available'),
(37,'bean sprouts','can','vegetable','bean sprouts is a very nice food and beverage category that is categorized under vegetable cuisine',2.4,1,'available'),
(37,'beets','can','vegetable','beets is a very nice food and beverage category that is categorized under vegetable cuisine',3.2,5,'available'),
(37,'berries','can','vegetable','berries is a very nice food and beverage category that is categorized under vegetable cuisine',3.7,2,'available'),
(37,'flax seed','can','vegetable','flax seed is a very nice food and beverage category that is categorized under vegetable cuisine',1.6,3,'available'),
(37,'half-and-half','package','vegetable','half-and-half is a very nice food and beverage category that is categorized under vegetable cuisine',5.9,2,'available'),
(37,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,4,'available'),
(38,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,0,'available'),
(38,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,5,'available'),
(38,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,2,'available'),
(38,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,4,'available'),
(38,'strawberries','can','vegetable','strawberries is a very nice food and beverage category that is categorized under vegetable cuisine',3.6,5,'available'),
(39,'apples','package','fusion','apples is a very nice food and beverage category that is categorized under fusion cuisine',2.5,5,'available'),
(39,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,1,'available'),
(39,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,2,'available'),
(39,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,0,'available'),
(39,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,1,'available'),
(39,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,1,'available'),
(40,'coconut oil','bottle','asian','coconut oil is a very nice food and beverage category that is categorized under asian cuisine',5.9,0,'available'),
(40,'corn','can','asian','corn is a very nice food and beverage category that is categorized under asian cuisine',5.1,2,'available'),
(40,'cremini mushrooms','can','asian','cremini mushrooms is a very nice food and beverage category that is categorized under asian cuisine',2.4,0,'available'),
(40,'leeks','package','asian','leeks is a very nice food and beverage category that is categorized under asian cuisine',4.6,1,'available'),
(40,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,0,'available'),
(40,'liver','piece','asian','liver is a very nice food and beverage category that is categorized under asian cuisine',4.5,3,'available'),
(40,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,5,'available'),
(41,'applesauce','can','vegetable','applesauce is a very nice food and beverage category that is categorized under vegetable cuisine',2.1,4,'available'),
(41,'bean sprouts','can','vegetable','bean sprouts is a very nice food and beverage category that is categorized under vegetable cuisine',2.4,3,'available'),
(41,'beets','can','vegetable','beets is a very nice food and beverage category that is categorized under vegetable cuisine',3.2,1,'available'),
(41,'brussels sprouts','can','vegetable','brussels sprouts is a very nice food and beverage category that is categorized under vegetable cuisine',2.7,3,'unavailable'),
(41,'nectarines','can','vegetable','nectarines is a very nice food and beverage category that is categorized under vegetable cuisine',2,0,'available'),
(41,'pea beans','can','vegetable','pea beans is a very nice food and beverage category that is categorized under vegetable cuisine',3.4,4,'available'),
(41,'salmon','piece','asian','salmon is a very nice food and beverage category that is categorized under asian cuisine',5.8,1,'available'),
(41,'sesame seeds','package','vegetable','sesame seeds is a very nice food and beverage category that is categorized under vegetable cuisine',5.3,1,'available'),
(42,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,1,'available'),
(42,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(42,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,1,'available'),
(42,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,5,'available'),
(42,'plantains','can','fusion','plantains is a very nice food and beverage category that is categorized under fusion cuisine',3.5,4,'available'),
(42,'sesame seeds','package','vegetable','sesame seeds is a very nice food and beverage category that is categorized under vegetable cuisine',5.3,5,'available'),
(43,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,3,'available'),
(43,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,4,'available'),
(43,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,2,'available'),
(43,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,1,'available'),
(43,'hash browns','package','western','hash browns is a very nice food and beverage category that is categorized under western cuisine',4.6,3,'available'),
(43,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,3,'available'),
(43,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,2,'available'),
(44,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,4,'available'),
(44,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,3,'available'),
(44,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,2,'available'),
(44,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,0,'available'),
(44,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,1,'available'),
(44,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,5,'unavailable'),
(45,'bean threads','can','western','bean threads is a very nice food and beverage category that is categorized under western cuisine',4.8,1,'available'),
(45,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,3,'available'),
(45,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,0,'available'),
(45,'hash browns','package','western','hash browns is a very nice food and beverage category that is categorized under western cuisine',4.6,1,'available'),
(45,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,0,'available'),
(45,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,1,'available'),
(46,'applesauce','can','vegetable','applesauce is a very nice food and beverage category that is categorized under vegetable cuisine',2.1,3,'available'),
(46,'beets','can','vegetable','beets is a very nice food and beverage category that is categorized under vegetable cuisine',3.2,5,'available'),
(46,'berries','can','vegetable','berries is a very nice food and beverage category that is categorized under vegetable cuisine',3.7,0,'available'),
(46,'cornstarch','can','vegetable','cornstarch is a very nice food and beverage category that is categorized under vegetable cuisine',3.9,3,'available'),
(46,'flax seed','can','vegetable','flax seed is a very nice food and beverage category that is categorized under vegetable cuisine',1.6,1,'available'),
(46,'nectarines','can','vegetable','nectarines is a very nice food and beverage category that is categorized under vegetable cuisine',2,2,'available'),
(46,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,0,'available'),
(47,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(47,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,4,'available'),
(47,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,2,'available'),
(47,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(47,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,5,'available'),
(47,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,1,'available'),
(47,'pinto beans','can','vegetable','pinto beans is a very nice food and beverage category that is categorized under vegetable cuisine',4.1,4,'available'),
(47,'plantains','can','fusion','plantains is a very nice food and beverage category that is categorized under fusion cuisine',3.5,3,'available'),
(48,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,0,'available'),
(48,'coriander','can','fusion','coriander is a very nice food and beverage category that is categorized under fusion cuisine',1.5,5,'available'),
(48,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,0,'available'),
(48,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,4,'available'),
(48,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,4,'available'),
(48,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,3,'available'),
(48,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,2,'available'),
(49,'apples','package','fusion','apples is a very nice food and beverage category that is categorized under fusion cuisine',2.5,1,'unavailable'),
(49,'plantains','can','fusion','plantains is a very nice food and beverage category that is categorized under fusion cuisine',3.5,5,'available'),
(49,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,3,'available'),
(49,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,3,'available'),
(49,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,2,'available'),
(49,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,5,'available'),
(50,'apples','package','fusion','apples is a very nice food and beverage category that is categorized under fusion cuisine',2.5,1,'available'),
(50,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(50,'cottage cheese','package','fusion','cottage cheese is a very nice food and beverage category that is categorized under fusion cuisine',3.1,4,'available'),
(50,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,0,'available'),
(50,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,0,'available'),
(50,'plantains','can','fusion','plantains is a very nice food and beverage category that is categorized under fusion cuisine',3.5,4,'available'),
(50,'spearmint','package','fusion','spearmint is a very nice food and beverage category that is categorized under fusion cuisine',4,0,'available'),
(51,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,0,'available'),
(51,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,1,'available'),
(51,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,3,'available'),
(51,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,3,'available'),
(51,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,3,'available'),
(51,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,2,'available'),
(52,'cabbage','piece','fusion','cabbage is a very nice food and beverage category that is categorized under fusion cuisine',4.9,2,'available'),
(52,'colby cheese','package','fusion','colby cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,4,'available'),
(52,'cream cheese','package','fusion','cream cheese is a very nice food and beverage category that is categorized under fusion cuisine',2.2,0,'available'),
(52,'feta cheese','package','fusion','feta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.7,4,'available'),
(52,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,3,'available'),
(52,'plantains','can','fusion','plantains is a very nice food and beverage category that is categorized under fusion cuisine',3.5,2,'available'),
(52,'pumpkin seeds','package','fusion','pumpkin seeds is a very nice food and beverage category that is categorized under fusion cuisine',3.4,2,'available'),
(53,'blue cheese','package','asian','blue cheese is a very nice food and beverage category that is categorized under asian cuisine',10.8,2,'available'),
(53,'borscht','bottle','asian','borscht is a very nice food and beverage category that is categorized under asian cuisine',5.4,5,'available'),
(53,'cantaloupes','piece','asian','cantaloupes is a very nice food and beverage category that is categorized under asian cuisine',6.9,0,'available'),
(53,'gelatin','can','asian','gelatin is a very nice food and beverage category that is categorized under asian cuisine',2,1,'available'),
(53,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,5,'available'),
(53,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,5,'available'),
(53,'ricotta cheese','package','fusion','ricotta cheese is a very nice food and beverage category that is categorized under fusion cuisine',1.4,0,'available'),
(54,'eggplants','can','fusion','eggplants is a very nice food and beverage category that is categorized under fusion cuisine',5.8,3,'available'),
(54,'hot sauce','can','fusion','hot sauce is a very nice food and beverage category that is categorized under fusion cuisine',1,5,'available'),
(54,'mackerel','piece','fusion','mackerel is a very nice food and beverage category that is categorized under fusion cuisine',8.3,3,'available'),
(54,'mushrooms','can','asian','mushrooms is a very nice food and beverage category that is categorized under asian cuisine',4.4,4,'available'),
(54,'peaches','can','fusion','peaches is a very nice food and beverage category that is categorized under fusion cuisine',2.2,1,'available'),
(54,'provolone','package','fusion','provolone is a very nice food and beverage category that is categorized under fusion cuisine',1.2,5,'available'),
(55,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,1,'available'),
(55,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,4,'available'),
(55,'corned beef','can','western','corned beef is a very nice food and beverage category that is categorized under western cuisine',5.1,3,'available'),
(55,'french fries','package','western','french fries is a very nice food and beverage category that is categorized under western cuisine',2.2,4,'available'),
(55,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,0,'available'),
(55,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,3,'available'),
(55,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,0,'available'),
(55,'red pepper flakes','package','fusion','red pepper flakes is a very nice food and beverage category that is categorized under fusion cuisine',2,1,'available'),
(56,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,2,'available'),
(56,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,2,'available'),
(56,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,4,'available'),
(56,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,1,'available'),
(56,'sauerkraut','can','western','sauerkraut is a very nice food and beverage category that is categorized under western cuisine',4,2,'available'),
(56,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,5,'available'),
(57,'amaretto','package','beverage','amaretto is a very nice food and beverage category that is categorized under beverage cuisine',1.1,2,'available'),
(57,'baking soda','can','beverage','baking soda is a very nice food and beverage category that is categorized under beverage cuisine',3.9,0,'available'),
(57,'black-eyed peas','can','beverage','black-eyed peas is a very nice food and beverage category that is categorized under beverage cuisine',2.5,0,'available'),
(57,'chestnuts','can','beverage','chestnuts is a very nice food and beverage category that is categorized under beverage cuisine',2.9,0,'available'),
(57,'cooking wine','can','beverage','cooking wine is a very nice food and beverage category that is categorized under beverage cuisine',2.4,5,'available'),
(57,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,1,'available'),
(58,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,5,'available'),
(58,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,1,'available'),
(58,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,1,'available'),
(58,'corned beef','can','western','corned beef is a very nice food and beverage category that is categorized under western cuisine',5.1,3,'available'),
(58,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,3,'available'),
(58,'Marsala','can','beverage','Marsala is a very nice food and beverage category that is categorized under beverage cuisine',5.1,5,'available'),
(58,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,3,'available'),
(59,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,0,'available'),
(59,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,2,'available'),
(59,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,0,'available'),
(59,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,2,'available'),
(59,'sauerkraut','can','western','sauerkraut is a very nice food and beverage category that is categorized under western cuisine',4,4,'available'),
(59,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,2,'available'),
(60,'blue cheese','package','asian','blue cheese is a very nice food and beverage category that is categorized under asian cuisine',10.8,4,'available'),
(60,'cantaloupes','piece','asian','cantaloupes is a very nice food and beverage category that is categorized under asian cuisine',6.9,3,'unavailable'),
(60,'cornmeal','can','asian','cornmeal is a very nice food and beverage category that is categorized under asian cuisine',2.1,4,'available'),
(60,'cremini mushrooms','can','asian','cremini mushrooms is a very nice food and beverage category that is categorized under asian cuisine',2.4,5,'available'),
(60,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,1,'available'),
(60,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,5,'available'),
(61,'borscht','bottle','asian','borscht is a very nice food and beverage category that is categorized under asian cuisine',5.4,1,'available'),
(61,'corn','can','asian','corn is a very nice food and beverage category that is categorized under asian cuisine',5.1,3,'available'),
(61,'cremini mushrooms','can','asian','cremini mushrooms is a very nice food and beverage category that is categorized under asian cuisine',2.4,5,'available'),
(61,'grouper','piece','asian','grouper is a very nice food and beverage category that is categorized under asian cuisine',5.2,5,'available'),
(61,'lettuce','package','asian','lettuce is a very nice food and beverage category that is categorized under asian cuisine',2.6,4,'available'),
(61,'mushrooms','can','asian','mushrooms is a very nice food and beverage category that is categorized under asian cuisine',4.4,1,'available'),
(61,'tea','package','asian','tea is a very nice food and beverage category that is categorized under asian cuisine',3.2,0,'available'),
(62,'acorn squash','package','western','acorn squash is a very nice food and beverage category that is categorized under western cuisine',2.9,0,'available'),
(62,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,4,'available'),
(62,'canola oil','can','western','canola oil is a very nice food and beverage category that is categorized under western cuisine',5.3,3,'available'),
(62,'cream of tartar','can','western','cream of tartar is a very nice food and beverage category that is categorized under western cuisine',2.2,0,'available'),
(62,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,5,'available'),
(62,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,5,'available'),
(62,'red snapper','piece','asian','red snapper is a very nice food and beverage category that is categorized under asian cuisine',10,4,'available'),
(63,'arugula','package','beverage','arugula is a very nice food and beverage category that is categorized under beverage cuisine',2.8,3,'available'),
(63,'baking soda','can','beverage','baking soda is a very nice food and beverage category that is categorized under beverage cuisine',3.9,5,'available'),
(63,'bay leaves','can','beverage','bay leaves is a very nice food and beverage category that is categorized under beverage cuisine',2,5,'available'),
(63,'brandy','bottle','beverage','brandy is a very nice food and beverage category that is categorized under beverage cuisine',10.7,2,'available'),
(63,'broccoli','package','beverage','broccoli is a very nice food and beverage category that is categorized under beverage cuisine',1.5,5,'available'),
(63,'buckwheat','package','beverage','buckwheat is a very nice food and beverage category that is categorized under beverage cuisine',5.6,3,'available'),
(63,'chestnuts','can','beverage','chestnuts is a very nice food and beverage category that is categorized under beverage cuisine',2.9,0,'available'),
(63,'hash browns','package','western','hash browns is a very nice food and beverage category that is categorized under western cuisine',4.6,5,'available'),
(64,'ale','package','western','ale is a very nice food and beverage category that is categorized under western cuisine',2.3,0,'available'),
(64,'chestnuts','can','beverage','chestnuts is a very nice food and beverage category that is categorized under beverage cuisine',2.9,3,'available'),
(64,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,5,'available'),
(64,'hamburger','piece','western','hamburger is a very nice food and beverage category that is categorized under western cuisine',1.1,2,'available'),
(64,'pasta','can','western','pasta is a very nice food and beverage category that is categorized under western cuisine',3,3,'available'),
(64,'poppy seeds','can','western','poppy seeds is a very nice food and beverage category that is categorized under western cuisine',3.7,4,'available'),
(64,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,3,'available'),
(65,'Canadian bacon','piece','western','Canadian bacon is a very nice food and beverage category that is categorized under western cuisine',1.5,3,'available'),
(65,'corned beef','can','western','corned beef is a very nice food and beverage category that is categorized under western cuisine',5.1,0,'available'),
(65,'garlic','piece','western','garlic is a very nice food and beverage category that is categorized under western cuisine',3.1,1,'available'),
(65,'lobsters','piece','western','lobsters is a very nice food and beverage category that is categorized under western cuisine',5,0,'available'),
(65,'sauerkraut','can','western','sauerkraut is a very nice food and beverage category that is categorized under western cuisine',4,0,'available'),
(65,'spaghetti squash','package','western','spaghetti squash is a very nice food and beverage category that is categorized under western cuisine',5,1,'available'),
(65,'steak','piece','western','steak is a very nice food and beverage category that is categorized under western cuisine',4.5,3,'available'),
(66, 'Apple', 'g', 'fruit', 'This ingredient will be used for testing', 0.2,0,'available'),
(66, 'Beef Ribeye', 'kg', 'meat', 'This ingredient will be used for testing', 10,0,'available'),
(66, 'Chicken Breast', 'kg', 'meat', 'This ingredient will be used for testing', 6,0,'available'),
(66, 'Chicken Egg', 'carton', 'Others', 'This ingredient will be used for testing', 4,0,'available'),
(66, 'Grape', 'g', 'fruit', 'This ingredient will be used for testing', 0.5,0,'available'),
(66, 'Pork Rib', 'kg', 'meat', 'This ingredient will be used for testing', 3,0,'available'),
(66, 'Strawberry', 'g', 'fruit', 'This ingredient will be used for testing', 1,0,'available');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_quantity`
--

CREATE TABLE `ingredient_quantity` (
  `dish_id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `quantity` int(15) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient_quantity`
--

INSERT INTO `ingredient_quantity` (`dish_id`, `ingredient_name`, `quantity`, `vendor_id`, `supplier_id`, `unit`) VALUES
(1, 'Blue spinach', 1, 1, 3, 'package'),
(1, 'Coffee Beans', 1, 1, 1, 'can'),
(1, 'White Sugar', 1, 1, 2, 'cup'),
(2, 'Organic olives', 1, 1, 3, 'package'),
(2, 'Rainbow cabbage', 1, 1, 3, 'package'),
(3, 'Ground Beef', 1, 1, 4, 'can'),
(3, 'Leg of Duck', 1, 1, 4, 'package'),
(4, 'Rib Eye', 1, 1, 4, 'piece'),
(5, 'Leg of Duck', 1, 1, 5, 'package'),
(5, 'Parsley', 10, 1, 5, 'g'),
(5, 'Rosemary', 10, 1, 5, 'g'),
(7, 'borscht', 1, 15, 7, 'bottle'),
(7, 'red pepper flakes', 2, 15, 9, 'package'),
(7, 'spaghetti squash', 2, 15, 6, 'package'),
(8, 'leeks', 1, 5, 7, 'package'),
(8, 'mushrooms', 1, 5, 7, 'can'),
(8, 'peaches', 1, 5, 8, 'can'),
(8, 'provolone', 1, 5, 8, 'package'),
(9, 'bay leaves', 2, 7, 11, 'can'),
(9, 'Canadian bacon', 2, 7, 23, 'piece'),
(9, 'sesame seeds', 2, 7, 11, 'package'),
(10, 'ale', 2, 8, 23, 'package'),
(10, 'cornmeal', 1, 8, 7, 'can'),
(11, 'colby cheese', 1, 10, 9, 'package'),
(11, 'hash browns', 1, 10, 24, 'package'),
(11, 'red pepper flakes', 2, 10, 9, 'package'),
(12, 'acorn squash', 2, 14, 23, 'package'),
(12, 'colby cheese', 1, 14, 9, 'package'),
(12, 'flax seed', 2, 14, 37, 'can'),
(12, 'provolone', 2, 14, 8, 'package'),
(12, 'spearmint', 2, 14, 10, 'package'),
(13, 'garlic', 1, 4, 6, 'piece'),
(13, 'grouper', 1, 4, 7, 'piece'),
(13, 'leeks', 1, 4, 7, 'package'),
(13, 'pasta', 2, 4, 6, 'can'),
(14, 'granola', 1, 2, 10, 'can'),
(14, 'grouper', 1, 2, 7, 'piece'),
(14, 'ricotta cheese', 2, 2, 17, 'package'),
(14, 'spearmint', 2, 2, 10, 'package'),
(15, 'black-eyed peas', 1, 12, 11, 'can'),
(15, 'cremini mushrooms', 2, 12, 17, 'can'),
(15, 'feta cheese', 2, 12, 18, 'package'),
(16, 'coconut oil', 2, 9, 7, 'bottle'),
(16, 'cornstarch', 1, 9, 10, 'can'),
(17, 'gelatin', 2, 2, 14, 'can'),
(17, 'grouper', 1, 2, 7, 'piece'),
(17, 'lobsters', 1, 2, 24, 'piece'),
(18, 'coconut oil', 1, 12, 7, 'bottle'),
(18, 'corn', 2, 12, 21, 'can'),
(18, 'nectarines', 1, 12, 10, 'can'),
(18, 'ricotta cheese', 2, 12, 17, 'package'),
(18, 'tomato puree', 1, 12, 22, 'can'),
(19, 'cream of tartar', 1, 13, 6, 'can'),
(19, 'cremini mushrooms', 1, 13, 17, 'can'),
(19, 'plantains', 2, 13, 42, 'can'),
(19, 'red pepper flakes', 2, 13, 9, 'package'),
(19, 'ricotta cheese', 2, 13, 17, 'package'),
(21, 'colby cheese', 1, 10, 9, 'package'),
(22, 'coriander', 2, 12, 8, 'can'),
(22, 'hamburger', 1, 12, 24, 'piece'),
(22, 'lobsters', 1, 12, 24, 'piece'),
(22, 'spearmint', 2, 12, 10, 'package'),
(23, 'ale', 1, 2, 23, 'package'),
(23, 'bean threads', 2, 2, 6, 'can'),
(23, 'mackerel', 2, 2, 8, 'piece'),
(23, 'spearmint', 1, 2, 10, 'package'),
(24, 'cabbage', 2, 10, 32, 'piece'),
(24, 'chard', 1, 10, 11, 'can'),
(25, 'bay leaves', 1, 5, 11, 'can'),
(25, 'lobsters', 1, 5, 24, 'piece'),
(25, 'spaghetti squash', 1, 5, 6, 'package'),
(26, 'ale', 2, 9, 23, 'package'),
(26, 'hamburger', 1, 9, 24, 'piece'),
(28, 'borscht', 1, 10, 7, 'bottle'),
(28, 'colby cheese', 2, 10, 9, 'package'),
(28, 'gelatin', 1, 10, 14, 'can'),
(29, 'acorn squash', 1, 9, 23, 'package'),
(29, 'garlic', 1, 9, 6, 'piece'),
(29, 'hot sauce', 1, 9, 8, 'can'),
(30, 'buckwheat', 1, 12, 15, 'package'),
(30, 'chestnuts', 1, 12, 11, 'can'),
(30, 'coriander', 1, 12, 8, 'can'),
(30, 'grouper', 2, 12, 7, 'piece'),
(30, 'peaches', 1, 12, 8, 'can'),
(30, 'plantains', 2, 12, 42, 'can'),
(30, 'pumpkin seeds', 2, 12, 8, 'package'),
(31, 'jicama', 2, 6, 11, 'package'),
(31, 'mussels', 2, 6, 22, 'package'),
(31, 'red pepper flakes', 2, 6, 9, 'package'),
(31, 'steak', 2, 6, 27, 'piece'),
(32, 'cottage cheese', 2, 14, 18, 'package'),
(32, 'eggplants', 1, 14, 8, 'can'),
(33, 'provolone', 2, 14, 8, 'package'),
(33, 'spearmint', 2, 14, 10, 'package'),
(34, 'cayenne pepper', 2, 12, 12, 'can'),
(34, 'feta cheese', 2, 12, 18, 'package'),
(34, 'garlic', 1, 12, 6, 'piece'),
(34, 'sauerkraut', 2, 12, 36, 'can'),
(35, 'brandy', 1, 7, 12, 'bottle'),
(35, 'pumpkin seeds', 2, 7, 8, 'package'),
(36, 'canola oil', 1, 15, 6, 'can'),
(36, 'grouper', 1, 15, 7, 'piece'),
(37, 'bean sprouts', 1, 13, 37, 'can'),
(37, 'corned beef', 2, 13, 26, 'can'),
(37, 'lobsters', 2, 13, 24, 'piece'),
(37, 'nectarines', 2, 13, 10, 'can'),
(38, 'ale', 2, 3, 23, 'package'),
(38, 'bean threads', 1, 3, 6, 'can'),
(38, 'cantaloupes', 1, 3, 14, 'piece'),
(39, 'broccoli', 1, 13, 11, 'package'),
(39, 'feta cheese', 1, 13, 18, 'package'),
(39, 'peaches', 2, 13, 8, 'can'),
(40, 'borscht', 1, 9, 7, 'bottle'),
(40, 'pea beans', 2, 9, 10, 'can'),
(41, 'rose water', 2, 6, 12, 'bottle'),
(42, 'ale', 1, 13, 23, 'package'),
(42, 'borscht', 1, 13, 7, 'bottle'),
(42, 'steak', 2, 13, 27, 'piece'),
(43, 'ale', 2, 15, 23, 'package'),
(43, 'amaretto', 1, 15, 12, 'package'),
(43, 'cream cheese', 2, 15, 18, 'package'),
(43, 'garlic', 2, 15, 6, 'piece'),
(44, 'borscht', 2, 2, 7, 'bottle'),
(44, 'cabbage', 1, 2, 32, 'piece'),
(44, 'cottage cheese', 2, 2, 18, 'package'),
(44, 'hot sauce', 1, 2, 8, 'can'),
(44, 'liver', 1, 2, 14, 'piece'),
(44, 'provolone', 1, 2, 8, 'package'),
(45, 'ale', 2, 13, 23, 'package'),
(45, 'Canadian bacon', 1, 13, 23, 'piece'),
(45, 'grouper', 1, 13, 7, 'piece'),
(46, 'borscht', 1, 2, 7, 'bottle'),
(46, 'brussels sprouts', 2, 2, 41, 'can'),
(46, 'corn', 1, 2, 21, 'can'),
(46, 'pinto beans', 2, 2, 10, 'can'),
(46, 'pumpkin seeds', 1, 2, 8, 'package'),
(46, 'red pepper flakes', 2, 2, 9, 'package'),
(46, 'sesame seeds', 1, 2, 11, 'package'),
(47, 'beets', 2, 13, 10, 'can'),
(47, 'eggplants', 2, 13, 8, 'can'),
(47, 'garlic', 2, 13, 6, 'piece'),
(48, 'french fries', 1, 4, 24, 'package'),
(49, 'colby cheese', 2, 11, 9, 'package'),
(49, 'cottage cheese', 1, 11, 18, 'package'),
(50, 'corn', 2, 8, 21, 'can'),
(50, 'corned beef', 2, 8, 26, 'can'),
(51, 'colby cheese', 1, 15, 9, 'package'),
(52, 'fennel', 1, 8, 11, 'can'),
(53, 'cream of tartar', 1, 14, 6, 'can'),
(53, 'peaches', 1, 14, 8, 'can'),
(53, 'pumpkin seeds', 1, 14, 8, 'package'),
(54, 'pea beans', 2, 9, 10, 'can'),
(54, 'poppy seeds', 1, 9, 26, 'can'),
(54, 'steak', 1, 9, 27, 'piece'),
(55, 'leeks', 1, 5, 7, 'package'),
(55, 'pinto beans', 1, 5, 10, 'can'),
(55, 'ricotta cheese', 2, 5, 17, 'package'),
(55, 'steak', 2, 5, 27, 'piece'),
(56, 'lettuce', 1, 3, 14, 'package'),
(56, 'sauerkraut', 2, 3, 36, 'can'),
(57, 'acorn squash', 1, 8, 23, 'package'),
(57, 'bay leaves', 1, 8, 11, 'can'),
(57, 'Canadian bacon', 1, 8, 23, 'piece'),
(57, 'chestnuts', 2, 8, 11, 'can'),
(58, 'brandy', 1, 8, 12, 'bottle'),
(58, 'canola oil', 2, 8, 6, 'can'),
(58, 'cream of tartar', 2, 8, 6, 'can'),
(58, 'hamburger', 1, 8, 24, 'piece'),
(58, 'hash browns', 2, 8, 24, 'package'),
(58, 'sesame seeds', 1, 8, 11, 'package'),
(59, 'black-eyed peas', 2, 12, 11, 'can'),
(59, 'feta cheese', 1, 12, 18, 'package'),
(59, 'pumpkin seeds', 2, 12, 8, 'package'),
(60, 'ale', 1, 5, 23, 'package'),
(60, 'borscht', 1, 5, 7, 'bottle'),
(60, 'hot sauce', 2, 5, 8, 'can'),
(61, 'canola oil', 2, 2, 6, 'can'),
(61, 'cornmeal', 2, 2, 7, 'can'),
(62, 'baking soda', 2, 4, 12, 'can'),
(62, 'canola oil', 2, 4, 6, 'can'),
(62, 'cream of tartar', 1, 4, 6, 'can'),
(62, 'hot sauce', 2, 4, 8, 'can'),
(63, 'coriander', 1, 4, 8, 'can'),
(63, 'feta cheese', 2, 4, 18, 'package'),
(64, 'eggplants', 2, 14, 8, 'can'),
(64, 'feta cheese', 1, 14, 18, 'package'),
(64, 'lettuce', 2, 14, 14, 'package'),
(64, 'lobsters', 2, 14, 24, 'piece'),
(64, 'red pepper flakes', 1, 14, 9, 'package'),
(64, 'spearmint', 2, 14, 10, 'package'),
(65, 'peaches', 1, 2, 8, 'can'),
(65, 'poppy seeds', 1, 2, 26, 'can'),
(65, 'red pepper flakes', 2, 2, 9, 'package'),
(67, 'chestnuts', 2, 4, 11, 'can'),
(67, 'peaches', 1, 4, 8, 'can'),
(68, 'borscht', 2, 2, 7, 'bottle'),
(68, 'coriander', 1, 2, 8, 'can'),
(68, 'fennel', 2, 2, 11, 'can'),
(68, 'liver', 1, 2, 14, 'piece'),
(68, 'pasta', 1, 2, 6, 'can'),
(68, 'sauerkraut', 1, 2, 36, 'can'),
(69, 'bay leaves', 2, 7, 11, 'can'),
(69, 'sesame seeds', 2, 7, 11, 'package'),
(70, 'baking soda', 2, 3, 12, 'can'),
(70, 'cornmeal', 2, 3, 7, 'can'),
(70, 'leeks', 1, 3, 7, 'package'),
(70, 'steak', 1, 3, 27, 'piece'),
(71, 'applesauce', 2, 15, 41, 'can'),
(71, 'gelatin', 2, 15, 14, 'can'),
(71, 'lettuce', 1, 15, 14, 'package'),
(71, 'pea beans', 2, 15, 10, 'can'),
(72, 'chard', 1, 3, 11, 'can'),
(72, 'garlic', 1, 3, 6, 'piece'),
(72, 'hash browns', 2, 3, 24, 'package'),
(72, 'hot sauce', 1, 3, 8, 'can'),
(72, 'liver', 2, 3, 14, 'piece'),
(73, 'cornstarch', 1, 3, 10, 'can'),
(73, 'flax seed', 1, 3, 37, 'can'),
(73, 'garlic', 2, 3, 6, 'piece'),
(74, 'cantaloupes', 2, 14, 14, 'piece'),
(74, 'jicama', 2, 14, 11, 'package'),
(75, 'red pepper flakes', 1, 5, 9, 'package'),
(76, 'garlic', 2, 12, 6, 'piece'),
(76, 'liver', 1, 12, 14, 'piece'),
(76, 'peaches', 1, 12, 8, 'can'),
(76, 'plantains', 2, 12, 42, 'can'),
(76, 'spearmint', 2, 12, 10, 'package'),
(76, 'steak', 2, 12, 27, 'piece'),
(77, 'apples', 2, 9, 9, 'package'),
(77, 'nectarines', 2, 9, 10, 'can'),
(77, 'poppy seeds', 2, 9, 26, 'can'),
(78, 'cornmeal', 2, 3, 7, 'can'),
(78, 'mackerel', 2, 3, 8, 'piece'),
(78, 'provolone', 2, 3, 8, 'package'),
(78, 'spearmint', 1, 3, 10, 'package'),
(79, 'brandy', 2, 13, 12, 'bottle'),
(79, 'cremini mushrooms', 2, 13, 17, 'can'),
(79, 'red pepper flakes', 2, 13, 9, 'package'),
(79, 'spearmint', 1, 13, 10, 'package'),
(79, 'steak', 2, 13, 27, 'piece'),
(80, 'plantains', 1, 7, 42, 'can'),
(81, 'broccoli', 1, 11, 11, 'package'),
(81, 'colby cheese', 1, 11, 9, 'package'),
(81, 'feta cheese', 2, 11, 18, 'package'),
(81, 'mushrooms', 2, 11, 7, 'can'),
(81, 'pumpkin seeds', 1, 11, 8, 'package'),
(82, 'black-eyed peas', 1, 12, 11, 'can'),
(82, 'borscht', 1, 12, 7, 'bottle'),
(82, 'cantaloupes', 1, 12, 14, 'piece'),
(82, 'mushrooms', 2, 12, 7, 'can'),
(83, 'fennel', 2, 13, 11, 'can'),
(84, 'peaches', 2, 14, 8, 'can'),
(85, 'acorn squash', 2, 10, 23, 'package'),
(85, 'canola oil', 2, 10, 6, 'can'),
(85, 'garlic', 2, 10, 6, 'piece'),
(85, 'peaches', 1, 10, 8, 'can'),
(85, 'spearmint', 2, 10, 10, 'package'),
(86, 'ale', 1, 7, 23, 'package'),
(86, 'bean threads', 1, 7, 6, 'can'),
(86, 'chard', 1, 7, 11, 'can'),
(86, 'french fries', 1, 7, 24, 'package'),
(86, 'jicama', 1, 7, 11, 'package'),
(86, 'peaches', 2, 7, 8, 'can'),
(87, 'ricotta cheese', 1, 11, 17, 'package'),
(87, 'steak', 1, 11, 27, 'piece'),
(88, 'beets', 2, 2, 10, 'can'),
(88, 'garlic', 2, 2, 6, 'piece'),
(88, 'leeks', 2, 2, 7, 'package'),
(88, 'red pepper flakes', 2, 2, 9, 'package'),
(89, 'apples', 2, 5, 9, 'package'),
(89, 'coconut oil', 2, 5, 7, 'bottle'),
(89, 'cream cheese', 1, 5, 18, 'package'),
(89, 'cream of tartar', 1, 5, 6, 'can'),
(89, 'garlic', 1, 5, 6, 'piece'),
(89, 'lettuce', 2, 5, 14, 'package'),
(89, 'liver', 1, 5, 14, 'piece'),
(89, 'spaghetti squash', 2, 5, 6, 'package'),
(90, 'acorn squash', 1, 3, 23, 'package'),
(90, 'pumpkin seeds', 2, 3, 8, 'package'),
(91, 'french fries', 2, 6, 24, 'package'),
(91, 'jicama', 2, 6, 11, 'package'),
(91, 'liver', 2, 6, 14, 'piece'),
(91, 'peaches', 2, 6, 8, 'can'),
(92, 'Canadian bacon', 2, 15, 23, 'piece'),
(92, 'canola oil', 2, 15, 6, 'can'),
(92, 'corned beef', 1, 15, 26, 'can'),
(92, 'hamburger', 1, 15, 24, 'piece'),
(92, 'red pepper flakes', 1, 15, 9, 'package'),
(92, 'tea', 2, 15, 15, 'package'),
(93, 'berries', 1, 7, 37, 'can'),
(93, 'fennel', 2, 7, 11, 'can'),
(93, 'hash browns', 1, 7, 24, 'package'),
(93, 'provolone', 1, 7, 8, 'package'),
(94, 'garlic', 1, 12, 6, 'piece'),
(94, 'pea beans', 2, 12, 10, 'can'),
(95, 'coriander', 2, 4, 8, 'can'),
(95, 'garlic', 1, 4, 6, 'piece'),
(95, 'granola', 1, 4, 10, 'can'),
(95, 'steak', 2, 4, 27, 'piece'),
(96, 'beets', 2, 3, 10, 'can'),
(96, 'cream of tartar', 2, 3, 6, 'can'),
(96, 'grouper', 2, 3, 7, 'piece');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_template`
--

CREATE TABLE `ingredient_template` (
  `template_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `template_description` text NOT NULL,
  `selected` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_template_quantity`
--

CREATE TABLE `ingredient_template_quantity` (
  `template_id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `quantity` int(15) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `total_final_price` float NOT NULL,
  `dt` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `expected_delivery` datetime DEFAULT NULL,
  `special_request` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--

CREATE TABLE `orderline` (
  `vendor_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `buffer_percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_template`
--

CREATE TABLE `order_template` (
  `order_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_description` text NOT NULL,
  `supplier_type` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `area_code` int(11) NOT NULL,
  `telephone_number` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `min_leadtime` int(11) NOT NULL,
  `max_leadtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_description`, `supplier_type`, `password`, `email`, `area_code`, `telephone_number`, `address`, `zipcode`, `min_leadtime`, `max_leadtime`) VALUES
(1, 'FreshFruitz', 'Providing the freshest and cheapest fruits since 1987. Offering a wide range, from tropical to imported exotic fruits. Items Sold: Rainbow pinapples, Purple apples, Pink oranges etc.', 'western', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'bowei.liu.2013@sis.smu.edu.sg', 65, 87221272, 'Punggol Street 10, Industrial Block #B1-10', 680253, 5, 6),
(2, 'FreshFoodz', 'Providing the freshest and cheapest chicken since 1887. Offering a wide range of fresh chicken parts. Items Sold: Chicken feet, foreign and local chicken.', 'asian', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'benjaminang.2013@sis.smu.edu.sg', 65, 87221272, 'Lakeside Street 20, Block 401, #11-10', 649000, 1, 4),
(3, 'FreshSaladz', 'Established in 2014, we provide the best technology in growing organic vegetables. We conduct research in additive free, genetically modified vegetables infused with a variety of vitamins and minerals. Items Sold: Rainbow cabbage, Blue spinach, Organic olives.', 'fusion', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'joel.gnui.2013@sis.smu.edu.sg', 65, 87221272, 'Jurong Avenue 2, Opposite Jurong Bird Park', 628925, 1, 3),
(4, 'Animal Farm', 'Animal Farm! Animal Animal Animals! Description: Where the pigs farm. Offering discounts on horse meat and beef. Items Sold: We have poultry ranging from kampong chicken to flying pigs!!', 'western', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Parin1957@armyspy.com', 65, 87221272, 'Lakeside Street 10, Block 101, #3-10', 426484, 2, 10),
(5, 'Only a Matter of Thyme', 'Only a Matter of Thyme! Description: Time waits for no one. Delivery across thyme and space. Items Sold: Time', 'spices', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Parin1957@armyspy.com', 65, 87221272, 'Bart Street 3, Block 41, #1-10', 247964, 5, 5),
(6, 'Foodingo (Supplier)', 'Foodingos Supplier Test Account', 'western', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', 'Yosin.a.2009@gmail.com', 65, 87221272, '49 Jalan Pemimpin APS INDUSTRIAL BUILDING', 577203, 1, 2),
(7, 'Wholesome Wonder Bread', 'Wholesome Wonder Bread is a very famous western supplier with the famous dish Punucapa', 'western', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', 'jameslautsejian@gmail.com', 65, 87221272, '1013 Geylang East Avenue 3 #01-136', 247964, 7, 14),
(8, 'Jerrys Iga', 'Jerrys Iga is a very famous asian supplier with the famous dish Iltapata', 'asian', 'Iltapata', 'Parin1957@armyspy.com', 65, 87221272, '49 Jalan Pemimpin APS INDUSTRIAL BUILDING', 247964, 7, 14),
(9, 'Picadilly Market Grill & BKY', 'Picadilly Market Grill & BKY is a very famous fusion supplier with the famous dish Pichicolo', 'fusion', 'Pichicolo', 'Parin1957@armyspy.com', 65, 87221272, '1 Lok Yang Way Jurong #19B', 247964, 7, 14),
(10, 'American Discount Foods', 'American Discount Foods is a very famous fusion supplier with the famous dish Araucana', 'fusion', 'Araucana', 'Parin1957@armyspy.com', 65, 87221272, '10 Pioneer Sector 1 #01-00', 247964, 7, 14),
(11, 'Natures Herbs', 'Natures Herbs is a very famous vegetable supplier with the famous dish Farellones', 'vegetable', 'Farellones', 'Parin1957@armyspy.com', 65, 87221272, 'Block 5022 Ang Mo Kio Industrial Park 2 #01-31', 247964, 7, 14),
(12, 'Hawaiian Isles Water CO', 'Hawaiian Isles Water CO is a very famous beverage supplier with the famous dish Apiau', 'beverage', 'Apiau', 'Parin1957@armyspy.com', 65, 87221272, '70 Woodlands Industrial Park E', 247964, 7, 14),
(13, 'American Estates Wines', 'American Estates Wines is a very famous beverage supplier with the famous dish Galvarino', 'beverage', 'Galvarino', 'Parin1957@armyspy.com', 65, 87221272, '86 International Road', 247964, 7, 14),
(14, 'Java Detour', 'Java Detour is a very famous beverage supplier with the famous dish Caracoles', 'beverage', 'Caracoles', 'Parin1957@armyspy.com', 65, 87221272, 'Block 192 Pandan Loop #01-26 PANTECH INDUSTRIAL COMPLEX', 247964, 7, 14),
(15, 'Hoyt Fusion Group', 'Hoyt Fusion Group is a very famous asian supplier with the famous dish Huilque', 'asian', 'Huilque', 'Parin1957@armyspy.com', 65, 87221272, '31 Penjuru Lane', 247964, 7, 14),
(16, 'Nembo Imports', 'Nembo Imports is a very famous beverage supplier with the famous dish Matanzas', 'beverage', 'Matanzas', 'Parin1957@armyspy.com', 65, 87221272, '8 Woodlands Loop', 247964, 7, 14),
(17, 'Buehlers Foods Inc', 'Buehlers Foods Inc is a very famous fusion supplier with the famous dish Collaguasi', 'fusion', 'Collaguasi', 'Parin1957@armyspy.com', 65, 87221272, '11 Joo Koon Circle', 247964, 7, 14),
(18, 'Ester C CO', 'Ester C CO is a very famous asian supplier with the famous dish Chilacaya', 'asian', 'Chilacaya', 'Parin1957@armyspy.com', 65, 87221272, '1002 Eunos Avenue 8 #01-42', 247964, 7, 14),
(19, 'Natural Pharmacy', 'Natural Pharmacy is a very famous fusion supplier with the famous dish Loncopahue', 'fusion', 'Loncopahue', 'Parin1957@armyspy.com', 65, 87221272, '126 Gul Circle', 247964, 7, 14),
(20, 'NW Core Collection', 'NW Core Collection is a very famous fusion supplier with the famous dish Mocopulle', 'fusion', 'Mocopulle', 'Parin1957@armyspy.com', 65, 87221272, '642 Rowell Road #02-115', 247964, 7, 14),
(21, 'C Plus', 'C Plus is a very famous fusion supplier with the famous dish Conanoxa', 'fusion', 'Conanoxa', 'Parin1957@armyspy.com', 65, 87221272, '545 Orchard Road #11-13 Far East Shopping Centre', 247964, 7, 14),
(22, 'Saigon Deli', 'Saigon Deli is a very famous asian supplier with the famous dish Quinquegua', 'asian', 'Quinquegua', 'Parin1957@armyspy.com', 65, 87221272, '90 Horne Road', 247964, 7, 14),
(23, 'College Hill Coffee CO', 'College Hill Coffee CO is a very famous beverage supplier with the famous dish Ñancul', 'beverage', 'Ñancul', 'Parin1957@armyspy.com', 65, 87221272, '25 Tuas Avenue 2', 247964, 7, 14),
(24, 'Main St Market', 'Main St Market is a very famous western supplier with the famous dish Huequecura', 'western', 'Huequecura', 'Parin1957@armyspy.com', 65, 87221272, '206 Tagore Lane', 247964, 7, 14),
(25, 'Harrys Occult Shop Inc', 'Harrys Occult Shop Inc is a very famous western supplier with the famous dish Llimpo', 'western', 'Llimpo', 'Parin1957@armyspy.com', 65, 87221272, '50 Hillview Terrace', 247964, 7, 14),
(26, 'Lambeth Groves Llc', 'Lambeth Groves Llc is a very famous asian supplier with the famous dish Ipres', 'asian', 'Ipres', 'Parin1957@armyspy.com', 65, 87221272, '30 Loyang Way, Loyang Industrial Estate #03-04', 247964, 7, 14),
(27, 'Dannys Meats & Catering', 'Dannys Meats & Catering is a very famous western supplier with the famous dish Tacata', 'western', 'Tacata', 'Parin1957@armyspy.com', 65, 87221272, '35 Pioneer Sector 2', 247964, 7, 14),
(28, 'Turkey Hill Minit Market', 'Turkey Hill Minit Market is a very famous western supplier with the famous dish Tijeral', 'western', 'Tijeral', 'Parin1957@armyspy.com', 65, 87221272, 'No. 6 Sixth Lok Yang Road Jurong Industrial Estate', 247964, 7, 14),
(29, 'Hy Vee Floral', 'Hy Vee Floral is a very famous fusion supplier with the famous dish Chapire', 'fusion', 'Chapire', 'Parin1957@armyspy.com', 65, 87221272, '9 Tuas Avenue 18', 247964, 7, 14),
(30, 'B & G Gourmet Of Hillsdale', 'B & G Gourmet Of Hillsdale is a very famous fusion supplier with the famous dish Marchihue', 'fusion', 'Marchihue', 'Parin1957@armyspy.com', 65, 87221272, '104 Jurong East Street 13 #01-102', 247964, 7, 14),
(31, 'Two Brothers Wine & Spirit', 'Two Brothers Wine & Spirit is a very famous beverage supplier with the famous dish Alca', 'beverage', 'Alca', 'Parin1957@armyspy.com', 65, 87221272, '39 Defu Lane 7', 247964, 7, 14),
(32, 'Kaufmann Wine', 'Kaufmann Wine is a very famous beverage supplier with the famous dish Rarinco', 'beverage', 'Rarinco', 'Parin1957@armyspy.com', 65, 87221272, '11 Tanjong Rhu Road #18-01 The Waterside', 247964, 7, 14),
(33, 'Food Help', 'Food Help is a very famous fusion supplier with the famous dish Churigualla', 'fusion', 'Churigualla', 'Parin1957@armyspy.com', 65, 87221272, 'No. 29 Woodlands Industrial Park E1 #04-17 Northtech', 247964, 7, 14),
(34, 'Smoky Bay Natural Foods Inc', 'Smoky Bay Natural Foods Inc is a very famous western supplier with the famous dish Pachica', 'western', 'Pachica', 'Parin1957@armyspy.com', 65, 87221272, '491B River Valley Road #04-01 Valley Point Office Tower', 247964, 7, 14),
(35, 'Baseline Ii Inc', 'Baseline Ii Inc is a very famous western supplier with the famous dish Maiquillahue', 'western', 'Maiquillahue', 'Parin1957@armyspy.com', 65, 87221272, '55 Hume Avenue #06-09', 247964, 7, 14),
(36, 'Tommy Boy Asian', 'Tommy Boy Asian is a very famous asian supplier with the famous dish Gualliguaica', 'asian', 'Gualliguaica', 'Parin1957@armyspy.com', 65, 87221272, 'Blk 2021 Bukit Batok Street 23 #01-226', 247964, 7, 14),
(37, 'Brownies', 'Brownies is a very famous western supplier with the famous dish Cerrillos', 'western', 'Cerrillos', 'Parin1957@armyspy.com', 65, 87221272, 'Block 3005 Ubi Avenue 3 #01-64', 247964, 7, 14),
(38, 'Kountry Korner Grocery Store', 'Kountry Korner Grocery Store is a very famous vegetable supplier with the famous dish Buenaventura', 'vegetable', 'Buenaventura', 'Parin1957@armyspy.com', 65, 87221272, '3018 Bedok Nth St 5 #01-32 Singapore 486132', 247964, 7, 14),
(39, 'SAL Daylight Donuts', 'SAL Daylight Donuts is a very famous fusion supplier with the famous dish Puchilco', 'fusion', 'Puchilco', 'Parin1957@armyspy.com', 65, 87221272, 'Paya Lebar Rd Singapore 1440', 247964, 7, 14),
(40, 'Sovereign Grounds', 'Sovereign Grounds is a very famous fusion supplier with the famous dish Quistagama', 'fusion', 'Quistagama', 'Parin1957@armyspy.com', 65, 87221272, '6 Joo Koon Crescent', 247964, 7, 14),
(41, 'Quick Trip', 'Quick Trip is a very famous asian supplier with the famous dish Hualaihué', 'asian', 'Hualaihué', 'Parin1957@armyspy.com', 65, 87221272, '32 Tuas View Loop', 247964, 7, 14),
(42, 'K C Foods', 'K C Foods is a very famous vegetable supplier with the famous dish Gultro', 'vegetable', 'Gultro', 'Parin1957@armyspy.com', 65, 87221272, '3016 Bedok Nth Ave 4 #01-03', 247964, 7, 14),
(43, 'Natural Foods Store', 'Natural Foods Store is a very famous fusion supplier with the famous dish Chigualoco', 'fusion', 'Chigualoco', 'Parin1957@armyspy.com', 65, 87221272, '15 Pioneer Sector 2', 247964, 7, 14),
(44, 'LA India Brand', 'LA India Brand is a very famous western supplier with the famous dish Loros', 'western', 'Loros', 'Parin1957@armyspy.com', 65, 87221272, '51 Tuas Ave 1 Singapore 639501 ', 247964, 7, 14),
(45, 'Bill Champ', 'Bill Champ is a very famous western supplier with the famous dish Huecahuecan', 'western', 'Huecahuecan', 'Parin1957@armyspy.com', 65, 87221272, '623 Aljunied Road #07-03 ALJUNIED INDUSTRIAL COMPLEX', 247964, 7, 14),
(46, 'Alex Lee Inc', 'Alex Lee Inc is a very famous western supplier with the famous dish Lancagua', 'western', 'Lancagua', 'Parin1957@armyspy.com', 65, 87221272, '21 Lor Ampas #09-00 Singapore 328782', 247964, 7, 14),
(47, 'Friday Harbor Market Place', 'Friday Harbor Market Place is a very famous vegetable supplier with the famous dish Pejerrey', 'vegetable', 'Pejerrey', 'Parin1957@armyspy.com', 65, 87221272, '66 Tannery Lane #01-04D Sindo Building', 247964, 7, 14),
(48, 'Quick Trip', 'Quick Trip is a very famous fusion supplier with the famous dish Central', 'fusion', 'Central', 'Parin1957@armyspy.com', 65, 87221272, '26 Benoi Sector Jurong', 247964, 7, 14),
(49, 'People Gotta Eat', 'People Gotta Eat is a very famous fusion supplier with the famous dish Negrete', 'fusion', 'Negrete', 'Parin1957@armyspy.com', 65, 87221272, '322D King Georges Avenue', 247964, 7, 14),
(50, 'Hot Spot Stores', 'Hot Spot Stores is a very famous fusion supplier with the famous dish Chinquio', 'fusion', 'Chinquio', 'Parin1957@armyspy.com', 65, 87221272, '8 Tanjong Penjuru JURONG INDUSTRIAL ESTATE', 247964, 7, 14),
(51, 'Drug Warehouse Wine & Spirits', 'Drug Warehouse Wine & Spirits is a very famous fusion supplier with the famous dish Ausipas', 'fusion', 'Ausipas', 'Parin1957@armyspy.com', 65, 87221272, '44 Pioneer Sector 2', 247964, 7, 14),
(52, 'King Soopers 65', 'King Soopers 65 is a very famous fusion supplier with the famous dish Junquillar', 'fusion', 'Junquillar', 'Parin1957@armyspy.com', 65, 87221272, '8 Tanjong Penjuru', 247964, 7, 14),
(53, 'Adonijah Health Food', 'Adonijah Health Food is a very famous fusion supplier with the famous dish Ayrocollo', 'fusion', 'Ayrocollo', 'Parin1957@armyspy.com', 65, 87221272, '11 Kian Teck Road', 247964, 7, 14),
(54, 'Bike Stop', 'Bike Stop is a very famous asian supplier with the famous dish Curanilahue', 'asian', 'Curanilahue', 'Parin1957@armyspy.com', 65, 87221272, '261 Waterloo Street #02-26', 247964, 7, 14),
(55, 'Chocolate Studio', 'Chocolate Studio is a very famous fusion supplier with the famous dish Mellipilla', 'fusion', 'Mellipilla', 'Parin1957@armyspy.com', 65, 87221272, 'Blk 9-H Yuan Ching Road #15-82', 247964, 7, 14),
(56, 'Olympic Bagel Company Inc', 'Olympic Bagel Company Inc is a very famous western supplier with the famous dish Pumanque', 'western', 'Pumanque', 'Parin1957@armyspy.com', 65, 87221272, '20 Shaw Road #06-05 CHING SHINE INDUSTRIAL BUILDING', 247964, 7, 14),
(57, 'RGA Enterprises', 'RGA Enterprises is a very famous western supplier with the famous dish Punucapa', 'western', 'Punucapa', 'Parin1957@armyspy.com', 65, 87221272, '1 Scotts Road #16-12', 247964, 7, 14),
(58, 'Desert Sage Herbs Inc', 'Desert Sage Herbs Inc is a very famous beverage supplier with the famous dish Iltapata', 'beverage', 'Iltapata', 'Parin1957@armyspy.com', 65, 87221272, '23A Jalan Grisek', 247964, 7, 14),
(59, 'Hills Pharmacy', 'Hills Pharmacy is a very famous western supplier with the famous dish Pichicolo', 'western', 'Pichicolo', 'Parin1957@armyspy.com', 65, 87221272, '8A Tuas Ave 13 Singapore 638981', 247964, 7, 14),
(60, 'Western Botanicals Inc', 'Western Botanicals Inc is a very famous western supplier with the famous dish Araucana', 'western', 'Araucana', 'Parin1957@armyspy.com', 65, 87221272, 'Block 3016 Bedok North Avenue 4 #01-03 EASTECH', 247964, 7, 14),
(61, 'Cleos Seafood', 'Cleos Seafood is a very famous asian supplier with the famous dish Farellones', 'asian', 'Farellones', 'Parin1957@armyspy.com', 65, 87221272, '48 Tuas Basin Link Singapore 638778 ', 247964, 7, 14),
(62, 'Captain Marden', 'Captain Marden is a very famous asian supplier with the famous dish Apiau', 'asian', 'Apiau', 'Parin1957@armyspy.com', 65, 87221272, '1 Bt Batok St 22 #03-28 Singapore 659592', 247964, 7, 14),
(63, 'Food Town', 'Food Town is a very famous western supplier with the famous dish Galvarino', 'western', 'Galvarino', 'Parin1957@armyspy.com', 65, 87221272, '50 Kian Teck Road', 247964, 7, 14),
(64, 'Coffee Beanery', 'Coffee Beanery is a very famous beverage supplier with the famous dish Caracoles', 'beverage', 'Caracoles', 'Parin1957@armyspy.com', 65, 87221272, '63 Hillview Ave #03-09 Lam Soon Ind Bldg Singapore 669569 ', 247964, 7, 14),
(65, 'Breaux Mart Supermarkets', 'Breaux Mart Supermarkets is a very famous western supplier with the famous dish Huilque', 'western', 'Huilque', 'Parin1957@armyspy.com', 65, 87221272, 'Block 35 Tannery Road #11-10 Tannery Block, Ruby Industrial Complex', 247964, 7, 14),
(66, 'Mars Cafe', 'Mars Cafe is a very famous western supplier with the famous dish Matanzas', 'western', 'Matanzas', 'Parin1957@armyspy.com', 65, 87221272, '5 Tuas Avenue 3 Bok Seng Building', 247964, 7, 14);

-- --------------------------------------------------------

--
-- Table structure for table `template_quantity`
--

CREATE TABLE `template_quantity` (
  `order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `dish_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `value1` varchar(100) NOT NULL,
  `value2` varchar(100) NOT NULL,
  `value3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`value1`, `value2`, `value3`) VALUES
('1', '2', '3'),
('4', '5', '6'),
('7', '8', '9');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `vendor_description` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `area_code` int(11) NOT NULL,
  `telephone_number` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `vendor_description`, `password`, `email`, `area_code`, `telephone_number`, `address`, `zipcode`) VALUES
(1, 'Bobs Bakery And Bistro', 'Bob bakery and bistro is a renowned Bistro that was established in 1976', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'vincentt.2013@sis.smu.edu.sg', 65, 87221272, '1B Braddel Road #05-02', 579701),
(2, 'Cozumel Mexican Grille', 'Cozumel Mexican Grille is a very famous asian supplier with the famous dish Punucapa', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'cw.cheung.2013@sis.smu.edu.sg', 65, 87221272, '39 Defu Lane 7', 539353),
(3, 'Foodingo (Vendor)', 'Foodingos Vendor Test Account', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', 'rehanarien@gmail.com', 65, 91234567, 'No. 29 Woodlands Industrial Park E1 #04-17 Northtech', 757716),
(4, 'Le Peep Restaurant', 'Le Peep Restaurant is a very famous fusion supplier with the famous dish Iltapata', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', 'ongzhikan@gmail.com', 65, 87221272, '11 Tanjong Rhu Road #18-01 The Waterside', 308215),
(5, 'Mark & Orlandos', 'Mark & Orlandos is a very famous western supplier with the famous dish Pichicolo', '4be30d9814c6d4e9800e0d2ea9ec9fb00efa887b', 'Shuqing316@gmail.com', 65, 87221272, 'No. 29 Woodlands Industrial Park E1 #04-17 Northtech', 308215),
(6, 'Chinalite', 'Chinalite is a very famous asian supplier with the famous dish Araucana', 'Araucana', 'Parin1957@armyspy.com', 65, 87221272, '491B River Valley Road #04-01 Valley Point Office Tower', 308215),
(7, 'Heritage Society', 'Heritage Society is a very famous vegetable supplier with the famous dish Farellones', 'Farellones', 'Parin1957@armyspy.com', 65, 87221272, '55 Hume Avenue #06-09', 308215),
(8, 'Breakers Sports Bar & Grill', 'Breakers Sports Bar & Grill is a very famous western supplier with the famous dish Apiau', 'Apiau', 'Parin1957@armyspy.com', 65, 87221272, 'Blk 2021 Bukit Batok Street 23 #01-226', 308215),
(9, 'Old Timers Restaurant', 'Old Timers Restaurant is a very famous western supplier with the famous dish Galvarino', 'Galvarino', 'Parin1957@armyspy.com', 65, 87221272, 'Block 3005 Ubi Avenue 3 #01-64', 308215),
(10, 'Enchiladas Restaurant CO', 'Enchiladas Restaurant CO is a very famous beverage supplier with the famous dish Caracoles', 'Caracoles', 'Parin1957@armyspy.com', 65, 87221272, '3018 Bedok Nth St 5 #01-32 Singapore 486132', 308215),
(11, 'Charlie Chiangs Asian Bistro', 'Charlie Chiangs Asian Bistro is a very famous asian supplier with the famous dish Huilque', 'Huilque', 'Parin1957@armyspy.com', 65, 87221272, 'Paya Lebar Rd Singapore 1440', 308215),
(12, 'Main Street Depot', 'Main Street Depot is a very famous fusion supplier with the famous dish Matanzas', 'Matanzas', 'Parin1957@armyspy.com', 65, 87221272, '6 Joo Koon Crescent', 308215),
(13, 'Perryville Inn', 'Perryville Inn is a very famous western supplier with the famous dish Collaguasi', 'Collaguasi', 'Parin1957@armyspy.com', 65, 87221272, '32 Tuas View Loop', 308215),
(14, 'Ester C CO', 'Ester C CO is a very famous beverage supplier with the famous dish Chilacaya', 'Chilacaya', 'Parin1957@armyspy.com', 65, 87221272, '3016 Bedok Nth Ave 4 #01-03', 308215),
(15, 'Natural Pharmacy', 'Natural Pharmacy is a very famous beverage supplier with the famous dish Loncopahue', 'Loncopahue', 'Parin1957@armyspy.com', 65, 87221272, '15 Pioneer Sector 2', 308215),
(16, 'NW Core Collection', 'NW Core Collection is a very famous western supplier with the famous dish Mocopulle', 'Mocopulle', 'Parin1957@armyspy.com', 65, 87221272, '51 Tuas Ave 1 Singapore 639501 ', 308215);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dish_id`),
  ADD KEY `dish_name` (`dish_name`,`vendor_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `dish_order`
--
ALTER TABLE `dish_order`
  ADD PRIMARY KEY (`dish_id`,`vendor_id`,`order_id`),
  ADD KEY `dish_quantity` (`dish_quantity`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `favourite_supplier`
--
ALTER TABLE `favourite_supplier`
  ADD PRIMARY KEY (`vendor_id`,`supplier_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`supplier_id`,`ingredient_name`),
  ADD KEY `ingredient_type` (`category`),
  ADD KEY `unit` (`supply_unit`),
  ADD KEY `ingredient_name` (`ingredient_name`),
  ADD KEY `offered_price` (`offered_price`);

--
-- Indexes for table `ingredient_quantity`
--
ALTER TABLE `ingredient_quantity`
  ADD PRIMARY KEY (`dish_id`,`ingredient_name`,`vendor_id`,`supplier_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `ingredient_template`
--
ALTER TABLE `ingredient_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `selected` (`selected`);
ALTER TABLE `ingredient_template` ADD FULLTEXT KEY `template_description` (`template_description`);

--
-- Indexes for table `ingredient_template_quantity`
--
ALTER TABLE `ingredient_template_quantity`
  ADD PRIMARY KEY (`template_id`,`ingredient_name`,`vendor_id`,`supplier_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`,`vendor_id`),
  ADD KEY `total_price` (`total_final_price`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `orderline`
--
ALTER TABLE `orderline`
  ADD PRIMARY KEY (`vendor_id`,`order_id`,`supplier_id`,`ingredient_name`),
  ADD KEY `price` (`price`,`quantity`),
  ADD KEY `buffer_percentage` (`buffer_percentage`);

--
-- Indexes for table `order_template`
--
ALTER TABLE `order_template`
  ADD PRIMARY KEY (`order_id`,`vendor_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_name` (`supplier_name`),
  ADD KEY `supplier_type` (`supplier_type`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `template_quantity`
--
ALTER TABLE `template_quantity`
  ADD PRIMARY KEY (`order_id`,`dish_id`,`dish_quantity`),
  ADD KEY `dish_quantity` (`dish_quantity`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`value1`),
  ADD KEY `value2` (`value2`,`value3`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`),
  ADD KEY `vendor_name` (`vendor_name`,`vendor_description`),
  ADD KEY `password` (`password`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `dish_order`
--
ALTER TABLE `dish_order`
  ADD CONSTRAINT `dish_order_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  ADD CONSTRAINT `dish_order_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `ingredient_quantity`
--
ALTER TABLE `ingredient_quantity`
  ADD CONSTRAINT `ingredient_quantity_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  ADD CONSTRAINT `ingredient_quantity_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  ADD CONSTRAINT `ingredient_quantity_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `order_template`
--
ALTER TABLE `order_template`
  ADD CONSTRAINT `order_template_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`);

--
-- Constraints for table `template_quantity`
--
ALTER TABLE `template_quantity`
  ADD CONSTRAINT `template_quantity_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
