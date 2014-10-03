# settings
settings = 
    scene : new THREE.Scene
    camera : new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)
    renderer : new THREE.WebGLRenderer
    maxWidth : window.innerWidth
    maxHeight : window.innerHeight


# general things
setSize = ->
    @renderer.setSize(@maxWidth, @maxHeight)

renderReady = ->
    document.body.appendChild(@renderer.domElement)
    @camera.position.z = 5
    setInterval(_.bind(render, settings), 1000/24)

render = -> @renderer.render(@scene, @camera)

addToScene = (object) -> @scene.add(object)
addToScene = (settings) -> _.bind(addToScene, settings)

# build more complex functions out of simple ones
setup = (settings) -> 
    _.bind(_.compose(setSize, renderReady), settings)


getCube = ->
    geometry = new THREE.BoxGeometry(1, 1, 1)
    material = new THREE.MeshBasicMaterial( color: 0x00ff00 )
    new THREE.Mesh(geometry, material)



# All objects in the scene
objects = [ getCube() ]

# Setup scene, renderer, camera and render.
setup(settings)

# Add all objects to the scene.
_.map(objects, addToScene(settings))
