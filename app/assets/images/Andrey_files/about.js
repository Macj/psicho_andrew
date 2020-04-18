(function() {
  $(document).ready(function() {
    $('.find_out').hide();
    console.log('asdasdsa');
    $('.find_out_card').hover(function() {
      var id;
      id = $(this).attr('ref');
      console.log(id);
      $(this).hide();
      $('#find_out' + id).show();
      return $('#collapseCard' + id).show();
    });
    $('.find_out').mouseout(function() {
      var id;
      id = $(this).attr('ref');
      $(this).hide();
      $('#collapseCard' + id).hide();
      return $('#find_out_card' + id).show();
    });
    $('.sub-card-body').mouseout(function() {
      var id;
      id = $(this).attr('ref');
      $(this).hide();
      $('#collapseCard' + id).hide();
      return $('#find_out_card' + id).show();
    });
    return $('#aja').on('click', function() {
      var elem;
      return elem = $('.aja_block');
    });
  });

}).call(this);
