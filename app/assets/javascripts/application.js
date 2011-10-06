// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
require jquery
require jquery_ujs
//= require_tree .
//
//
$(document).ready(function() {
          $('#my-link').click(function(event){
                      alert('Hooray!');
                          event.preventDefault(); // Prevent link from following its href
                            });
});
$(document).ready(function() {
$('#post_delete').click (function(){
        if(confirm("Are you sure?")){
            var row = $(this).closest("tr").get(0);
            $.post(this.href, {_method:'delete'}, null, "script");
            $(row).hide();
            return false;
        } else {
            //they clicked no.
            return false;
        }

});
});
