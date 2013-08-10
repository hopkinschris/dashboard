$(document).ready(function() {
  $('.select').click(function(ev) {
    ev.stopPropagation();
    $('.dropdown').fadeIn(400, function() {
      $(document).on('click', function(ev) {
        $('.dropdown').fadeOut();
      });
    });
  });
});
