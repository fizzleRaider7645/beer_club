$(document).on('turbolinks:load', function() {
  attachListeners();
});

function getBeerReviews(id) {
  $.get(`/beers/${id}/reviews`, function(json) {
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

function getUserReviews(id) {
  $.get(`/users/${id}/reviews` + `.json`, function(json) {
    debugger
    $('.user-reviews-box').empty();
    if(json.data.length == 0) {
      alert("You Have Not Written Any Reviews Yet!")
    } else {
      json.data.forEach(function(reviewObj) {
        $('.user-reviews-box').append("<li>" + "<strong>" + reviewObj.attributes.title + "</strong>" + "-" + reviewObj.attributes.text + "</li> <br />")
      });
    }
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
}
