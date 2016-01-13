(function(){

  if (window.GroopiePets === undefined){
    window.GroopiePets = {};
  }
  
  GroopiePets.Ajax = GroopiePets.Ajax || {};

  GroopiePets.Ajax.get = function(uri, callback_function){
    $.ajax({
      url: uri,
      success: function(response){
        callback_function(response);
      },
      fail: function(error){
        console.error("Error: " + error);
      }
    });
  };

  GroopiePets.Ajax.post = function(uri, data_hash, success_function, error_function){
    var request = $.post(uri, data_hash);
    request.done(function(response) {
      success_function(response);
    });
    request.fail(function(response) {
      error_function(response);
    });
  };

  GroopiePets.Ajax.delet= function(uri, callback_function){
    $.ajax({
      type: 'DELETE',
      url: uri,
      success: function(response){
        callback_function(response);
      }
    });
  };

  GroopiePets.Ajax.patch= function(uri, data_hash, callback_function){
    $.ajax({
      type: 'PATCH',
      url: uri,
      data: data_hash,
      success: function(response){
        callback_function(response);
      }
    });
  };

})();