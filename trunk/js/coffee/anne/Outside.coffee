module 'Outside'

Outside.sunlight = ->
    hemilight = new THREE.HemisphereLight(0x3385ff, 0xffc871, 0.05)
    # hemilight.color.setHSL(0.6, 1, 0.6)
    # hemilight.groundColor.setHSL(0.095, 1, 0.75)
    hemilight.position.set(0, 500, 0)

    d = 50

    sunlight = new THREE.DirectionalLight(0xffffff, 0.5)
    sunlight.position.set(-5, 5, 0)
    sunlight.shadowDarkness = 0.5
    sunlight.castShadow = true
    sunlight.position.multiplyScalar(50)

    # sunlight.shadowCameraVisible = true

    sunlight.shadowCameraLeft = d
    sunlight.shadowCameraRight = -d
    sunlight.shadowCameraTop = d
    sunlight.shadowCameraBottom = -d

    sunlight.shadowMapWidth = 3000
    sunlight.shadowMapHeight = 3000

    sunlight.shadowCameraNear = 10
    # sunlight.shadowCameraFar = 3500
    sunlight.shadowBias = -0.00001

    [sunlight, hemilight]


Outside.ground = ->
    # mat = ThreeObj.phongMaterial(ambient: 0xffffff, shininess: 20, color: 0xff0000, specular: 0x050505)
    mat = ThreeObj.texture(Utils.image 'floor')

    grn = ThreeObj.create(mat)(new THREE.CircleGeometry(100, 100))
    grn.rotation.x = -Math.PI / 2
    grn.position.y = -10
    # grn.castShadow = true
    grn.receiveShadow = true

    return grn

# Outside.sky = ->
#     shaders = Loader.loadShader('shaders/skyVertexShader.shader', 'shaders/skyFragmentShader.shader')
    
#     uniforms =
#         topColor: { type: 'c', value: new THREE.Color(0x0077ff) }
#         bottomColor: { type: 'c', value: new THREE.Color(0xffffff) }
#         offset: { type: 'f', value: 33 }
#         exponent: { type: 'f', value: 0.6 }

#     skyGeo = new THREE.SphereGeometry(1000, 15, 15)
#     skyMat = new THREE.ShaderMaterial(
#         vertexShader: shaders.vertexShader,
#         fragmentShader: shaders.fragmentShader,
#         uniforms: uniforms,
#         side: THREE.BackSide
#     )

#     ThreeObj.create(ThreeObj.basicMaterial(0x0000ff))(skyGeo)


# treeMaterial = ThreeObj.phongMaterial()
   
# Outside.tree = ->
#     _.compose(ThreeObj.create, ThreeObj.lambertMaterial)(0xff0000)()

