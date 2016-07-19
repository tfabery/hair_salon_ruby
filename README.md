# _Hair Salon_

#### By _**Tony Fabery**_

## Description

_This webpage let's a user view/add/edit hair stylists and clients. User can also assign clients to hair stylists._


## Setup/Installation Requirements

* clone repository from https://github.com/tfabery/hair_salon_ruby
* create hair_salon database and hait_stylists and clients tables by running 
* "CREATE DATABASE hair_salon; 
* \c hair_salon; 
* CREATE TABLE hair_stylists (id serial PRIMARY KEY, name varchar); 
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, hair_stylist_id int);" in psql
* run "ruby app.rb" in terminal
* open "localhost:4567" on a browser

## Known Bugs
* Protozoa
* Porifera
* Nemathelminthes
* Mollusca
* Arthropoda


## Support and contact details

_Tony Fabery: tfabery@gmail.com_

## Technologies Used

* _Ruby_
* _Postgres_
* _rspec_
* _capybara_
* _HTML_
* _CSS_


### License

*This software is licensed under the MIT license.*

Copyright (c) 2016 **_DWTFYW INC._**
