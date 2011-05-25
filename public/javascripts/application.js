// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $("#records_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script")
    return false
  });
});
