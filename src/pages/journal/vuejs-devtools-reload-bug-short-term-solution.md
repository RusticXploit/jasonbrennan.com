---
layout: "../../layouts/BlogPost.astro"
title: "VueJS devtools reload bug - short term solution"
description: "After an update to firefox I started experiencing a bug that was causing the vuejs dev tools to relaod over and over"
pubDate: "Dec 8 2022"
---

I work with VueJS daily and for the last month something has been causing the [Vue Devtools](https://devtools.vuejs.org/) to reload at a seemingly random interval of time. 

At first knowing that a  [Github issue had been created](https://github.com/vuejs/devtools/issues/1974) I resorted to using Google Chrome for a week or so. But I value my battery life and don't care to listen the the fans in my laptop spin up all the time.

## Proposed fix for Vue Devtools
[dmke](https://github.com/dmke) has created a [pull request](https://github.com/vuejs/devtools/pull/2000/files) that he claims has fixed the issue but it hasn't been merged and I wasn't able to quickly (5 minutes) figure out how to build the project.

I tried downloading the current version of Vue Devtools and making the suggested changes to the manifest file but wasn't able to install it even after removing the old versions.

Here are the steps I took, but again I wasn't able to get this to install.

```
wget 'https://addons.mozilla.org/firefox/downloads/file/4017333/vue_js_devtools-6.4.5.xpi'
```

modify the manifest.json
```diff
-    "persistent": false
+    "persistent": true
```

repackage and install
```
zip -r -FS ../vue_js_devtools_custom-6.4.5.xpi * --exclude '*.git*'
```


## How I fixed Vue Devtools for me!

The project I work on the most is still on Vue2 so I was able to download an [older version of Vue Devtools](https://github.com/vuejs/vue-devtools/releases/download/v5.3.3/vuejs_devtools-5.3.4-fx.xpi) and (temporarily) disable auto updates for Firefox extensions.

I'll keep checking on the Github issue so I can get this resolved for good but this has been a good work around.
