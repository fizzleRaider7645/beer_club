Beer Club

FOR FUTURE CONSIDERATION: 1. Add user ranking system based on beer cred.
                          2.


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

*******************************************************************************

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

*******************************************************************************

*Sessions*
belongs_to :user
belongs_to :beer

-attributes-
user_id
beer_id
date
beer_rating

*******************************************************************************

*Medals*
belongs_to :user

-attributes-
name
user_id
description
criteria
points

TYPES OF MEDALS:

ROOKIE
name "I remember when I had my first beer."
description - "Awarded upon a users first review"
criteria(aka trigger event) - @user.beers.count >= 1
point(s) - 1

COUNTRY
name -
