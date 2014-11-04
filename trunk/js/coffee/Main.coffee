# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

ambientLight = new THREE.AmbientLight 0xffffff


light = new THREE.DirectionalLight(0xffffff, .5)
light.position.set(1, 1, 1)

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
    wolk1.position.set(-20, 0, -100)
    wolk1.scale.set(10,10,10)
    wolk1.material = ThreeObj.texture (Utils.texture 'wolk1')

    Room.create((room) ->
        room.position.y = 1
        room.scale.x = 6
        room.scale.y = 6
        room.scale.z = 6

        # Window
        room.children[0].material = ThreeObj.lambertMaterial(color: 0xcccccc)

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
        room.children[9].material = ThreeObj.lambertMaterial(color: 0xcccccc)


        # for debug.
        console.log room
        console.log sun[0]

        Setup.init(Cardboard.camera(), renderer, controls)(
            # Here we put animation stuff.
        )([light, wolk1, room, sun[0], ground])
    )
)
