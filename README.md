iOSHUB
======
* InstagramSample is a sample app that illustrates the ways in which you a user can post a photo from their app to Instagram using IG hook.

The whole process to integrate Instagram API in your app is described here:
http://mindfiremobile.wordpress.com/2014/02/02/how-to-integrate-instagram-into-ios-application-and-share-photo-with-it/#more-692

in addition to this, you can use the code sample “InstagramSample”.

— ViewController is the controller which contains “LogIn with Instagram” button clicking on which redirects the user to the next controller.

— The next controller “SignInViewController” contains a web view that loads the Instagram login screen. When the user enters the Instagram username and password and sign in, an access token is provided by the Instagram using which the user can access the information (name, profile pic etc) of the logged in user.

— The next controller, “PostToInstagramViewController” calls the IG hook when ‘Post to Instagram’ button is clicked and the photo is posted to the Instagram.
