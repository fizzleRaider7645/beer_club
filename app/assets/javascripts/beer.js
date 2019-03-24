$(document).on('turbolinks:load', function() {
  attachListeners();
});

function attachListeners() {
  $('#medal-chest').on('click', function() {
    alert('Clicking')
  });

  // $('#save').on('click', () => saveGame());
}
