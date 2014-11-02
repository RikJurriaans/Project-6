# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.


# ambientLight = Light.ambientLight 0x000000
# ambientLight.intensity = 0.3

# dirLight = Light.directionalLight 0xffffff
# dirLight.intensity = 0.5
# dirLight.position.set(0, 10, 0)

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

# hemisphereLight = new THREE.HemisphereLight(0xffffff, 0xa38354, 0.5)

# cube = ThreeObj.testCube(x: 1, y: 1, z:1)
# cube.position.set(4, 1, 1)

ground = Room.ground()

sun = Outside.sunlight()


Loader.loadModel('models/room.json', (obj) ->
    room = obj
    room.position.y = -5
    room.scale.x = 3
    room.scale.y = 3
    room.scale.z = 3

    Setup.init(Cardboard.camera(), renderer, controls)(
        # Here we put animation stuff.
    )([ground, sun[0], sun[1], room])

)
