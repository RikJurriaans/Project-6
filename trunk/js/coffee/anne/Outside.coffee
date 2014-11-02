module 'Outside'

Outside.sunlight = ->
    hemilight = new THREE.HemisphereLight(0x3385ff, 0xffc871, 1)
    # hemilight.color.setHSL(0.6, 1, 0.6)
    # hemilight.groundColor.setHSL(0.095, 1, 0.75)
    hemilight.position.set(0, 500, 0)

    dirlight = new THREE.DirectionalLight(0xffffff, 1)
    # dirlight.color.setHSL(0.1, 1, 0.95)
    # dirlight.position.set(-1, 1.75, 1)
    dirlight.position.multiplyScalar(1000)

    # dirlight.castShadow = true

    # dirlight.shadowMapWidth = 2048
    # dirlight.shadowMapHeight = 2048

    # d = 5

    sunlight = new THREE.DirectionalLight
    sunlight.position.set(250, 250, 250)
    sunlight.intensity = 0.5
    sunlight.castShadow = true
    sunlight.shadowCameraVisible = true
    sunlight.shadowCameraNear = 250
    sunlight.shadowCameraFar = 600
    sunlight.shadowCameraLeft = -200
    sunlight.shadowCameraRight = 200
    sunlight.shadowCameraTop = 200
    sunlight.shadowCameraBottom = -200

    # dirlight.shadowCameraVisible = true

    # dirlight.shadowCameraLeft = -d
    # dirlight.shadowCameraRight = d
    # dirlight.shadowCameraTop = d
    # dirlight.shadowCameraBottom = -d

    # dirlight.shadowCameraFar = 3500
    # dirlight.shadowBias = -0.0001
    # dirlight.shadowDarkness = 0.35

    [hemilight, dirlight]


# Outside.sky = ->
#     # shaders = Loader.loadShader('shaders/skyVertexShader.shader', 'shaders/skyFragmentShader.shader')
    
#     # uniforms = 
#     #     topColor: { type: 'c', value: new THREE.Color(0x0077ff) }
#     #     bottomColor: { type: 'c', value: new THREE.Color(0xffffff) }
#     #     offset: { type: 'f', value: 33 }
#     #     exponent: { type: 'f', value: 0.6 }

#     skyGeo = new THREE.SphereGeometry(1000, 15, 15)
#     # skyMat = new THREE.ShaderMaterial( 
#     #     vertexShader: shaders.vertexShader, 
#     #     fragmentShader: shaders.fragmentShader, 
#     #     uniforms: uniforms, 
#     #     side: THREE.BackSide 
#     # )

#     ThreeObj.create(ThreeObj.basicMaterial(0x0000ff))(skyGeo)

# treeMaterial = ThreeObj.phongMaterial()
   
# Outside.tree = ->
#     _.compose(ThreeObj.create, ThreeObj.lambertMaterial)(0xff0000)()

