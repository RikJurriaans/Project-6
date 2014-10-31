# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

ambientLight = Light.ambientLight 0xffffff

dirLight = Light.directionalLight 0x000044
dirLight.position.set(0, 0, 0).normalize()

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

Loader.bulkLoad('models/objects.json')


# loader.load("", (obj) ->
Setup.init(Cardboard.camera(), renderer, controls)(
    # Here we put animation stuff.
)([ambientLight, dirLight, Room.room()])
# )


# loader.load('models/objects.json', (geometry) ->
#     obj = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)
    
# )

