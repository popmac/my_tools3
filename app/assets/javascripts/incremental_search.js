$(window).on('load', function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxSearch = function() {
    $.ajax({
      url: "/tools/search",
      type: "GET",
      data: ("keyword=" + input)
    });
  };
  $('#tool_name').on('keyup', function() {
    input = $.trim($(this).val());
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });
});
