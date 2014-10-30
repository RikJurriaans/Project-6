module 'Stellar' 

# Grab the latest star data.
data = Loader.loadJson("http://www.astro-phys.com/api/de406/states?bodies=sun,%20mercury,%20venus,%20earth,%20moon,%20earthmoon,%20geomoon,%20mars,%20jupiter,%20uranus,%20neptune,%20pluto")


# image :: String -> String
image = (name) -> 'img/' + name + '.jpg'

# size :: Int -> Float
size = (scale) -> sunRadius / scale

# sizes :: Object
sizes = 
    earth: size 13, 
    jupiter: size 2, 
    mercury: size 26, 
    neptune: size 5, 
    uranus: size 6, 
    venus: size 13, 
    mars: size 26, 
    pluto: size 26


# texture :: Object
textures = 
    earth: image 'earth',
    jupiter: image 'jupiter', 
    mercury: image 'mercury', 
    neptune: image 'neptune', 
    uranus: image 'uranus', 
    venus: image 'venus', 
    mars: image 'mars', 
    pluto: image 'pluto'

# scale :: Int
# scale = 100000
scale = 500000

# sunRadius :: Number
sunRadius = 5

# sun :: void -> ThreeMesh
sun = ->
    sunMeterial = ThreeObj.lambertMaterial
    planet = _.compose(ThreeObj.create, sunMeterial)
    sun = planet(0xffffff)(ThreeObj.sphereGeometry(sunRadius/10, 100, 100))
    sun.position.set(data.results.sun[0][0]/ scale, data.results.sun[0][1]/ scale, data.results.sun[0][2]/ scale)

# space :: void -> ThreeMesh
# space = ->
#     skyBoxTexture = THREE.ImageUtils.loadTextureCube([
#         image 's_px',
#         image 's_nx',
#         image 's_py',
#         image 's_ny',
#         image 's_pz',
#         image 's_nz'
#     ])
#     skyBoxShader = THREE.ShaderLib.cube
#     skyBoxShader.uniforms.tCube.value = skyBoxTexture
#     skyBoxMaterial = new THREE.ShaderMaterial(
#         fragmentShader: skyBoxShader.fragmentShader,
#         vertexShader: skyBoxShader.vertexShader,
#         uniforms: skyBoxShader.uniforms,
#         deptTest: false,
#         depthWrite: false,
#         side: THREE.BackSide
#     )
#     skyBox = new THREE.Mesh(
#         new THREE.BoxGeometry(100000, 100000, 100000),
#         skyBoxMaterial
#     )


# basicPlanet :: Color -> ThreeMesh -> ThreeMesh
basicPlanet = _.compose(ThreeObj.create, ThreeObj.texture)

# makeGeom :: String -> ThreeMesh
makeGeom = (name) ->
    geom = basicPlanet(image name)(ThreeObj.sphereGeometry(sizes[name], 100, 100))
    geom.name = name
    return geom

# positionPlanet :: ThreeMesh -> ThreeMesh
positionPlanet = (planet) ->
    planet.position.set(data.results[planet.name][0][0]/ scale, 
                        data.results[planet.name][0][1]/ scale, 
                        data.results[planet.name][0][2]/ scale)
    planet

# planet :: String -> ThreeGeom -> ThreeMesh
planet = _.compose(positionPlanet, makeGeom)

# basic :: void -> Array
Stellar.basic = [sun()]

# planets :: Array -> Array
Stellar.planets = (planets...) -> _.map(planets, planet)
