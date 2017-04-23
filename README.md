# CookpadPhotoViewer

Hello cookpad crew! My name is Aymen and this is my version of the cookpad photo viewer app and I hope you'll like it.

I'm studying computer science so I don't have any design/UX basics learned from school, 
so it's possible that time to time I design an experience or UI that is not that relevant for the context. 
Sorry for that 🤣.

Being busy there and there, I was not able to make a complete app with all the features I wanted, but I did my best 
making it usable with a good user experience easy to use and responsive, while showing you what I’m able and willing do to 
if I were working with you.

<p align="center">
<img src="/GithubScreenshots/Splash.png" width=250/>
<img src="/GithubScreenshots/Explore.png" width=250/>
<img src="/GithubScreenshots/Detail.png" width=250/>
</p>


## Some interesting things to explore in the app : 
* The design : usually, I use the Sketch app for designing all kind of stuff for my side projects. I didn’t use it for 
this project because of the time constraint, so I designed the app on the go, changing the UI every time I got an idea, 
it was a bit time consuming but the results is here. <br/>I tried to use cookpad colors and create a photo app viewer related 
to food so maybe you feel connected with the app, or even gives you inspirations for the cookpad mobile apps improvements. 
<br/>I wanted to put UX  in the forefront, that’s why I used the GlidingCollection github library 
that allows me to have this cool experience on the Explore screen, giving you the ability to switch 
between categories such as Starters, Main Courses and Dessert. Or even a bit of Size Class for displaying for example bigger text on iPad.

* The use of animations for improving the UX : I used a few animations in this app. The first one is the one you see when 
launching the screen. A lot of vegetable are emitted. It’s called Particle Animations and usually they are used for 
effects like fire, rain, snow ( see my example demo there if you’re curious : https://github.com/Aymenworks/particle-animations ). 
<br/>I used them in the first screen so I can distract the user while the data are fetching and being prepared for 
the next screen ( duration : 3 seconds of animations ). Then , I discovered an amazing library for screen transition, called Hero. It’s the animation I use from the Explore view to the photo detail screen.

* The combo MVVM/RxSwift where all the logics is done on the view model and we don't have a Massive View Controller anymore ( even if it can happen! )

* Dependency injection with Swinject because it allows me to switch easily between Stubs and Networks services ( by using Xcode schemes )
* Responsiveness thanks to the Haneke github library that handle image caching.


## This is the things I wish I would have implemented but didn’t have the time for : 
* Fetching new photos after before arriving to the end of the list.
* Handling the errors : Actually there is an `error` observable property in the view model. We can for example observe it and display a small notification saying that something’s wrong or a view with the error and a refresh/retry button..
* Handling empty photos : what do you suggest ?
* Pinch gesture on the photo detail screen
* A custom and cool scroll to refresh animation like this one : https://github.com/Yalantis/PullToMakeSoup
