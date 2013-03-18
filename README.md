# facebook_js

`facebook_js` is just a way for me to not have to deal with integrating [Facebook Javascript SDK][1] again by manually copy-paste all the necessary code.  It also adds the require `channel.html` link to the app with proper caching headers.

## Installation

In your Gemfile, add `gem 'facebook_js'`, then, `bundle install`.

## Configurations

First, you have to create a file named `facebook_js.rb` under your `config/initializers/` directory.

    FacebookJs.app_id = '12345' # Facebook app id (required)
    FacebookJs.domain = 'localhost:3000' # the domain to be used to locate your `/channel.html` file (required)
    FacebookJs.locale = 'en_US' # supported locale (optional)
    FacebookJs.status = true # check the login status upon init? (optional)
    FacebookJs.cookie = true # set sessions cookies to allow your server to access the session? (optional)
    FacebookJs.xfbml = true # parse XFBML tags on this page? (optional)
    FacebookJs.debug = !Rails.env.production? # to start the FB JS script in debug mode (optional)

Check out the list of available locales on Facebook [here][2].

## Usage

Once you have the gem installed, you should have the convenient `facebook_js` hepler.  On your layout, just use:

    = facebook_js

If you want to have additional initialization code, just do this:

    = facebook_js do
      // javascript
      alert('Hello, world!!!');

##License

MIT License. See LICENSE for details.

[1]: https://developers.facebook.com/docs/reference/javascript/
[2]: https://www.facebook.com/translations/FacebookLocales.xml