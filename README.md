# cool_quotes

This is a gimic project to play with Chef. The purpose of the app is to display cool quotes.

The "static_app" folder is where static html pages are. I was going to try to do a rails app, but I wanted to first learn the basics of chef before trying to make a real app in Rails.

The "cool_quotes-webserver" folder is the cookbook which sets ups a webserver to host "cool quotes".

the "cool_quotes-env" folder is meant to be an ["environment cookbook"](http://blog.vialstudios.com/the-environment-cookbook-pattern/)

In my Chef world, I have the "webserver" role set to run the "cool_quotes-webserver" recipe. I set the cookbook versions for the chef environments directly from berkshelf.

I am using AWS. I have an instance of cool quotes app running here: http://52.40.35.197/


See also https://github.com/Thr4wn/devhelper
