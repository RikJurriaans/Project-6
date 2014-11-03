# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.


# ambientLight = Light.ambientLight 0x0c0c0c
# ambientLight.intensity = 0.3

# dirLight = Light.directionalLight 0xffffff
# dirLight.intensity = 0.2
# dirLight.position.set(0, 5, 0)

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

cube = ThreeObj.testCube(x:1, y:1, z:1)
cube.position.set(2, 2, 1)

ground = Outside.ground()
sun = Outside.sunlight()


Loader.loadModel('models/room.json', (obj) ->
    room = obj
    room.position.y = -5
    room.scale.x = 3
    room.scale.y = 3
    room.scale.z = 3

    for x in room.children
        x.castShadow = true
        x.receiveShadow = true

    Setup.init(Cardboard.camera(), renderer, controls)(
        # Here we put animation stuff.
    )([room, ground, sun[0], sun[1]])

)
