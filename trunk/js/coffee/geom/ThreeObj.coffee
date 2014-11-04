module 'ThreeObj'

lambertMaterial = (object) -> new THREE.MeshLambertMaterial(object)

# texture :: Image -> ThreeLambertMaterial
ThreeObj.texture = (texture) ->
    texture = THREE.ImageUtils.loadTexture(texture)
    ThreeObj.lambertMaterial(map: texture)

# basicMaterial :: Color -> ThreeBasicMaterial
ThreeObj.basicMaterial = (props) ->
    basic = new THREE.MeshBasicMaterial(props)

# lambertMaterial :: Object -> ThreeLambertMaterial
ThreeObj.lambertMaterial = (props) -> lambertMaterial(props)

ThreeObj.phongMaterial = (props) -> new THREE.MeshPhongMaterial(props)

# boxGeometry :: Object -> ThreeMesh
ThreeObj.boxGeometry = (size) ->
    new THREE.BoxGeometry(size.x, size.y, size.z)

# sphereGeometry :: Int -> Int -> Int -> ThreeMesh
ThreeObj.sphereGeometry = (radius, wsegments, hsegments) ->
    new THREE.SphereGeometry(radius, wsegments, hsegments)

# planeGeometry :: Int -> Int -> ThreeGeometry
ThreeObj.planeGeometry = (width, height) ->
    new THREE.PlaneGeometry(width, height)

# create :: Material -> Geometry -> ThreeMesh
ThreeObj.create = (material) ->
    (geometry) ->
        new THREE.Mesh(geometry, material)

# testCube :: Size -> ThreeMesh
ThreeObj.testCube = (size) ->
    obj = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)(0xff0000)(ThreeObj.boxGeometry(size))
    obj.castShadow = true
    obj.receiveShadow = true
    return obj
