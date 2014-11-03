module 'Render'

Render.fullBrowser = (renderer) ->
    renderer.setSize(window.innerWidth, window.innerHeight)

Render.fsRenderer = ->
    renderer = new THREE.WebGLRenderer(antialias: true)
    renderer.setClearColor(0xeeeeee)
    renderer.shadowMapEnabled = true
    renderer.shadowMapType = THREE.PCFSoftShadowMap
    document.body.appendChild(renderer.domElement)
    renderer

Render.framerate = (framerate) -> 1000 / framerate

