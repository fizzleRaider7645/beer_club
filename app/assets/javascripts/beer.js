$(document).on('turbolinks:load', function() {
  attachListeners();
});

function getBeerReviews() {
  $('#beer-review-box').append(`<h2>"Hey Guy"</h2><br>`);
}

function attachListeners() {
  $('.see-review').on('click', function(e) {
    e.preventDefault();
    getBeerReviews();
  });
}
