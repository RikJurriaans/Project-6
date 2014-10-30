module 'ThreeObj'

ThreeObj.set = (object) -> 
    (property) -> 
        (val) ->
            object.position[property] = val
            object

lambertMaterial = (object) -> new THREE.MeshLambertMaterial(object)
    
# texture :: Image -> ThreeLambertMaterial
ThreeObj.texture = (texture) ->
    lambertMaterial( map: THREE.ImageUtils.loadTexture(texture) )

# basicMaterial :: Color -> ThreeBasicMaterial
ThreeObj.basicMaterial = (color) ->
    new THREE.MeshBasicMaterial( color: color )

# lambertMaterial :: Color -> ThreeLambertMaterial
ThreeObj.lambertMaterial = (color) -> lambertMaterial( color: color )

# boxGeometry :: Object -> ThreeMesh
ThreeObj.boxGeometry = (size) ->
    new THREE.BoxGeometry(size.x, size.y, size.z)

# sphereGeometry :: Int -> Int -> Int -> ThreeMesh
ThreeObj.sphereGeometry = (radius, wsegments, hsegments) ->
    new THREE.SphereGeometry(radius, wsegments, hsegments)

# create :: Material -> Geometry -> ThreeMesh
ThreeObj.create = (material) ->
    (geometry) -> 
        new THREE.Mesh(geometry, material)

