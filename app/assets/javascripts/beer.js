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
    if(json.data.length == 0) {
      alert("You Have Not Written Any Reviews Yet!")
    } else {
      json.data.forEach(function(reviewObj) {
        $('.user-reviews-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.relationships.beer.data.name + " <button onClick=" + `seeReview(${userId}` + "," + `${reviewObj.id})` + ">See Review</button>" + "</li> <br />")
      });
    }
    $('.user-reviews-box').append("<button type='button' class='clear-reviews-button'>Clear Reviews</button>")
  });
}

function seeReview(userId, review_id) {
  $.get(`/users/${userId}/reviews/${review_id}` + `.json`, function(json) {
    let saved = json
    $('.user-reviews-box').empty();
    $('.user-reviews-box').append(`<h2>${json.data.attributes.title}</h2> <p>${json.data.attributes.text}</p> <button onClick=getUserReviews(${json.data.relationships.user.data.id})>Go Back</button>`)
    $('.user-reviews-box').append(`<button class='edit-review-button'>Edit Review</button>`)
  });
}

function postNewReview(userId) {
  let state = {};
  $.post(`/users/${userId}/reviews`, function(data) {
    debugger
  });
}

function editReview() {
  debugger
  // $.get()
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
    postNewReview(userId);
  });
  $('.user-reviews-box').on('click', '.edit-review-button', function(e) {
    editReview();
  });

  $(document).ready(function(e) {
    let userId = document.getElementsByClassName("review-index-box")[0].id
    $.get(`/users/${userId}/reviews` + `.json`, function(json) {
      json.data.forEach(function(reviewObj) {
        $('.review-index-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.relationships.beer.data.name + "</li>")
      });
    });
  });
}
