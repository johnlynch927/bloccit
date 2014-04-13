//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  $(".js-add-comment").click(function() {
    $(".js-new-comment").slideDown();
    $(this).hide();
    return false;
  });
});

  