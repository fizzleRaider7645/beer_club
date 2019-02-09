Beer Club

Description: Users can log, describe, rate beers they've consumed, and share
recommendations with friends.

Features:
List beers by country, rating, ABV, IBUs


Models:

*Users*
-relations-
has_secure_password
has_many :sessions
has_many :beers, through: :sessions
has_many :medals

-attributes-
username
password_digest
status

*Beers*
-relations-
has_many :sessions
has_many :users, through :sessions

-attributes-
name
country
IBUs
ABV
description
rating

*Sessions*
belongs_to :user
belongs_to :beer

-attributes-
user_id
beer_id
date
beer_rating

*Medals*
belongs_to :user

-attributes-
name
user_id
description
criteria *** - NEED TO FIGURE OUT HOW TO IMPLEMENT
points
