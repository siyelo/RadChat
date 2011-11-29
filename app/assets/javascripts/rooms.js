rooms_show = {
  run: function () {
    $('#new_message').submit(function (e) {
      e.preventDefault();
      var form = $(this);

      if ($('#message').val().length > 0) {
        $.post(form.attr('action'), form.serialize());
      }
    })

    $('html').animate({ scrollTop: $(document).height() }, 'fast');
    $('#message').focus()
  }
};
