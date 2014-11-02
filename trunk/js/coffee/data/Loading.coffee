module 'Loader'

Loader.loadFile = (url) ->
    xmlhttp = new XMLHttpRequest()
    xmlhttp.open("GET", url, false)
    xmlhttp.send()
    return xmlhttp

Loader.loadJson = (url) -> JSON.parse(Loader.loadFile(url).response)

Loader.loadShader = (vShaderUrl, fShaderUrl) ->
    vShader = Loader.loadFile vShaderUrl
    fShader = Loader.loadFile fShaderUrl
    vertexShader: vShader.response, fragmentShader: fShader.response


loader = new THREE.ObjectLoader

Loader.loadModel = (url, func) -> 
    loader.load(url, (obj) -> func obj)


