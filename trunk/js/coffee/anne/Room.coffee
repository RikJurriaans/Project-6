module 'Room'

    
# image :: String -> String
image = (name) -> 'img/' + name + '.jpg'

# room :: void -> ThreeMesh
# Room.room = _.compose(ThreeObj.create, Shader.shaderMaterial)

# textureCube = _.map(['s_px', 's_nx', 's_py', 's_ny', 's_pz', 's_nz'], image)
# textureCube = _.map(['front', 'side', 'side', 'side', 'side', 'side'], image)

# room :: void -> ThreeMesh
# Room.sky = ->
#     roomShader = THREE.ShaderLib.cube
#     roomShader.uniforms.tCube.value = THREE.ImageUtils.loadTextureCube(textureCube)

#     roomMaterial = new THREE.ShaderMaterial(
#         fragmentShader: roomShader.fragmentShader,
#         vertexShader: roomShader.vertexShader,
#         uniforms: roomShader.uniforms,
#         depthTest: false,
#         depthWrite:  false,
#         side: THREE.BackSide
#     )

#     return new THREE.Mesh(
#         new THREE.BoxGeometry(10000, 10000, 10000, 1, 1, 1, null, true),
#         roomMaterial
#     )

Room.ground = -> 
    # mat = ThreeObj.phongMaterial(ambient: 0xffffff, shininess: 20, color: 0xff0000, specular: 0x050505)
    mat = ThreeObj.texture(image 'floor')
    mat.depthWrite = true

    grn = ThreeObj.create(mat)(new THREE.CircleGeometry(100, 100))
    grn.rotation.x = -Math.PI / 2
    grn.position.y = -10
    # grn.receiveShadow = true

    return grn



