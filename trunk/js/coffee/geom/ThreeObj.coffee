module 'ThreeObj'

lambertMaterial = (object) -> new THREE.MeshLambertMaterial(object)

# texture :: Image -> ThreeLambertMaterial
ThreeObj.texture = (texture) ->
    texture = THREE.ImageUtils.loadTexture(texture)
    ThreeObj.basicMaterial( map: texture )

# basicMaterial :: Color -> ThreeBasicMaterial
ThreeObj.basicMaterial = (props) ->
    basic = new THREE.MeshBasicMaterial(props)

# lambertMaterial :: Color -> ThreeLambertMaterial
ThreeObj.lambertMaterial = (color) -> lambertMaterial(color)

ThreeObj.phongMaterial = (props) -> 
    phn = new THREE.MeshPhongMaterial(props)
    phn.castShadow = true
    phn.receiveShadow = true
    return phn

# boxGeometry :: Object -> ThreeMesh
ThreeObj.boxGeometry = (size) ->
    new THREE.BoxGeometry(size.x, size.y, size.z)

# sphereGeometry :: Int -> Int -> Int -> ThreeMesh
ThreeObj.sphereGeometry = (radius, wsegments, hsegments) ->
    new THREE.SphereGeometry(radius, wsegments, hsegments)

ThreeObj.planeGeometry = (width, height) ->
    new THREE.PlaneGeometry(width, height)

# create :: Material -> Geometry -> ThreeMesh
ThreeObj.create = (material) ->
    (geometry) -> 
        new THREE.Mesh(geometry, material)

ThreeObj.testCube = (size) -> 
    _.compose(ThreeObj.create, ThreeObj.lambertMaterial)(0x00ff00)(ThreeObj.boxGeometry(size))
