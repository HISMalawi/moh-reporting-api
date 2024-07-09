# Malawi HIV PROGRAM Reports

[![Gem Version](https://badge.fury.io/rb/your_gem_name.svg)](https://badge.fury.io/rb/your_gem_name)
[![Build Status](https://travis-ci.org/your_username/your_gem_name.svg?branch=master)](https://travis-ci.org/your_username/your_gem_name)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Description

This gem provides a simple way to generate reports for the Malawi HIV PROGRAM. It is designed to be used by the Ministry of Health and other stakeholders to generate reports for the program. The reports depend on OpenMRS data and are generated in a format that is easy to understand and use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'malaria_hiv_program_reports'
```

And then execute:

    $ bundle

Or install it yourself as:
    
    $ gem install malaria_hiv_program_reports
    
## Usage
Since it is just a library, you can use it in your application to generate reports. Here is an example of how to use it:

```ruby
MalariaHivProgramReports::Moh::Cohort::Report.new(start_date, end_date, location_id)
```

## Available Reports
The following reports are available in the system:
[Reports](app/README.md)

## Development
To begin contributing code, after you have cloned this repo. Run the following command
    
    $ bin/setup.sh

We recommend using Rubocop to ensure that your code is clean and easy to read. You can run Rubocop by running the following command:

    $ rubocop

To run the tests, you can run the following command:    
    
    $ rspec

To install dependencies, you can run the following command:

    $ bundle i

To check for outdated dependencies, you can run the following command:

    $ bundle out

To update dependencies, you can run the following command:
    
    $ bundle u


## Contributing
Bug reports and pull requests are welcome on GitHub.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
