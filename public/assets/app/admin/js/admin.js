$(function(){
  console.log("admin.js");

  _.templateSettings = {
    interpolate : /\{\{([\s\S]+?)\}\}/g
  };

  $(document).ajaxStart( function() {
    console.log( "loading" );
    $("#loading").animate({ top: "0" }, 200);
  });

  $(document).ajaxStop( function() {
    console.log( "loading finish!" );
    $("#loading").animate({ top: "-70" }, 100);
  });

  $("#items table tbody").sortable({
    axis: "y",
    handle: ".handle",
    update: function(){
      $.post(
        $(this).data("update-url"),
        { ids: _.map($("#items table tbody").find("tr"), function(element) { return $(element).attr("data-id"); } ) }
      )
    },
    helper: function(e, tr){
      var $originals = tr.children();
      var $helper = tr.clone();
      $helper.children().each(function(index)
      {
        // Set helper cell sizes to match the original sizes
        $(this).width($originals.eq(index).width())
      });
      return $helper;
    },
  });

});