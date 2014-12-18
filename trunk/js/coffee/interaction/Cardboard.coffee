module 'Cardboard'

fullBrowser = (effect) -> effect.setSize(window.innerWidth, window.innerHeight)

Cardboard.fullscreen = ->
    if (document.body.requestFullscreen)
        document.body.requestFullscreen()
    else if (document.body.msRequestFullscreen)
        document.body.msRequestFullscreen()
    else if (document.body.mozRequestFullScreen)
        document.body.mozRequestFullScreen()
    else if (document.body.webkitRequestFullscreen)
        document.body.webkitRequestFullscreen()

initControls = (e) ->
    if e.alpha
        window.removeEventListener('deviceorientation', initControls, false)
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
                                         0.1,
                                         10000)
    camera.position.z = 3
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

