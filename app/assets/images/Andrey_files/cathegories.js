(function() {
  $(document).ready(function() {
    $('#v-cats-tab a').on('mouseover', function(e) {
      e.preventDefault();
      return $(this).tab('show');
    });
    return $('#v-cats-tab a').on('click', function(e) {
      e.preventDefault();
      return window.location.href = $(this).attr('href');
    });
  });

}).call(this);
