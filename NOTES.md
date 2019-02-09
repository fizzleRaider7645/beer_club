Beer Club

Description: Users can log, describe, rate beers they've consumed and share
recommendations with friends.


Models:

*Users*
-relations-
has_secure_password
has_many :sessions
has_many :beers, through: :sessions

-attributes-
username

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
average_rating

*Sessions*
belongs_to :user
belongs_to :beer

-attributes-
user_id
beer_id
date
beer_rating
