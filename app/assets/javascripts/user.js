(function() {

if (window.GroopiePets === undefined){
  window.GroopiePets = {};
}

'use strict';

GroopiePets.User = GroopiePets.User || {};

})();

$(document).on('ready', function() {

  $(document).on('click', '#link-signup', function(event) {
    event.preventDefault();
    $('.main').html(HandlebarsTemplates['users/signup'])
  });

})