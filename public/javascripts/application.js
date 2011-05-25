// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $("#records_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script")
    return false;
  });

  $("#records_search input").keyup(function() {
    $.get($("#records_search").attr("action"), $("#records_search").serialize(), null, "script")
    return false;
  });
});
