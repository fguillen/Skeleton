// Based in: http://duckranger.com/2012/06/pretty-file-input-field-in-bootstrap/
// Version: 0.0.3
// Compatibility with: Bootstrap 3.2.0 and jQuery 2.1.1
// Use:
//     <input class="nice_file_field" type="file" data-label="Choose Document">
//     <script> $(".nice_file_field").niceFileField(); </script>
//
(function( $ ) {
  $.fn.niceFileField = function() {
    this.each(function(index, file_field) {
      file_field = $(file_field);
      var label = file_field.attr("data-label") || "Choose File";

      file_field.css({"display": "none"});

      nice_file_block_text  = '<div class="input-group nice_file_block">';
      nice_file_block_text += '  <input type="text" class="form-control">';
      nice_file_block_text += '  <span class="input-group-btn">';
      nice_file_block_text += '   <button class="btn btn-default nice_file_field_button" type="button">' + label + '</button>';
      nice_file_block_text += '  </span>';
      nice_file_block_text += '</div>';

      file_field.after(nice_file_block_text);

      var nice_file_field_button = file_field.parent().find(".nice_file_field_button");
      var nice_file_block_element = file_field.parent().find(".nice_file_block");

      nice_file_field_button.on("click", function(){ console.log("click"); file_field.click() } );
      file_field.change( function(){
        nice_file_block_element.find("input").val(file_field.val());
      });
    });
  };
})( jQuery );