// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

// $(function () {
//   $("document").on("submit", ".new_user", function() {
//       $('.signup').modal("close");
//   });
// });



$(function() {
    $( "#accordion" ).accordion({
    active: false,
    collapsible: true,
    heightStyle: "content"
});

  $('#accordion button').click(function(e) {
      var element  = $(this);
//      debugger
      var form = element.parents('form:first');
      e.preventDefault();
        if(element.attr("type") === 'submit'){
          //close the accordion
          $('#accordion').accordion('option', 'active',false);
          $(form).submit();
        }else{
          $.ajax({
            type: "PUT",
            url: $(form).attr("action")+".json",
            data: $(form).serialize()
          })
          var delta = ($(this).is('.next') ? 1 : +1);
        $('#accordion').accordion('option', 'active', ( $('#accordion').accordion('option','active') + delta  ));
      };
    });
  });
