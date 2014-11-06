# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

ambientLight = new THREE.AmbientLight 0x0f0f0f


light = new THREE.DirectionalLight(0xffffff, 1.5)
light.position.set(100, 100, 100)

d = 50
light.shadowCameraVisible = true

light.shadowCameraLeft = d
light.shadowCameraRight = -d
light.shadowCameraTop = d
light.shadowCameraBottom = -d

console.log light

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

ground = Outside.ground()
sun = Outside.sunlight()

# Er moet een preloader in...
Loader.loadModel(Utils.model('omgeving'), (obj) ->
    wolk1 = obj.children[1]
    wolk1.position.normalize().set(0, 10, -100)
    wolk1.oldX = wolk1.position.x

    wolk1.scale.set(10,10,10)
    wolk1.material = ThreeObj.texture (Utils.texture 'wolk1')
    # wolk1.material = ThreeObj.lambertMaterial (color: 0xffffff)

    wolk2 = obj.children[3]
    wolk2.position.normalize().set(0, 3, -100)
    wolk2.oldX = wolk2.position.x

    wolk2.scale.set(10,10,10)
    wolk2.material = ThreeObj.lambertMaterial (0xffffff)

    wolk3 = obj.children[0]
    wolk3.position.normalize().set(0, 0, -200)
    wolk3.oldX = wolk3.position.x

    wolk3.scale.set(10,10,10)
    wolk3.material = ThreeObj.lambertMaterial (0xffffff)


    console.log wolk2, wolk3

    Room.create((room) ->
        room.position.y = -10
        room.scale.x = 6
        room.scale.y = 6
        room.scale.z = 6

        # Window
        room.children[0].material = ThreeObj.texture(Utils.texture 'cardboard-window-1')
        # room.children[0].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # Floor
        room.children[1].material = ThreeObj.texture(Utils.texture 'floor')

        # Plinten
        room.children[2].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # Roof top-part
        room.children[3].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # Roof middle-part
        room.children[4].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # Roof bottom-part
        room.children[5].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # back wall
        room.children[6].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # left wall
        room.children[7].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # right wall
        room.children[8].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        # box??
        # room.children[9].material = ThreeObj.lambertMaterial(color: 0x00ff00)


        # for debug.
        console.log room
        console.log sun[0]

        Setup.init(Cardboard.camera(), renderer, controls)(->
            # Here we put animation stuff.
            wolk1.position.x = wolk1.oldX += .01

        )([wolk2, wolk3, ambientLight, light, wolk1, sun[0], room, ground])
    )
)
