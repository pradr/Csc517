# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

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
