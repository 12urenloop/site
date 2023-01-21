# Site

Site for 12urenloop Gent.

## Dev

A static site build with [nanoc](https://nanoc.ws/).

Things you might wanna do:

- install rbenv / ruby
- `gem install bundler`
- `bundle install`

Then run the code with `bundle exec nanoc` or `bundle exec nanoc live`.

## Deploy

1. SSH to root@asimov
2. cd ~/12urenloop-site, 
3. git pull
4. docker-compose build
5. docker-compose down && docker-compose up -d


## Things to update across editions

- Contact information
- Date and place
- Copyright footer
- Animation
- Sponsors
- Team
- Winners previous edition (home)
