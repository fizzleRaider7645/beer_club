$(document).on('turbolinks:load', function() {
  attachListeners();
});

function getBeerReviews(id) {
  $.get(`/beers/${id}/reviews` + `.json`, function(json) {
    $('#beer-review-box').empty();
    if(json.data.length == 0) {
      alert("No Reviews For This Beer!")
    } else {
      json.data.forEach(function(reviewObj) {
        $('#beer-review-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.attributes.text + "</li> <br />")
      });
    }
  });
}

function getUserReviews(userId) {
  $.get(`/users/${userId}/reviews` + `.json`, function(json) {
    $('.user-reviews-box').empty();
    if(json.data.length === 0) {
      alert("You Have Not Written Any Reviews Yet!")
    } else {
      json.data.forEach(function(reviewObj) {
        $('.user-reviews-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.relationships.beer.data.name + " <button onClick=" + `seeReview(${userId}` + "," + `${reviewObj.id})` + ">See Review</button>" + "</li> <br />")
        $('.user-reviews-box').append("<button type='button' class='clear-reviews-button'>Clear Reviews</button>")
      });
    }
  });
}

function seeReview(userId, review_id) {
  $.get(`/users/${userId}/reviews/${review_id}` + `.json`, function(json) {
    $('.user-reviews-box').empty();
    $('.user-reviews-box').append(`<h2>${json.data.attributes.title}</h2> <p>${json.data.attributes.text}</p> <button onClick=getUserReviews(${json.data.relationships.user.data.id})>Go Back</button>`)
    $('.user-reviews-box').append(`<button><a style="text-decoration:none" href='/users/${userId}/reviews/${review_id}/edit'>Edit Review</a></button>`)
  });
}

function postNewReview(userId) {
  let reviewDate = $('#review_date').val();
  let reviewTitle = $('#review_title').val();
  let reviewRating = $('#review_rating').val();
  let reviewText = $('#review_text').val();
  let beerName = $('#review_beer_attributes_name').val();
  let beerStyle = $('#review_beer_attributes_style').val();
  let beerBrewery = $('#review_beer_attributes_brewery').val();
  let beerCountry = $('#review_beer_attributes_country').val();
  let beerAbv = $('#review_beer_attributes_abv').val();
  let state = { review: {title: reviewTitle, date: reviewDate, rating: reviewRating, text: reviewText,beer_attributes: {name: beerName, style: beerStyle, country: beerCountry, abv: beerAbv, brewery: beerBrewery}}}

  $.post(`/users/${userId}/reviews`, state, function(data) {
  }, "json");

  document.getElementById("new_review").reset();
}

function addLatestReview(userId) {
  $.get(`/users/${userId}/reviews` + `.json`, function(json) {
    let newlyCreatedReview = json.data[json.data.length - 1]
    $('.review-index-box').append("<li>" + "<strong>" + newlyCreatedReview.attributes.title + "</strong>" + "-" + newlyCreatedReview.relationships.beer.data.name + "</li>")
  });
}

function attachListeners() {
  $('.see-review').on('click', function(e) {
    let id = this.id
    e.preventDefault();
    getBeerReviews(id);
  });

  $('.beer-show-page-reviews').on('click', function(e) {
    let id = this.id
    e.preventDefault();
    getBeerReviews(id);
  });

  $('.user-reviews-link').on('click', function(e) {
    let id = this.id
    e.preventDefault();
    getUserReviews(id);
  });

  $('.user-reviews-box').on('click', '.clear-reviews-button', function(e) {
    $('.user-reviews-box').empty();
  });

  $('.form-submit-button').on('click', function(e) {
    let userId = document.getElementsByClassName("review-index-box")[0].id
    e.preventDefault();
    $.when($.ajax(postNewReview(userId))).then(function () {
      addLatestReview(userId);
    });
  });

  if($("#new_review").length > 0){
    $(document).ready(function(e) {
      let userId = document.getElementsByClassName("review-index-box")[0].id
      $.get(`/users/${userId}/reviews` + `.json`, function(json) {
        json.data.forEach(function(reviewObj) {
          $('.review-index-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.relationships.beer.data.name + "</li>")
        });
      });
    });
  }
}
