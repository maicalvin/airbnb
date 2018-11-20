# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
    alert("123")
  $("#search_listings").change(function(){
    $.ajax({
      method: "GET",
      url: "search_ajax_listings",
            data: {search_ajax: this.value },
      dataType: "json",
            success: function(data) {
        $("#search_listings").children('option:not(:first)').remove();
        data.forEach(function(el) { 
          $("#search_listings").append(`<option value='${el}'>${el}</option>`)
 })
      },
      
    });
  });
});
