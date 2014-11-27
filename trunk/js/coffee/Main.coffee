# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

firstEffect = false
secondEffect = false
thirdEffect = false
forthEffect = false
fifthEffect = false

ambientLight = new THREE.AmbientLight 0xcccccc


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


Sound.ended(Sound.happySad, -> Sound.play(Sound.sad))


window.startExperience = ->
    $('#introscreen').fadeOut(1000)

    Sound.play(Sound.happy)

    firstEvent = setInterval(->
        firstEffect = true
        clearInterval(firstEvent)
    , Timings.firstEvent)

    secondEvent = setInterval(->
        secondEffect = true
        clearInterval(secondEvent)
    , Timings.secondEvent)

    thirdEvent = setInterval(->
        thirdEffect = true
        clearInterval(thirdEvent)
    , Timings.thirdEvent)

    forthEvent = setInterval(->
        forthEffect = true
        clearInterval(forthEvent)
    , Timings.forthEffect)

    fifthEvent = setInterval(->
        fifthEffect = true
        clearInterval(fifthEvent)
    , Timings.fifthEffect)


add = (a) -> a

substract = (a) -> -a


Loader.loadModel(Utils.model('stoel'), (stoel) -> Loader.loadModel(Utils.model('bed'), (bed) -> Loader.loadModel(Utils.model('tafel'), (tafel) -> Loader.loadModel(Utils.model('muur-plank'), (muurplank) -> Loader.loadModel(Utils.model('trees'), (trees) -> Loader.loadModel(Utils.model('omgeving'), (obj) -> Room.create((room, objects) -> Loader.loadModel(Utils.model('luie-stoel'), (luieStoel) -> Loader.loadModel(Utils.model('boekenkast'), (boekenkast) ->

    luieStoel.scale.set(-6, 6, -6)
    luieStoel.position.normalize().set(1, -17, 13)

    luieStoel.material = ThreeObj.texture(Utils.texture 'flat-texture')
    luieStoel.material.transparent = true
    luieStoel.material.alphaTest = 0.1

    luieStoel.rotation.set(0, .4, 0)

    boekenkast.scale.set(6, 6, 6)
    boekenkast.position.normalize().set(-16, -2, 30)

    muurplank.scale.set(-6, 6, -6)
    muurplank.position.normalize().set(-18, -0, -0)
    muurplank.material = ThreeObj.texture(Utils.texture 'wall-texture')


    stoel.scale.set(6, 6, 6)
    stoel.position.set(-4, -13, 0)
    stoel.rotation.set(0, 10, 0)
    stoel.material = ThreeObj.texture(Utils.texture 'wall-texture')

    bed.position.normalize().set(28, -14, 40)
    bed.scale.set(5,5,5)
    bed.material = ThreeObj.texture(Utils.texture 'wall-texture')


    tafel.position.normalize().set(-15, -14, 1)
    tafel.scale.set(5,5,5)
    tafel.material = ThreeObj.texture(Utils.texture 'wall-texture')


    # omgeving.
    trees.position.normalize().set(0, -15, -200)
    trees.scale.set(10,10,10)
    trees.material = ThreeObj.texture(Utils.texture 'wall-texture')

    wolk1 = obj.children[1]
    wolk1.position.normalize().set(0, -20, -150)
    wolk1.oldX = wolk1.position.x
    wolk1.operation = add

    wolk1.scale.set(10,10,10)
    wolk1.material = ThreeObj.texture(Utils.texture 'wall-texture')

    wolk2 = obj.children[3]
    wolk2.position.normalize().set(100, -30, -150)
    wolk2.oldX = wolk2.position.x
    wolk2.operation = add

    wolk2.scale.set(10,10,10)
    wolk2.material = ThreeObj.texture(Utils.texture 'wall-texture')

    wolk3 = obj.children[0]
    wolk3.position.normalize().set(-200, -10, -200)
    wolk3.oldX = wolk3.position.x
    wolk3.operation = add

    wolk3.scale.set(10,10,10)
    wolk3.material = ThreeObj.lambertMaterial (0xffffff)
    wolk3.material = ThreeObj.texture(Utils.texture 'wall-texture')
    # omgeving.
    

    room.position.y = -10
    room.scale.x = 6
    room.scale.y = 6
    room.scale.z = 6


    # Window
    room.children[0].material = ThreeObj.texture(Utils.texture 'cardboard-window-1')
    # Floor
    room.children[1].material = ThreeObj.texture(Utils.texture 'floor')
    # Plinten
    room.children[2].material = ThreeObj.lambertMaterial(color: 0xefd8b8)
    # Roof top-part
    room.children[3].material = ThreeObj.lambertMaterial(color: 0x000000)
    # Roof middle-part
    room.children[4].material = ThreeObj.lambertMaterial(color: 0x000000)
    # Roof bottom-part
    room.children[5].material = ThreeObj.lambertMaterial(color: 0x000000)
    # back wall
    room.children[6].material = ThreeObj.texture(Utils.texture 'wall-texture-back')
    # left wall
    room.children[7].material = ThreeObj.texture(Utils.texture 'wall-texture')
    # right wall
    room.children[8].material = ThreeObj.texture(Utils.texture 'wall-texture2')

    # smallerTime = 100
    # smallerSize = .5

    # Make the walls move towards user.
    # for i in [0..8] by 1
    #     TweenLite.to(room.children[i].scale, smallerTime, { x:smallerSize, y:smallerSize, z:smallerSize })
    #     TweenLite.to(room.children[i].position, smallerTime, { x: room.children[0].position.x * smallerSize, y:room.children[0].position.x * smallerSize, z: room.children[0].position.x * smallerSize})


    mistHold = 250

    
    # alle objecten verplaatsen
    sceneObj = [boekenkast, luieStoel, muurplank, bed, tafel, trees, objects[0], objects[1], stoel, wolk2, wolk3, light, wolk1, sun[0], room, ground]

    ThreeObj.translateAllX(sceneObj, 10)
    ThreeObj.translateAllY(sceneObj, 20)


    $('#preloader').fadeOut(1000)

    Setup.init(Cardboard.camera(), renderer, controls)((scene) ->
        wolk1.position.x = wolk1.oldX += wolk1.operation(.03)
        wolk2.position.x = wolk2.oldX += wolk2.operation(.03)
        wolk3.position.x = wolk3.oldX += wolk3.operation(.03)

        if scene.fog.far > mistHold
            scene.fog.far -= 0.3

        
        # De eerste fase
        if firstEffect == true
            time = 700
            counter = 0
            mistHold = 150

            Sound.play(Sound.lamp)

            lightEffect = ->
                objects[0].visible = !objects[0].visible
                objects[1].visible = !objects[1].visible

                time /= 2

                clearInterval(window.timer)
                if counter < 6
                    window.timer = setInterval(lightEffect, time)
                counter++

            window.timer = setInterval(lightEffect, time)

            firstEffect = false


        if secondEffect == true
            Sound.pause(Sound.happy)
            Sound.play(Sound.happySad)

            TweenLite.to(luieStoel.material, 5, { opacity: 0 })

            mistHold = 100

            TweenLite.to(light, 25, { intensity: .5 })

            secondEffect = false


        if thirdEffect == true
            mistHold = 75
            TweenLite.to(sun[0], 15, { intensity: 0 })
            thirdEffect = false


        if forthEffect == true
            mistHold = 30
            forthEffect = false


        if fifthEffect == true
            mistHold = 0
            fifthEffect = false

            $('canvas').fadeOut(1000)

            # fade in credentials.
            $('#credits').fadeIn(1000)
            
            fifthEffect = false
    )(sceneObj)
)))))))))

