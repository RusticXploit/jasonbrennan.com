---
layout: "../../layouts/BlogPost.astro"
title: "Why I alias the shutdown command on my linux workstations"
description: "Why I alias the shutdown command on my linux workstations"
pubDate: "Nov 19 2022"
---

Have you ever accidentally shutdown a production webster using this command?

```
$ shutdown now
```

I work in the terminal all day so naturally, at the end of my workday I use the command line to shutdown my machine.

I will typically have anywhere from 4 to 8 tabs open that &dash; descpite my best efforts to disconnect &dash; could be still connected to a remote machine.

And on occasion when I'm in a hurry checking to see that all of my code is saved, commited, and pushed; I've accidentally run shutdown on a a remote machine, and when you do it you have a really deep sinking feeling in your gut.

My solution was to force a change in my daily habbits. The action to shutdown my local machine needed to be different than the action to shutdown a remote machine.

I added the lines below to the end of my ~/.bashrc file.

```
alias shutdown="echo 'You must call \"sd\" to shutdown this machine.'"
alias reboot="echo 'You must call \"rb\" to reboot this machine.'"
alias sd="/usr/sbin/shutdown"
alias rb="/usr/sbin/reboot"
```

It's been a little over a year since I added this and I think it took about a week before I instinctavely knew what to type without having to think about it.

I was doing some work on a development server a few days ago and had to leave in a bit of a hurry. When I came back to my desk later that night to put away my laptop I had a single terminal open and I ran:

```
$ sd now
```

I was still connected to that remote dev server. It through an error for an unrecognized command and it was obviouse that for the first time setting up those aliases was worth it.
