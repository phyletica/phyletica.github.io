---
layout: post
title: Dismounting the Lion
excerpt: "Giving up on Mac OSX."
author: jamie_oaks
tags: [computing, mac, mountain lion, osx, ubuntu]
comments: true
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

Let me preface this post by saying that I have been a long-time, avid mac user. I love their hardware and, until recently, their line of felid operating systems. This all changed when Apple made a dubious design decision to make their OS more like their ever-proliferating cash cow, iOS. While this is fine for casual users and iOS-app-oriented developers, for non-iOS-oriented developers, this is a tragedy.

My frustrations with this unfortunate trend culminated when I recently upgraded to the most recent feline OS release, *Puma concolor*---the mountain lion. I became a Mac user during the year of the jaguar (10.2). From there, I happily upgraded through four cat species; my applications left in their place and my user environment the way I liked it. I loved my Mac. It provided an elegant desktop environment atop a flexible and powerful UNIX-based Darwin core.

That started to change when I upgraded to Lion (10.7). My user environment was left intact, but there were some annoyances. Automatic local backups? I use remote [`Git`][1] repositories for just about everything, and keep multiple system-wide backups to external drives. Why in the world would I want to clutter my disk space with backups that will vanish along with the originals when the drive fails anyway? And then there was Launchpad... I can not imagine a more cumbersome way of launching an application. Backwards scrolling?! Come on! Yes, there were annoyances, but with minimal effort of changing system preferences, I was rolling again and happy. My applications were in place and my development environment was how I like it.

Then, I upgraded to Mountain Lion. I boot up and launch Terminal to enter my Bash environment... What's this? You don't know what virtualenvwrapper is? Hmmm, that's weird. I better check my [`Python`][2] environment to see what's going on. Oh wait, my entire [`Python`][2] environment is **gone**, site-packages directories **empty**. That is going to be a huge pain to replace, I better start pulling down my [`Git`][1] repositories... What?! No [`Git`][1]? NO GIT?!?!

At this point I am furious. If you don't understand why, let me explain. [`Git`][1] is not a luxury in my life. Oh no, it is essential. I reckon on some days I strike those three beautiful keys, g-i-t, more times than I contract my diaphragm to replenish the supply of oxygen in my bloodstream. I digress.

If having [`Python`][2] and [`Git`][1] obliterated was not bad enough (and it most certainly is far worse than bad enough), I find that several of my applications have been "blacklisted" and sentenced to reside in directory of untrustworthy software. Thanks for "looking out" for me Apple, but I have been using those apps for years, and I quite like them. All of this pain and misery and my desktop environment looks *exactly* the same as it did in Lion; is this some kind of cruel joke? I wasn't laughing. Within five minutes of "upgrading" to Mountain Lion, I was restoring my hard drive from a backup I had made before embarking on this terrible and short-lived journey. The nightmare was over.

I've heard the Ubuntu desktop is looking elegant these days...

 [1]: http://git-scm.com/
 [2]: http://www.python.org/
