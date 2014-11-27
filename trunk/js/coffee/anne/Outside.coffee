module 'Outside'

Outside.sunlight = ->
    # hemilight = new THREE.HemisphereLight(0x3385ff, 0xffc871, 0.05)
    # hemilight.color.setHSL(0.6, 1, 0.6)
    # hemilight.groundColor.setHSL(0.095, 1, 0.75)
    # hemilight.position.set(0, 500, 0)


    sunlight = new THREE.DirectionalLight(0xffffff, .5)
    sunlight.position.set(-100, 100, -100)

    # TODO: Optimize shadows.
    # sunlight.shadowDarkness = 0.5
    # sunlight.castShadow = true

    # sunlight.position.multiplyScalar(50)


    sunlight.shadowMapWidth = 1000
    sunlight.shadowMapHeight = 1000

    sunlight.shadowCameraNear = 10
    sunlight.shadowBias = -0.0001

    [sunlight]


add = (a) -> a
substract = (a) -> -a

Outside.ground = ->
    mat = ThreeObj.texture(Utils.image 'floor')

    grn = ThreeObj.create(mat)(new THREE.CircleGeometry(200, 200))
    grn.rotation.x = -Math.PI / 2
    grn.position.y = -19
    grn.receiveShadow = true

    return grn

