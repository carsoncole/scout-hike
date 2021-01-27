# Scout Hike

Scout Hike is a Ruby on Rails application is for managing a Unit hike event, with a set goal and time period. 

The code is written for one unit as a single tenent application. See 'Updates Required' below to tailor it for your use.

Carson Cole

## Requirements

Ruby 2.7.1, Rails 6.0, PosgreSQL; SMTP email account needed for password resets.

## Installation

This is a Ruby on Rails 6.0 application. It has been tested and easily deployed on Heroku, configured using PosgreSQL for the database.

## Updates Required

The following needs to be individually configured.

- File assets/images/hike-v3.png should be replaced with unit specific image.
- A Unit should be manually created. This single Unit holds settings for the application specific to the Unit/Challenge.
- Mail SMTP settings need to be updated in production.rb.
