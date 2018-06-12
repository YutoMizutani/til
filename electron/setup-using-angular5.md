# Angular 5 Electron Tutorial

[Angular 5 Electron Tutorial](https://coursetro.com/posts/code/125/Angular-5-Electron-Tutorial)

# Starting the Project
The first step is to install Angular, and then Electron.

We're going to use the Angular CLI (Command Line Interface) tool to start a new Angular project.

Let's install that first, and then use it to start the new project and hop into the folder:

```
$ npm install -g @angular/cli
$ ng new ang-electron
$ cd ang-electron
```
Next, while we're here in the console and within the project folder, let's install Electron:

```
$ npm install electron --save-dev
```

# Connecting Electron and Angular
At this point, our folder is only capable of running an Angular project. We have a few adjustments to make to ensure our Electron app uses Angular.

First, as with any Electron app, we have to create a main.js file which gets our Electron app up and running with some default settings.

In the project root folder, create a main.js file and paste the following contents (Note: This is from the official QuickStart Doc page from Electron, but I have made some slight edits):

```js
const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')

let win

function createWindow () {
  win = new BrowserWindow({width: 800, height: 600})

  // load the dist folder from Angular
  win.loadURL(url.format({
    pathname: path.join(__dirname, 'dist/index.html'),
    protocol: 'file:',
    slashes: true
  }))

  // Open the DevTools optionally:
  // win.webContents.openDevTools()

  win.on('closed', () => {
    win = null
  })
}

app.on('ready', createWindow)


app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (win === null) {
    createWindow()
  }
})
```

With exception to removing some of the comments from the QuickStart page, the one area you must change is on line 12 from above (it's already changed in the above example), which loads the dist/index.html file when a build is created from Angular.

Save this file, and then visit the /src/index.html file and change:

```html
<!-- CHANGE FROM: -->
  <base href="/">

<!-- TO: -->
  <base href="./">
```
If you don't make this change, Electron will not be able to find the Angular files.

Finally, we have to visit the /package.json file to make some minor adjustments as shown below:

```json
{
  // Other properties removed for brevity

  "main": "main.js",       // Add this line

  "scripts": {
    // Other properties removed for brevity

    "electron": "ng build && electron .",
    "electron-aot": "ng build --prod && electron .",
  },

  // Other properties removed for brevity
}
```

We're first adding a new property called main, which designates Electron's main.js file as the value.

Next, we're adding a new npm run command called electron, which first uses the Angular CLI to create a build for our Angular app, and then calls upon electron to launch the app.

You will also notice electron-aot, and this command adds the --prod flag to Angular, which creates a production build of the App. This introduces a number of performance enhancements, but it does take longer to build the project.

Note: When you're ready to create an app build for others to use, make sure you use electron-aot.

# Running the Project
At this point, both Electron and Angular 5 should play nice together.

Visit your console and type:

```
$ npm run electron
```

If all goes smooth, your new Angular-powered Electron desktop app should load!

# Accessing Electron API from Angular

At this point, you may or may not need to access any of the Electron API functionality, depending on the needs of your app. If it's intermediate to advanced in terms of functionality and complexity, you will probably need to access the Electron API. This will give you access to the native desktop features that Electron allows.

There's a quick and easy way to gain access to the API, which is through a package called ngx-electron.

Let's install it from the console:

```
$ npm install ngx-electron --save
```

Now, like any other module, it has to be added to the imports array in /src/app/app.module.ts:

```ts
// Other imports removed for brevity

import { NgxElectronModule } from 'ngx-electron';

@NgModule({
  ...
  imports: [
    BrowserModule,
    NgxElectronModule   // Add it here
  ],
  ...
})
export class AppModule { }
```

To use it, let's open up /src/app/app.component.ts and add the following to the imports:

```ts
import { Component } from '@angular/core';
import { ElectronService } from 'ngx-electron';
```

Then, in the component class, we create an instance of it through dependency injection, which will give us access to a variety of methods for interacting with the API:

```ts
export class AppComponent {

  constructor(private _electronService: ElectronService) {}   // DI

  launchWindow() {
    this._electronService.shell.openExternal('https://coursetro.com');
  }

}
```

I've created a method called launchWindow(). When a button is clicked, this will launch a browser window with the Coursetro.com site. This is just to demonstrate that ngx-electron works.

It provides you with the following functionality (Visit their Github for more info):

- desktopCapturer: Electron.DesktopCapturer - Electron's desktop capturing API
- ipcRenderer: Electron.IpcRenderer - Electron IpcRenderer
- remote: Electron.Remote - Electron Remote capabilities
- webFrame: Electron.WebFrame - Electron WebFrame
- clipboard: Electron.Clipboard - Clipboard API
- crashReporter: Electron.CrashReporter - Electron's CrashReporter
- process: NodeJS.Process - Electron's Process Object
- screen: Electron.Screen - Electron's Screen API
- shell: Electron.Shell - Electron's Shell API
- nativeImage: Electron.NativeImage - Electron's NativeImage API
- isElectronApp: boolean - Indicates if app is being executed inside of electron or not
Open up /src/app/app.component.html and replace the boilerplate HTML with the following:

```html
<div style="text-align:center">
  <h1>
    Welcome!
  </h1>

  <button (click)="launchWindow()">Launch a Window</button>
</div>
```

# Running it
Now, go ahead and give it a go by running the following command in the console:

```
$ npm run electron
```

Click the Launch a Window button and it should load up your default browser with the Coursetro site!

And that's how you integrate Angular 5 with Electron, while also gaining access to the Electron API.


[Angular 5 Electron Tutorial](https://coursetro.com/posts/code/125/Angular-5-Electron-Tutorial)
