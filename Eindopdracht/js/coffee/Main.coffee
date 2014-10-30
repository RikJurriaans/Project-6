# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

ambientLight = Light.ambientLight 0xffffff

dirLight = Light.directionalLight 0x000044
dirLight.position.set(0, 0, 0).normalize()

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

planets = Stellar.planets('earth', 'jupiter', 'mercury', 'neptune', 'venus', 'mars', 'pluto', 'uranus')

sceneObjects = _.union([ambientLight, dirLight], Stellar.basic, planets)

Setup.init(Cardboard.camera(), renderer, controls)(
    # Here we put animation stuff.
)(sceneObjects)
