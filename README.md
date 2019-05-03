# The Construct
**This is the construct. It's our rails template, it has almost everything. From beautiful layout to production ready setup, javascript components and good practices to learn.**

## Getting started
```
$ git clone https://github.com/lazaronixon/the_construct.git
$ rails new awesome-rails -d=postgresql --webpack=stimulus -m ~/RailsProjects/the_construct/template.rb
```

## Features
* [Stisla Admin Template](https://demo.getstisla.com)
* [TurboLinks](https://github.com/turbolinks/turbolinks)
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [Scaffolds](https://guides.rubyonrails.org/command_line.html#rails-generate)
* [Heroku Ready](https://heroku.com)
* [Hybrid Mobile Architecture Ready](https://m.signalvnoise.com/basecamp-3-for-ios-hybrid-architecture)
* [DHH development practices](https://www.youtube.com/channel/UCdx5Dk3EWTe2i8YDA7bfl6g)

### Stisla Admin Template
The construct integrates Stisla Admin Template with modern rails ecosystem tools like Webpack, Turbolinks and Stimulus JS, bringing a sophisticated implementation and maximum performance without SPA hassle.

### Scaffolds
The construct replaces default scaffold template with a new one focused on production. Some features are:
* [Sortable and filterable index page](https://github.com/activerecord-hackery/ransack)
* [Infinite scroll table](https://github.com/basecamp/geared_pagination)
* [Exportable data](https://github.com/westonganger/spreadsheet_architect)
* [Date Picker on date/datetime fields](https://demo.getstisla.com/forms-advanced-form.html)
* [Number Mask on float/decimal fields](https://demo.getstisla.com/forms-advanced-form.html)
* [Select with autocomplete on references fields](https://demo.getstisla.com/forms-advanced-form.html)
* [Toastr plugin to show flash messages](https://demo.getstisla.com/modules-toastr.html)
* [HTML5 client side validation integration](https://demo.getstisla.com/forms-validation.html)
* Ajax form post with turbolinks handlers
* Self generated system tests

### Heroku Ready
The construct comes with some opinionated configurations and addons that should be on any production application like:
* [MemCachier](https://elements.heroku.com/addons/memcachier) for caching.
* [Scout](https://elements.heroku.com/addons/scout) for Monitoring.
* [Redis Cloud](https://elements.heroku.com/addons/rediscloud) or any other for memory data store.
* [PaperTrail](https://elements.heroku.com/addons/papertrail) or any other for logging.
* [SendGrid](https://elements.heroku.com/addons/sendgrid) for email delivery.
* AssetHost configured to ENV['CLOUDFRONT_URL'].
* Sidekiq as queue adapter.
* [RackAttack](https://github.com/kickstarter/rack-attack) for blocking & throttling abusive requests.
* Force SSL.

### Hybrid Mobile Architecture Ready
The construct is a [majestic monolith](https://m.signalvnoise.com/the-majestic-monolith) template so it is full compatible with [TurboLinks IOS](https://github.com/turbolinks/turbolinks-ios), [TurboLinks Android](https://github.com/turbolinks/turbolinks-android) or [React Native TurboLinks](https://github.com/lazaronixon/react-native-turbolinks). After create a new project you can easily port it to a IOS/Android APP.

### Requirements
Rails >= 6
