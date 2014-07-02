# JqAjaxCore2

This is the version of the friends_ajax_core gem which was designed to provide an easy, clean and flexible solution after the built in 'link_to_remote', 'remote_function' and 'remote_form_for' helpers were dropped in Rails 3.

This gem provides some helpers and the required JS to keep ajax handling as simple as it was.

New Features of this updated versions are:

- Fully conigurable, every css selector, html data attribute etc. can be customized
- Full JS rewrite in CoffeeScript, nicely namespaced methods, cleaner code :-)
- Rails Engine which provides a small, yet useful controller for handling common Ajax-related actions
- NOW WORKS WITH TURBOLINKS

## Todo / Features coming soon
- Access session vars via JS
- Genric 'render :inline => "<%= ... %>" ' js helper for easy rendering view helpers
- Fully configurable loader display

## Installation

1. Add this line to your application's Gemfile:

      gem 'jqajax_core2'

  And then execute:

      $ bundle

  Or install it yourself as:

      $ gem install jqajax_core2

2. Add javascript to your application.js

      \/\/= require jqajax-core2

3. Add default styles to application.css
    
      *= require jqajax-core2

4. Add default elements to application.html.erb
     
      <%= include_jqajax_core %>

5. Add Engine to your Routes
    
      mount JqAjaxCore2::Engine => "/"

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
