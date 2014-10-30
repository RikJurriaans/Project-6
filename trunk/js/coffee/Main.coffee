# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

ambientLight = Light.ambientLight 0xffffff

dirLight = Light.directionalLight 0x000044
dirLight.position.set(0, 0, 0).normalize()

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

loader = new THREE.JSONLoader
console.log loader

loader.load('models/objects.json', (geometry) ->
    obj = ThreeObj.create(ThreeObj.lambertMaterial(0xff0000))(geometry)

    # Setup.init(Cardboard.camera(), renderer, controls)(
    #     # Here we put animation stuff.
    # )([ambientLight, dirLight, Room.room(), obj])
)

