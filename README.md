# README

# E-Commerce System
* ## Introduction
In this project we build a E-Commerce System based on the users interaction. It essentially work for seller and buyer. We used Paypal for payment integeration. It contains two types of users
- Seller which can sell products, edit, delete their own products
- Buyer can who can purchase desired products and make payment to system
## Features
- A Buyer can subscribe to many plans and plans can have many features
- Each product has product name and unit price
- Each buyer can make payment to system
- Each buyer can avail 5 percent discount on its first order
- Each seller can create multiple products
- Each seller can get notification through email if any product is purchased
- Each buyer can get notification through email if price any product in his wishlist get updated
## Tech
- RubyOnRails - For handling MVC!
- VS Code Editor - awesome web-based text editor
- PG - PostgreSql database
- Bootstrap - great UI boilerplate for modern web apps
## Models
- User can have one account for seller and buyer.
- Products should be create, edit, and delete.
- An order can multiple products in it.
- Paypal to make payment to system.
- Comment feature to add multiple commit to corresponding products.
## Installation
- Use Git clone to clone the repository to the local machine
- bundle install
-    Use rake db/setup to create db and seed add into it
 -   Start server using rails s
 -   Run loaclhost:3000
 -   Any user can log into system by creating account through sign up page
 -   Add paypal credentials to make payment


