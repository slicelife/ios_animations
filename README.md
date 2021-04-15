# Animations [![Actions Status](https://github.com/mikelrob/Animations/workflows/Swift/badge.svg)](https://github.com/mikelrob/Animations/actions)

Animations provide a small number of wrappers around UIKit that I think are nice to have when writing animation code.

`Animation` is a wrapper around `UIView.animate`  that provides an interface to chain animations.

The `AnimationCoordinator` provides a interface to coordinate multiple `UIViewPropertyAnimator`s alongside each other.


## Installation

### SPM

Either:

1. In your Package.swift:

```
.package(url: "git@github.com:slicelife/ios_animations.git", from: "1.1.0"),

```

2. Add to Xcode project via Project settings.

NB. As we are using a private repo, we need to rely on git and ssh to provide us and the CI access to the source code. Ensure to use the git clone URL rather than the https one.

### Cocoapods

To specify in your `Podfile` ensure to use our Slice Private Pod Repo then specify the pod by name:

```
source 'git@github.com:slicelife/pods-ios.git'
...

pod 'Animations', '~> 1.1.0'

```