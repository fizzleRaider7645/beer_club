$(document).on('turbolinks:load', function() {
  attachListeners();
});

function getBeerReviews(id) {
  $.get(`/beers/${id}/reviews`, function(json) {
    $('#beer-review-box').empty();
    json.data.forEach(function(reviewObj) {
    });
  });
}

function attachListeners() {
  $('.see-review').on('click', function(e) {
    let id = this.id
    e.preventDefault();
    getBeerReviews(id);
  });
}
