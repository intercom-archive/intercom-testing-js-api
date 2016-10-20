[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Testing Intercom Javascript API

- This app allows testing of the [Intercom Javascript API](http://docs.intercom.io/intercom-javascript-api)
- Allows for testing visitors via Acquire and users
- Remember that the chat icon only shows if you have the appropriate subscriptions
	- [Acquire](https://www.intercom.io/live-chat) is needed to show it to visitors
	- [Resolve](https://www.intercom.io/customer-support) is needed to show it to users


## Environment variables
- This app allows for unlimited number of apps but they need to be configured via an environment file
- Sample variables
	- `APP1`: app_id of your 1st app
	- `APP1_NAME`: name of 1st app (for easy reference)
	- `APP1_SECRET`: secret key for secure mode of the 1st app
	- `APP2`: app_id of your 2nd app
	- `APP2_NAME`: name of 2nd app (for easy reference)
	- `APP2_SECRET`: secret key for secure mode of the 2nd app
	- `APP3`: app_id of your 3rd app
	- `APP3_NAME`: name of 3rd app (for easy reference)
	- `APP3_SECRET`: secret key for secure mode of the 3rd app
	- ...

### Setting up environment variables in a local install
- Create a `.env` file and populate it accordingly
- Sample file
```
APP1="abcd1234"
APP1_NAME="Production app"
APP1_SECRET="abcde12345abcde12345abcde12345abcde"
APP2="1234abcd"
APP2_NAME="Test app"
APP2_SECRET=""
```

## Setup

### Local Install via command line
- Install bundler for depedency management: `gem install bundler`
- Install dependencies: `bundle install`
- Setup environment variables as detailed in section above
- Run: `ruby app.rb`
- Open http://localhost:4567/

### Local Install with Pow
- Install Pow: http://pow.cx
- Go to Pow directory and set up the link to this directory
	- `cd ~/.pow`
	- `ln -s ~/src/intercom-testing-js-api intercomtest`
- Setup environment variables as detailed in section above
- open http://intercomtest.dev

### Heroku 
- Click the "Deploy to Heroku button"
- Be warned that Acquire depends on the Messenger being able to create a first-party cookie for *.customer-domain.com. This will fail (with modern browsers) on *.customer-app.firebaseapp.com and *.customer-app.herokuapp.com, or any domain registered as a public suffix, https://publicsuffix.org [[Source - Intercom Docs](https://docs.intercom.com/install-on-your-product-or-site/quick-install/install-intercom-acquire-on-your-website)]

## Demo

![Demo](demo.gif)