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

ground = Outside.ground()
sun = Outside.sunlight()

# Er moet een preloader in...
Room.create((room) ->
    console.log room

    room.position.y = -1
    room.scale.x = 10
    room.scale.y = 10
    room.scale.z = 10

    Setup.init(Cardboard.camera(), renderer, controls)(
        # Here we put animation stuff.
    )([room, ground, sun[0], sun[1]])
)




    # room = obj
    # room.position.y = -5
    # room.scale.x = 3
    # room.scale.y = 3
    # room.scale.z = 3

    # for x in room.children
    #     x.castShadow = true
    #     x.receiveShadow = true


# )
