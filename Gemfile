source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', "~> 2.3.0"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# extracts youtube vids id to be embedded!!
gem 'youtube_addy'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# --------------------------------------------------
# the previous gem come already bundled in a new rails application as standars
#
# - - - - BELOW ARE EXTRA GEMS INSTALLED BY ROSS DOWTHWAITE - candidate 18787 - - - 

# Handles authentication logic - https://github.com/binarylogic/authlogic - full ref at [43]
gem 'authlogic'

# not implemented
# Allows users to edit fields in place by double clicking the field - https://github.com/bernat/best_in_place
gem 'best_in_place', github: 'bernat/best_in_place'

# Datepicker - https://github.com/vanetten/jquery-timepicker-addon-rails  - full ref at [39]
gem "jquery-timepicker-addon-rails"

# - https://github.com/joliss/jquery-ui-rails 
gem 'jquery-ui-rails'

# file attachment gem - https://github.com/thoughtbot/paperclip - full ref at [41]
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# not currently implemented
# Allows pagination for large tables - https://github.com/mislav/will_paginate
gem 'will_paginate', '~> 3.0'

# Gives a collection of countries - https://github.com/stefanpenner/country_select - full ref at [36]
gem 'country_select'

# Searching gem - https://github.com/activerecord-hackery/ransack - full ref at [35]
gem 'ransack'

# Location gem - https://github.com/alexreisner/geocoder - full ref at [37]
gem "geocoder"

# Easy to use nested fiedl gem - https://github.com/lailsonbm/awesome_nested_fields - full ref at [42]
gem 'awesome_nested_fields'

# not implemented 
# Dynamic fields gem  - https://github.com/vollnhals/dependent-fields-rails 
gem 'dependent-fields-rails'

# Gem to parse text as urls and set them up as links - https://github.com/tenderlove/rails_autolink. [Accessed 11 May 14]. - full ref at [52]
gem "rails_autolink"

# ruby embedding in javascript code - https://github.com/cowboyd/therubyracer - full ref at [62]
gem "therubyracer" 

# https://github.com/metaskills/less-rails. - - full ref at [54]
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

# Twitter bootstrap styling - https://github.com/seyhunak/twitter-bootstrap-rails. - full ref at [53]
gem "twitter-bootstrap-rails"

# neeed to use twitter bootstrap - https://github.com/metaskills/less-rails-bootstrap. - full ref at [55]
gem 'less-rails-bootstrap'

# insert font awesom iconcs using less syntax - full ref at [56]
gem 'font-awesome-less'

# not implemented in the views
# more font icons - - full ref at [57]
gem 'font-icons-rails', :git=> 'git://github.com/shorelabs/font-icons-rails.git'

# enables fancy javascript datepickers - github.com/Nerian/bootstrap-datepicker-rails - full ref at [39]
gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails',
                              :git => 'git://github.com/Nerian/bootstrap-datepicker-rails.git'

# enables fancy javascript timepickers  - https://github.com/tispratik/bootstrap-timepicker-rails. - full ref at [58]
gem 'bootstrap-timepicker-rails', :require => 'bootstrap-timepicker-rails',
                              :git => 'git://github.com/tispratik/bootstrap-timepicker-rails.git' 

# Authentication Gem - https://github.com/mdarby/restful_acl - full ref at [45]
gem "restful_acl" 

# needed by Heroku - https://github.com/heroku/rails_12factor. - full ref at [59]
gem 'rails_12factor', group: :production

# date validation in model - https://github.com/adzap/validates_timeliness - full ref at [44]
gem 'validates_timeliness', '~> 3.0'
                                                 
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

group :development do
  # testing gem - overides rail standard testing classes - https://github.com/rspec/rspec-rails - full ref at [61]
  gem 'rspec-rails' 
  # generated ER diragrams through the command line - https://github.com/voormedia/rails-erd - full ref at [60]
  gem "rails-erd" 
  # redirects mail to open in browser for tesing purposes - https://github.com/ryanb/letter_opener - full ref at [40]
  gem "letter_opener" 
end

group :test do
  # testing gem - overides rail standard testing classes - https://github.com/rspec/rspec-rails - full ref at [61]
  gem 'rspec-rails'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

ruby "2.0.0"
