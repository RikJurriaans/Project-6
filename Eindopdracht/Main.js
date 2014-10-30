(function() {
  var accoundSid, app, authToken, client, express, http, io;

  express = require('express');

  app = express();

  http = require('http').Server(app);

  io = require('socket.io')(http);

  accoundSid = 'AC118bbb7f4c71f59619c07498cc435ea8';

  authToken = 'b4bcbc1ce6dd5fe24d3e3c3301b8f911';

  client = require('twilio')(accoundSid, authToken);

  client.messages.list({}, function(err, data) {
    return data.messages.forEach(function(message) {
      return console.log(message);
    });
  });

  app.use(express["static"](__dirname));

  app.get('/', function(req, res) {
    return res.sendFile(__dirname + '/index.html');
  });

  io.on('connection', function(socket) {
    console.log('a user connected');
    return socket.on('disconnect', function() {
      return console.log('a user disconnected');
    });
  });

  http.listen(3000, function() {
    return console.log('listen on *:3000');
  });

}).call(this);
