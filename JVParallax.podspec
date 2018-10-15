#
# Be sure to run `pod lib lint JVParallax.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JVParallax'
  s.version          = '1.0.1'
  s.summary          = 'Parallax any UIView subclasses.'

  s.description      = "JVParallax is a simple way of parallaxing any type of View."

  s.homepage         = 'https://github.com/Sali0m/JVParallax'
  s.screenshots     = 'http://www.saliom.be/githubImg/JVParallax.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sali0m' => 'jehan.vossen@gmail.com' }
  s.source           = { :git => 'https://github.com/Sali0m/JVParallax.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Sali0m'
  s.swift_version    = '4.1'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JVParallax/Classes/**/*'
end
