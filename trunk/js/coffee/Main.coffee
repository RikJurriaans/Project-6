# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

firstEffect = false
secondEffect = false
thirdEffect = false
forthEffect = false
fifthEffect = false


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




window.startExperience = ->
    $('#introscreen').fadeOut(1000)

    # Sound.play(Sound.happy)

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
    , Timings.forthEvent)

    fifthEvent = setInterval(->
        fifthEffect = true
        clearInterval(fifthEvent)
    , Timings.fifthEvent)


add = (a) -> a

substract = (a) -> -a


Sound.initSounds(Loader.loadModel(Utils.model('stoel'), (stoel) -> Loader.loadModel(Utils.model('planken'), (planken) -> Loader.loadModel(Utils.model('typemachine'), (typemachine) -> Loader.loadModel(Utils.model('huisje'), (huisje) -> Loader.loadModel(Utils.model('bed'), (bed) -> Loader.loadModel(Utils.model('tafel'), (tafel) -> Loader.loadModel(Utils.model('muur-plank'), (muurplank) -> Loader.loadModel(Utils.model('trees2'), (trees2) -> Loader.loadModel(Utils.model('trees'), (trees) -> Loader.loadModel(Utils.model('omgeving'), (obj) -> Room.create((room, objects) -> Loader.loadModel(Utils.model('luie-stoel'), (luieStoel) -> Loader.loadModel(Utils.model('boekenkast'), (boekenkast) -> 

    luieStoel.scale.set(-6, 6, -6)
    luieStoel.position.normalize().set(1, -17, 13)

    luieStoel.material = ThreeObj.texture(Utils.texture 'flat-texture')
    luieStoel.material.transparent = true
    luieStoel.material.alphaTest = 0.1

    luieStoel.rotation.set(0, .4, 0)

    boekenkast.scale.set(6, 6, 6)
    boekenkast.position.set(-17, -1, 30)
    for i in [0..12]
        boekenkast.children[i].material = ThreeObj.texture(Utils.texture 'flat-texture')


    muurplank.scale.set(-6, 6, -6)
    muurplank.position.normalize().set(-18, -0, -0)
    muurplank.material = ThreeObj.texture(Utils.texture 'wall-texture')
    for i in [0..2]
        muurplank.children[i].material = ThreeObj.texture(Utils.texture 'flat-texture')


    stoel.scale.set(6, 6, 6)
    stoel.position.set(-4, -13, 0)
    stoel.rotation.set(0, 10, 0)
    for i in [0..9]
        stoel.children[i].material = ThreeObj.texture(Utils.texture 'flat-texture')

    typemachine.scale.set(-6, 6, -6)
    typemachine.position.set(-7, -6, 0)

    bed.position.normalize().set(28, -14, 40)
    bed.scale.set(5,5,5)

    bed.children[0].material = ThreeObj.texture(Utils.texture 'flat-texture')
    bed.children[1].material = ThreeObj.texture(Utils.texture 'flat-texture')
    bed.children[3].material = ThreeObj.texture(Utils.texture 'flat-texture')
    bed.children[4].material = ThreeObj.texture(Utils.texture 'flat-texture')


    # kussen
    bed.children[8].material = ThreeObj.texture(Utils.texture 'flat-texture')
    # matras
    bed.children[5].material = ThreeObj.texture(Utils.texture 'flat-texture')
    # dekbed
    bed.children[6].material = ThreeObj.texture(Utils.texture 'flat-texture')

    bed.children[7].material = ThreeObj.texture(Utils.texture 'flat-texture')


    tafel.position.normalize().set(-10, -14, 1)
    tafel.scale.set(6,6,6)
    for i in [0..5]
        tafel.children[i].material = ThreeObj.texture(Utils.texture 'flat-texture')


    # omgeving.
    trees.position.normalize().set(-35, -14, -180)
    trees.scale.set(10,10,10)
    trees.material = ThreeObj.texture(Utils.texture 'flat-texture')

    huisje.scale.set(10,10,10)
    huisje.position.normalize().set(30, -14, -200)
    huisje.rotation.set(0, .2, 0)
    huisje.material = ThreeObj.texture(Utils.texture 'flat-texture')


    trees2.position.normalize().set(40, -18, -250)
    trees2.scale.set(10,10,10)
    trees2.material = ThreeObj.texture(Utils.texture 'flat-texture')


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
    
    planken.scale.set(6, 6, 6)
    planken.position.set(8,1,-9)

    for i in planken.children
        i.visible = false

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
    room.children[3].visible = false
    # Roof middle-part
    room.children[4].material = ThreeObj.lambertMaterial(color: 0x000000)
    room.children[4].visible = false
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
    sceneObj = [planken, typemachine, huisje, trees2, boekenkast, luieStoel, muurplank, bed, tafel, trees, objects[0], objects[1], stoel, wolk2, wolk3, light, wolk1, sun[0], room, ground]

    ThreeObj.translateAllX(sceneObj, 10)
    ThreeObj.translateAllY(sceneObj, 20)


    $('#preloader').fadeOut(1000)

    Setup.init(Cardboard.camera(), renderer, controls)((scene) ->
        wolk1.position.x = wolk1.oldX += wolk1.operation(.03)
        wolk2.position.x = wolk2.oldX += wolk2.operation(.03)
        wolk3.position.x = wolk3.oldX += wolk3.operation(.03)

        if scene.fog.far > mistHold
            scene.fog.far -= 0.1

        # De eerste fase
        if firstEffect == true
            time = 700
            counter = 0
            mistHold = 200

            # Sound.play(Sound.lamp)



            lightEffect = ->
                objects[0].visible = !objects[0].visible
                objects[1].visible = !objects[1].visible

                time /= 2

                clearInterval(window.timer)

                counter++
                if counter < 7
                    clearInterval(window.timer)
                    window.timer = setInterval(lightEffect, time)

            TweenLite.to(huisje.material, 5, { opacity: 0 })

            window.timer = setInterval(lightEffect, time)

            firstEffect = false


        if secondEffect == true
            clearInterval(window.timer)

            # Sound.pause(Sound.happy)
            # Sound.play(Sound.happySad)

            # Roof top-part
            room.children[4].visible = true

            TweenLite.to(luieStoel.material, 5, { opacity: 0 })

            mistHold = 150

            TweenLite.to(light, 25, { intensity: .5 })

            secondEffect = false


        if thirdEffect == true
            mistHold = 100
            TweenLite.to(sun[0], 15, { intensity: 0 })

            TweenLite.to(bed.children[0].position, 1, { y: -1, delay: .5, onComplete: -> bed.children[0].visible = false })
            TweenLite.to(bed.children[1].position, 1, { y: -1, delay: .3, onComplete: -> bed.children[1].visible = false })
            TweenLite.to(bed.children[3].position, 1, { y: -1, delay: .6, onComplete: -> bed.children[3].visible = false })
            TweenLite.to(bed.children[4].position, 1, { y: -1, delay: .4, onComplete: -> bed.children[4].visible = false })
            TweenLite.to(bed.children[7].position, 1, { y: -1, delay: .4, onComplete: -> bed.children[7].visible = false })
            TweenLite.to(bed.children[8].position, 1, { y: -1, delay: .4, onComplete: -> bed.children[8].visible = false })

            TweenLite.to(bed.children[5].position, 1, { y: 0, delay: .4, onComplete: -> bed.children[8].visible = false })
            TweenLite.to(bed.children[6].position, 1, { y: .5, delay: .4, onComplete: -> bed.children[8].visible = false })

            # Roof top-part
            room.children[3].visible = true

            thirdEffect = false


        if forthEffect == true
            mistHold = 75

            TweenLite.to(planken.children[0], 1, { visible: true })
            TweenLite.to(planken.children[1], 1, { visible: true, delay: 3 })
            TweenLite.to(planken.children[2], 1, { visible: true, delay: 5 })
            TweenLite.to(planken.children[3], 1, { visible: true, delay: 6 })
            TweenLite.to(planken.children[4], 1, { visible: true, delay: 6 })
            TweenLite.to(planken.children[5], 1, { visible: true, delay: 6.3 })
            TweenLite.to(planken.children[6], 1, { visible: true, delay: 6.6 })

            forthEffect = false


        if fifthEffect == true
            mistHold = 0
            fifthEffect = false

            fifthEffect = false

        if scene.fog.far <= 1
            $('canvas').fadeOut(1000)

            # fade in credentials.
            $('#credits').fadeIn(1000)
            

    )(sceneObj)
))))))))))))))

