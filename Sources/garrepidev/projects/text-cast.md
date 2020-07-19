---
title: Text Cast
image_url: https://cdn.discordapp.com/attachments/513098379924996097/583320058370064404/IMG_5631.PNG
abstract: Put text from your phone on your chromecast
tags: swift, iOS App
---
# textcast
Put text from your phone on your chromecast

#### iphone
<img src="https://cdn.discordapp.com/attachments/513098379924996097/583320058370064404/IMG_5631.PNG" width="350"> </img>


#### chromecast
<img src="https://cdn.discordapp.com/attachments/513098379924996097/583320005760909332/renderedImage752199165.png" width="900"></img>


### How it works

1. Grab text from the user
2. Overlay the text on an image
3. Save the image into file manager
4. Start a localized server on the phone
5. Send the chromecast the phone's socket address and path to the image combined into a URL

### Why is it so complicated?

Without a static url, registered application, and chomecast developer license, the only thing you can send to a chromecast through their api is a link to media. Their documentation doesn't specify what media is acceptable but in the API, you specify media type by using [MIME notation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types). I tried out a ton of these, thinking it was an easy way out, but only image types and video types are allowed.

### How was it done?

So far, we know that you can only send **URLs** to the chromecast that point to **images** or **videos**.

Let's solve the first problem -- URLs.

To send the chromecast a viable URL, we have to either have a domain or a local server. I don't have the former so I used the latter. I found [swifter](https://github.com/httpswift/swifter) which is a great way to run a small server... although, their documentation could use some work. Because we're accessing the server from another device, we have to use the IP address as the URL (not localhost). There is no built in function for retrieving the iphone's IP address. So I used a C function to get the address from interface `en0`, the iphone's wifi interface. So now we have our URL to send the chomecast: `http://IP:Port`.

Onto the next problem -- Media.

Initially, I thought you could send any link to a chromecast and it would display. I spent a lot of time working on generating html pages with the correct font, color, etc. everytime the user updated text. I was half correct. A chromecast *can* display webpages but you have to register it on the development console. I paid the $5 and thought it would work. But there's an issue, you must provide a static IP address.

<img src="https://cdn.discordapp.com/attachments/513098379924996097/583317062655541248/Screen_Shot_2019-05-29_at_11.33.38_AM.png" width="500"></img>

After wasting $5, I knew the only thing I could do was send images or videos to the device. So I decided to take the text from the user, render it overtop of an image, save the image, expose the directory to the server, and send the URL of the image to the chromecast.

A minor complication:
When you connect to the chromecast and send the URL to the image (let's say the URL is `192.168.1.113:9080/files/renderedImage.png`), it works great. When the user changes the text, the old image is overwritten with a new one containing the new text but same name `renderedImage.png`. But, after doing that, the url is still the same. When you send the url to the chromecast again, it will pull the webpage from it's cache (if you didn't disconnect to the chromecast). So all subsequent changes to the text wouldn't appear. To solve that problem, the image's name is no longer `renderedImage.png`; it is now `renderedImage` + a random number + `.png`. Now each update to the text sends a new url to the chromecast and everything works perfectly. However, with different file names, a user could end up having 100+ images saved to their phone because we aren't overwriting anything. To solve *that* problem, the directory is scanned before saving a new image. Every file found is deleted then the new image is saved.

That's it. The app works now on any device, anywhere.

