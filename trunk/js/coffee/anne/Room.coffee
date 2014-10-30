module 'Room'

    
# image :: String -> String
image = (name) -> 'img/' + name + '.jpg'

# room :: void -> ThreeMesh
# Room.room = _.compose(ThreeObj.create, Shader.shaderMaterial)

# textureCube = _.map(['s_px', 's_nx', 's_py', 's_ny', 's_pz', 's_nz'], image)
textureCube = _.map(['side', 'side', 'side', 'side', 'side', 'side'], image)

# room :: void -> ThreeMesh
Room.room = ->
    roomShader = THREE.ShaderLib.cube
    roomShader.uniforms.tCube.value = THREE.ImageUtils.loadTextureCube(textureCube)

    roomMaterial = new THREE.ShaderMaterial(
        fragmentShader: roomShader.fragmentShader,
        vertexShader: roomShader.vertexShader,
        uniforms: roomShader.uniforms,
        depthTest: true,
        depthWrite:  true,
        side: THREE.BackSide
    )

    return new THREE.Mesh(
        new THREE.BoxGeometry(2000, 2000, 2000, 100, 100, 100),
        roomMaterial
    )

