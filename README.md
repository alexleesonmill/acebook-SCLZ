# AceBook
[![Build Status](https://travis-ci.com/alexleesonmill/acebook-SCLZ.svg?branch=master)](https://travis-ci.com/alexleesonmill/acebook-SCLZ)
[![Maintainability](https://api.codeclimate.com/v1/badges/8524b45c42b0c111b44b/maintainability)](https://codeclimate.com/github/alexleesonmill/acebook-SCLZ/maintainability)

[Information](#Information) | [Quickstart](#Quickstart) | [Running Tests](#Running-Tests) | [Planning](#Planning)  [Technologies](#Technologies) | [Team SCLZ](#Team-SCLZ)

## Information

#### Our project is deployed on Heroku [here](https://sclz.herokuapp.com/).

We used [Github Projects](https://github.com/alexleesonmill/acebook-SCLZ/projects) for planning.

We used [Github Wiki](https://github.com/alexleesonmill/acebook-SCLZ/wiki) for relevant information we found whilst working on SCLZ.


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Running Tests
from root folder, run the following command
```bash
$ rspec 
```

## Planning
We spent the first two days of the project planning and diagramming. The details of our user stories, planning and diagramming can be found in our [wiki](https://github.com/alexleesonmill/acebook-SCLZ/wiki).

## Technologies

| Area                 | Technology                 |
| -------------------- | -------------------------- |
| Frameworks           | Ruby on Rails              |
| Languages            | Ruby, Javascript (jQuery), HTML5, CSS3|
| Database             | PostgreSQL                 |
| CI/CD                | Travis                     |
| Hosting              | Heroku                     |
| Storage              | Dev: Local / Heroku: AWS S3|
| Testing and Coverage | RSpec, Capybara, Simplecov |

## Team-SCLZ

Our wonderful team was made up of:

- [Alex Leeson-Mill](https://github.com/alexleesonmill)
- [Adam Grieve](https://github.com/AdamusBG)
- [Chris Walsh](https://github.com/Walshy92)
- [Georgie Horth](https://github.com/horthbynorthwest)
