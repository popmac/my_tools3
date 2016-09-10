$(function() {
  $('.rating-star').each(function() {
    var $target = $(this),
    $inner = $target.children('.rating-star-inner'),
    rateStr = $target.text(),
    rateNum = parseInt(rateStr);
    $target.attr('title', rateStr);
    $inner.html('&#xe006;&#xe006;&#xe006;&#xe006;&#xe006;').css('width', rateNum + '%');
  });
});
