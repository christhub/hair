# _Hair Salon_

##### _{Database for a hair salon with stylists and clients}, {August 21, 2015}_

#### By _**Christian Lei**_

## Description

_{In this database, you're going to be able to store stylists and clients. With the interface you're able to change the client's and stylist's name based on how they feel about it. You will also be able to assign clients to stylists and then change that if you need to.}_

## Setup

* _Clone file from github_
* _Initialize 'postgres'_
* _Initialize the database in PSQL:_
* _CREATE DATABASE hair_salon_test;_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar)_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int)_
* _CREATE DATABASE hair_salon WITH TEMPLATE hair_salon_test_
* _run 'ruby app.rb'_
* _enjoy :)_

## Technologies Used

_Ruby, Sinatra, Capybara, hTML, PSQL, postgres_

### Legal

Copyright (c) 2015 **_Christian Lei_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
