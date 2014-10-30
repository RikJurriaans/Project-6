express = require 'express'
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)


accoundSid = 'AC118bbb7f4c71f59619c07498cc435ea8'
authToken = 'b4bcbc1ce6dd5fe24d3e3c3301b8f911'

client = require('twilio')(accoundSid, authToken)

client.messages.list({
}, (err, data) ->
    data.messages.forEach((message) ->
        console.log message
    )
)


app.use express.static(__dirname)

app.get('/', (req, res) -> 
    res.sendFile(__dirname + '/index.html')
)

io.on('connection', (socket) ->
    console.log 'a user connected'
    socket.on('disconnect', ->
        console.log 'a user disconnected'
    )
)

http.listen(3000, -> console.log 'listen on *:3000')

