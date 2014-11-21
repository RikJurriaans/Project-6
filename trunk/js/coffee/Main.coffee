# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

firstEffect = false
secondEffect = false

ambientLight = new THREE.AmbientLight 0xcccccc
# console.log ambientLight


light = new THREE.DirectionalLight(0xffffff, 1.5)
light.position.set(100, 100, 100)

d = 50
light.shadowCameraVisible = true

light.shadowCameraLeft = d
light.shadowCameraRight = -d
light.shadowCameraTop = d
light.shadowCameraBottom = -d


renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init

ground = Outside.ground()
sun = Outside.sunlight()


add = (a) -> a

substract = (a) -> -a

Loader.loadModel(Utils.model('omgeving'), (obj) ->
    # ik weet het lelijk maar fuck it.
    wolk1 = obj.children[1]
    wolk1.position.normalize().set(0, -20, -150)
    wolk1.oldX = wolk1.position.x
    wolk1.operation = add

    wolk1.scale.set(10,10,10)
    wolk1.material = ThreeObj.lambertMaterial (color: 0xffffff)

    wolk2 = obj.children[3]
    wolk2.position.normalize().set(100, -30, -150)
    wolk2.oldX = wolk2.position.x
    wolk2.operation = add

    wolk2.scale.set(10,10,10)
    wolk2.material = ThreeObj.lambertMaterial (0xffffff)

    wolk3 = obj.children[0]
    wolk3.position.normalize().set(-200, -10, -200)
    wolk3.oldX = wolk3.position.x
    wolk3.operation = add

    wolk3.scale.set(10,10,10)
    wolk3.material = ThreeObj.lambertMaterial (0xffffff)


    firstEvent = setInterval(->
        firstEffect = true
        clearInterval(firstEvent)
    , Timings.firstEvent)

    secondEvent = setInterval(->
        secondEvent = true
        clearInterval(secondEvent)
    , Timings.secondEvent)


    Room.create((room, objects) ->
        room.position.y = -10
        room.scale.x = 6
        room.scale.y = 6
        room.scale.z = 6

        # Window
        room.children[0].material = ThreeObj.texture(Utils.texture 'cardboard-window-1')

        # Floor
        room.children[1].material = ThreeObj.texture(Utils.texture 'floor')
        room.children[1].receiveShadow = true

        # Plinten
        room.children[2].material = ThreeObj.lambertMaterial(color: 0xefd8b8)

        # Roof top-part
        room.children[3].material = ThreeObj.lambertMaterial(color: 0x000000)
        room.children[3].visible = true

        # Roof middle-part
        room.children[4].material = ThreeObj.lambertMaterial(color: 0x000000)
        room.children[4].visible = true

        # Roof bottom-part
        room.children[5].material = ThreeObj.lambertMaterial(color: 0x000000)

        # back wall
        room.children[6].material = ThreeObj.texture(Utils.texture 'wall-texture-back')

        # left wall
        # room.children[7].material = ThreeObj.lambertMaterial(color: 0x000000, ambient: 0xffffff, emissive: 0x0c0c0c)
        # console.log room.children[7].material
        room.children[7].material = ThreeObj.texture(Utils.texture 'wall-texture')

        # right wall
        room.children[8].material = ThreeObj.texture(Utils.texture 'wall-texture2')
        # room.children[8].material = ThreeObj.lambertMaterial(color: 0xcccccc)

        stoel = objects[2]
        stoel.scale.set(6, 6, 6)
        stoel.position.set(-4, -13, 0)
        stoel.rotation.set(0, 10, 0)


        Setup.init(Cardboard.camera(), renderer, controls)((scene) ->
            wolk1.position.x = wolk1.oldX += wolk1.operation(.03)
            wolk2.position.x = wolk2.oldX += wolk2.operation(.03)
            wolk3.position.x = wolk3.oldX += wolk3.operation(.03)

            # De eerste fase
            if firstEffect == true
                time = 700
                counter = 0

                lightEffect = ->
                    objects[0].visible = !objects[0].visible
                    objects[1].visible = !objects[1].visible

                    time /= 2

                    console.log counter

                    clearInterval(window.timer)
                    if counter < 6
                        window.timer = setInterval(lightEffect, time)
                    counter++

                window.timer = setInterval(lightEffect, time)

                firstEffect = false

            if secondEvent == true
                secondEvent = false

        )([objects[0], objects[1], stoel, wolk2, wolk3, light, wolk1, sun[0], room, ground])
    )
)
