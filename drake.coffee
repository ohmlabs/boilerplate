routes = require("./server/routes/site.js")
config = require("./server/config/config.js")

# Module Dependencies
http = require("http")
express = require("express")
app = express()
server = http.createServer(app)
io = require("socket.io")
aws = require("./server/apis/AWS.js")

# Middleware
# Make sure we use the right environment
app.set "env", config.env

app.configure "production", ->
  app.use express.errorHandler()
    # tell express that its sitting behind a proxy (nginx)
  app.enable "trust proxy"
  app.locals.pretty = false

app.configure "development", ->
  app.use express.static(__dirname + "/static")
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )
  app.locals.pretty = true

app.configure ->
  app.set "views", __dirname + "/server/views"
  app.set "view engine", "jade"
  app.use express.logger()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router

# Routes
app.get "/", routes.index
app.get "/parallax", routes.parallax
app.get "/photos", routes.photos
app.get "/work", routes.work
# 404 
app.get "*", routes.error

# Listen

app.listen config.port
io = io.listen(server)
if config.is_prod
  console.log "Server started on port " + config.port + " in production mode"
else
  console.log "Server started on port " + config.port + " in development mode"
