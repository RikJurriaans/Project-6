module 'Loader'

Loader.loadJson = (url) -> 
    xmlhttp = new XMLHttpRequest()
    xmlhttp.open("GET", url, false)
    xmlhttp.send()
    JSON.parse xmlhttp.response

loader = new THREE.ObjectLoader

Loader.loadModel = (url) -> (funct) ->
    loader.load("models/objects.json", (obj) -> funct obj)

Loader.bulkLoad = (urls...) ->
    func = _.map(urls, Loader.loadModel)
    console.log func
    # _.map(func, this.call)
    # _.map(, (obj) -> console.log(obj))

# Loader.objectLoad = () ->

