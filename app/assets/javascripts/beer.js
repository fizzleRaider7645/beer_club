$(document).on('turbolinks:load', function() {
  attachListeners();
});

// (start) Review JS Object
class Review {
  constructor(id, title, rating, beerName, text) {
    this.id = id;
    this.title = title;
    this.rating = rating;
    this.beerName = beerName;
    this.text = text;
  }
}
// *** - Appends a users latest review to a review index box on the new review view.
Review.prototype.addLatestReview = function() {
  let reviewHtml = `<li><strong>${this.title}</strong> - ${this.beerName}</li>`
  return reviewHtml;
}

// *** - Displays all the reviews for a beer on beer show view.
Review.prototype.displayBeerReviews = function() {
  let reviewHtml = `<li><strong>${this.title}</strong> - ${this.text}</li> <br />`
  return reviewHtml;
}

// *** - Displays all the reviews for a user on user show view.
Review.prototype.displayUserReviews = function(userId) {
  let reviewHtml = `<li><strong>${this.title}</strong> - ${this.beerName} <button onClick="seeReview(${userId}, ${this.id})">See Review</button></li> <br />`
  return reviewHtml;
}

// (end) Review JS Object

function getBeerReviews(id) {
  $.get(`/beers/${id}/reviews` + `.json`, function(json) {
    $('#beer-review-box').empty();
    if(json.data.length == 0) {
      alert("No Reviews For This Beer!")
    } else {
      json.data.forEach(function(reviewObj) {
        let jsReviewObj = new Review(reviewObj.id, reviewObj.attributes.title, reviewObj.attributes.rating, reviewObj.relationships.beer.data.name, reviewObj.attributes.text)
        let html = jsReviewObj.displayBeerReviews()
        $('#beer-review-box').append(html)
      });
    }
  });
}

function getUserReviews(userId) {
  $.get(`/users/${userId}/reviews` + `.json`, function(json) {
    $('.user-reviews-box').empty();
    if(json.data.length === 0) {
      alert("You Have Not Written Any Reviews Yet!")
    }

    json.data.forEach(function(reviewObj) {
      let jsReviewObj = new Review(reviewObj.id, reviewObj.attributes.title, reviewObj.attributes.rating, reviewObj.relationships.beer.data.name, reviewObj.attributes.text)
      let html = jsReviewObj.displayUserReviews(userId);
      $('.user-reviews-box').append(html);
        // "<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.relationships.beer.data.name + " <button onClick=" + `seeReview(${userId}` + "," + `${reviewObj.id})` + ">See Review</button>" + "</li> <br />"
    });

    if(json.data.length !== 0) {
      $('.user-reviews-box').append("<button type='button' class='clear-reviews-button'>Clear Reviews</button>")
    }
  });
}

function seeReview(userId, review_id) {
  $.get(`/users/${userId}/reviews/${review_id}` + `.json`, function(json) {
    $('.user-reviews-box').empty();
    $('.user-reviews-box').append(`<h2>${json.data.attributes.title}</h2> <p>${json.data.attributes.text}</p> <button onClick=getUserReviews(${json.data.relationships.user.data.id})>Go Back</button>`)
    $('.user-reviews-box').append(`<button><a style="color:black; text-decoration:none" href='/users/${userId}/reviews/${review_id}/edit'>Edit Review</a></button>`)
  });
}

function reviewNewRefresh() {
  document.getElementById("new_review").reset()
  $(".form-submit-button" ).prop( "disabled", false );
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

  $('#new_review').submit(function(e) {
    e.preventDefault();
    let userId = document.getElementsByClassName("review-index-box")[0].id
    let state = $(this).serialize();
    $.post(`/users/${userId}/reviews`, state).done(function(data) {
      if(typeof data === "object") {
        let reviewTitle = data.data.attributes.title;
        let reviewRating = data.data.attributes.rating;
        let reviewBeerName = data.data.relationships.beer.data.name;
        let newReviewObj = new Review(reviewTitle, reviewRating, reviewBeerName);
        let html = newReviewObj.addLatestReview();
        $('.review-index-box').append(html);
        reviewNewRefresh();
      } else {
        alert("Must Enter a Title, Rating and Beer-Name to Submit!")
        reviewNewRefresh();
      }
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
