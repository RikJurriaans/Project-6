module 'Cardboard'

fullBrowser = (effect) -> effect.setSize(window.innerWidth, window.innerHeight)

fullscreen = ->
    if (@renderer.domElement.requestFullscreen)
        @renderer.domElement.requestFullscreen()
    else if (@renderer.domElement.msRequestFullscreen)
        @renderer.domElement.msRequestFullscreen()
    else if (@renderer.domElement.mozRequestFullScreen)
        @renderer.domElement.mozRequestFullScreen()
    else if (@renderer.domElement.webkitRequestFullscreen)
        @renderer.domElement.webkitRequestFullscreen()

initControls = (e) ->
    if e.alpha
        window.removeEventListener('deviceorientation', initControls, false)
        @renderer.domElement.addEventListener('click', _.bind(fullscreen, renderer : @renderer), false)
        @orbitControls.enabled = false
        @controls.connect()
        @controls.update()


resize = ->
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.effect.setSize(window.innerWidth, window.innerHeight)
    @renderer.setSize(window.innerWidth, window.innerHeight)

# Renderer :: Renderer -> Renderer
Cardboard.effect = (renderer) ->
    renderer.effect = new THREE.StereoEffect(renderer)
    renderer.effect.targetDistance = 50
    renderer.effect.separation = 0.6
    renderer.effect.shadowMapEnabled = true
    renderer.effect.shadowMapType = THREE.PCFSoftShadowMap
    fullBrowser(renderer.effect)
    renderer

Cardboard.camera = ->
    camera = new THREE.PerspectiveCamera(90,
                                         window.innerWidth / window.innerHeight,
                                         1,
                                         10000)
    camera.position.z = 3
    # camera.position.y = 20
    # camera.position.x = 0
    return camera

Cardboard.init = (scene, camera, renderer) ->
    controls = new THREE.DeviceOrientationControls(camera, true)

    orbitControls = new THREE.OrbitControls(camera, renderer.domElement)
    orbitControls.noZoom = false
    orbitControls.noPan = false
    orbitControls.autoRotate = false

    initControls = _.bind(initControls, renderer: renderer, controls : controls, orbitControls : orbitControls)
    window.addEventListener('deviceorientation', initControls, false)

    window.onresize = _.bind(resize, camera: camera, renderer: renderer)

    controls: controls, orbitControls: orbitControls

