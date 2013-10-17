$ ->
  $(".pull-down").each ->
    $(this).css "margin-top", $(this).parent().height() - $(this).height()