// Generated by CoffeeScript 1.6.2
(function() {
  var status;

  status = function() {
    return $.getJSON("https://api.twitch.tv/kraken/streams/avalonstartv/?callback=?", function(response) {
      console.log(response);
      if (response.stream !== null) {

      }
    });
  };

  status();

  setInterval(status, 60000);

}).call(this);
