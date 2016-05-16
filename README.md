# JVParallax
![example](http://www.saliom.be/githubImg/JVParallax.gif)

JVParallax is a simple way of parallaxing any type of View.

## Installation

`CocoaPods` will be coming soon

For now import the file JVParallaxView.swift in your project. And for easier use import also the JVScrollViewParallaxBehavior.swift

## Usage

### ParallaxView
You can setup the `ParallaxView` in you interfaceBuilder file by creating a view and setting it as a `ParallaxView`, then setting the view you want to have the parallax effect inside that `ParallaxView`. Don't forget to link the view you want to have the effect to the parallaxView under the  `viewToParallax` property.

You can also create your `ParallaxView`in code and set everything in code.

Once you did setup your `ParallaxView` all you need next is to calculate a percentage from 0 to 1 of the parallaxValue and set it at the `value` property of your `ParallaxView`. Perform the calculation in the viewDidScroll of you `UIScrollView` or any other moving callback (in case you want to do it with touches event instead of `UIScrollView`).

As of `UIScrollView` there is the JVScrollViewParallaxBehavior.swift to help you out with it. See below for more information.

#### Notice
Any `UILayoutConstraint` you set on the `viewToParallax` property will be removed and replaced by `ParallaxView`.


### JVScrollViewParallaxBehavior
You can use this file to help you out when calculating the percentage of parallax value.

You can setup the behavior by importing it in your interfaceBuilder file as an Object and setting it as a `JVScrollViewParallaxBehavior`. Then you need to bind the `scrollView` property to the scrollView containing the `ParallaxView`. You also need to bind all the `ParallaxView` you wish to have the effect inside that scrollView.

You can set the Behavior as the delegate of your scrollView if you don't need the callbacks, or you can simply pass it along yourself like so.

```    
func scrollViewDidScroll(scrollView: UIScrollView) {
  self.parallaxBehavior.scrollViewDidScroll(scrollView)
}
```

To do so you'll need to bind the behavior to your ViewController containing the scrollView. With all this you should be set to start.



For more information check out the project and run it.
