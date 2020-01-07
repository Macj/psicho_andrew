(function() {
  $(document).ready(function() {
    $('#ajax').on('click', function() {
      return $.get("/articles.js", function(data) {
        console.log(data);
        return $('#cards').append(data);
      });
    });
    return $('.wysihtml5').each(function(i, elem) {
      return $(elem).wysihtml5({
        toolbar: {
          'font-styles': true,
          'color': true,
          'emphasis': {
            'small': true
          },
          'blockquote': true,
          'lists': true,
          'html': true,
          'link': true,
          'image': true,
          'smallmodals': true
        }
      });
    });
  });

}).call(this);
