// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  $('.carousel').carousel({
    interval: 6000
  });
});


$(function(){
  $("#archives a[title='Modificar']").remove();

  if ($("#archives").length == 0){
    $("a").removeAttr("data-remote");
    $("form").removeAttr("data-remote");
  }

  $("#upload_frame").load(function(){
    var cambio_alert = $(this.contentDocument).find('.alert').clone();
    $("#message_archive").html(cambio_alert);
    if($("#flash_notice").html() == "Archive was successfully created."){
      $.getScript("/archives");
      $("#archives a[title='Modificar']").remove();
    }
  });

  $(".pagination a").click( function(e){
    e.preventDefault();
    pagination(this.href);
  });

  function pagination(pag){
    var archive_page = pag.split("?");
    archive_page = archive_page[1].split("page=");
    $.getScript("/archives?page="+archive_page[1]);
    $("#archives a[title='Modificar']").remove();
  }

});

