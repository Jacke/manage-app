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
//= require jquery-ui
//= require bootstrap
//= require bootstrap-select
//= require_tree .
$( document ).ready(function() {
function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
var   except = {};

var signed_creation = $("#creation_authors_ids").val();
var tagApi = jQuery("#creation_authors_ids").tagsManager({
      prefilled: [signed_creation]
    });
 
    jQuery("#creation_authors_ids").typeahead({
      name: 'countries',
      limit: 15,
      prefetch: '../../category/authors'
    }).on('typeahead:selected', function (e, d) {
 
      tagApi.tagsManager("pushTag", d.value);
 
    });
$("#creation_authors_ids").autocomplete({
  delay: 100,
  minLength: 2,
  source: function(request, response) {
    return $.getJSON("http://knigi.ua:8082/category/authors", {
      q: request.term,
    }, function(result) {
      return response(result);
    });
  },
  select: function(event, ui) {
    var terms = split( this.value );
    console.log(ui.item.value);
    // remove the current input
    terms.pop();
    // add the selected item
    terms.push( ui.item.value );
    // add placeholder to get the comma-and-space at the end
    terms.push( "" );
    this.value = terms.join( ", " );
    return false;
    //  window.location = ui.item.name;
    //  return false;
  }
});
var signed = $("#item_authors_ids").val();
var tagApi = jQuery("#item_authors_ids").tagsManager({
    prefilled: [signed]
    });
 
    jQuery("#item_authors_ids").typeahead({
      name: 'countries',
      limit: 15,
      prefetch: '../../category/authors'
    }).on('typeahead:selected', function (e, d) {
 
      tagApi.tagsManager("pushTag", d.value);
 
    });
$("#item_authors_ids").autocomplete({
  delay: 100,
  minLength: 2,
  source: function(request, response) {
    return $.getJSON("../../category/authors", {
      q: request.term,
    }, function(result) {
      return response(result);
    });
  },
  select: function(event, ui) {
    var terms = split( this.value );
    console.log(ui.item.value);
    // remove the current input
    terms.pop();
    // add the selected item
    terms.push( ui.item.value );
    // add placeholder to get the comma-and-space at the end
    terms.push( "" );
    this.value = terms.join( ", " );
    return false;
    //  window.location = ui.item.name;
    //  return false;
  }
}); 
$('.selectpicker').selectpicker();
$('div.btn-group button').click(function(){

    if ($(this).children('input[name="is_pending"]').val() == 0) {
      $('#nexuse_report_moderation').val('');
    }
    else if ($(this).children('input[name="is_pending"]').val() == 1) {
      $('#nexuse_report_moderation').val('NO');
    }
    else {
      $('#nexuse_report_moderation').val('YES');
    }

})
  $("#e7").select2({
            placeholder: "Автор",
            minimumInputLength: 3,
            ajax: {
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json",
                dataType: 'jsonp',
                quietMillis: 100,
                data: function (term, page) { // page is the one-based page number tracked by Select2
                    return {
                        q: term, //search term
                        page_limit: 10, // page size
                        page: page, // page number
                        apikey: "ju6z9mjyajq2djue3gbvv26t" // please do not use so this example keeps working
                    };
                },
                results: function (data, page) {
                    var more = (page * 10) < data.total; // whether or not there are more results available
 
                    // notice we return the value of more so Select2 knows if more results can be loaded
                    return {results: data.movies, more: more};
                }
            },
            escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
        });
});
