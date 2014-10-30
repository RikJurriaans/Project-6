module 'Render'

Render.fullBrowser = (renderer) -> 
    renderer.setSize(window.innerWidth, window.innerHeight)

Render.fsRenderer = ->
    renderer = new THREE.WebGLRenderer
    document.body.appendChild(renderer.domElement)
    renderer

Render.framerate = (framerate) -> 1000 / framerate

