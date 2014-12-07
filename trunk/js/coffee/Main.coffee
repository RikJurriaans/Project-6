# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

# Hier begint de preloader.

times = (->
    times = _.map([5,10,25,15,25], Utils.toMilliseconds)
    _.map(_.zip(times, [].concat([0], _.rest(times))),
        (x) -> x[0] + x[1])
)()

effects = _.map(times, (x) -> false)

soundsReady = 0

# play start sound.
Sound.initSounds(->
    soundsReady++
    if soundsReady == 3
        doRest()


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


startExperience = ->
    $('#introscreen').fadeOut(1000)

    createjs.Sound.play('happy', { loop:-1 })

    # Make a list of events.
    events = _.map(times, (time, i) ->
        setInterval(->
            effects[i] = true
            clearInterval(events[i])
        , time)
    )

$('#start').bind('click', startExperience)

standardTexture = ThreeObj.texture(Utils.texture 'flat-texture')
standardTextureList = (children) -> _.map(children, (x) -> x.material = standardTexture)


doRest = ->
    Loader.loadModel(Utils.model('lamp'), (lamp) -> Loader.loadModel(Utils.model('paspop'), (paspop) -> Loader.loadModel(Utils.model('stoel'), (stoel) -> Loader.loadModel(Utils.model('planken'), (planken) -> Loader.loadModel(Utils.model('typemachine'), (typemachine) -> Loader.loadModel(Utils.model('huisje'), (huisje) -> Loader.loadModel(Utils.model('bed'), (bed) -> Loader.loadModel(Utils.model('tafel'), (tafel) -> Loader.loadModel(Utils.model('muur-plank'), (muurplank) -> Loader.loadModel(Utils.model('trees2'), (trees2) -> Loader.loadModel(Utils.model('trees'), (trees) -> Loader.loadModel(Utils.model('omgeving'), (obj) -> Room.create((room, objects) -> Loader.loadModel(Utils.model('luie-stoel'), (luieStoel) -> Loader.loadModel(Utils.model('boekenkast'), (boekenkast) -> 

        luieStoel.scale.set(-6, 6, -6)
        luieStoel.position.normalize().set(1, -17, 13)

        luieStoel.material = ThreeObj.texture(Utils.texture 'flat-texture')
        luieStoel.material.transparent = true
        luieStoel.material.alphaTest = 0.1

        luieStoel.rotation.set(0, .4, 0)

        boekenkast.scale.set(6, 6, 6)
        boekenkast.position.set(-17, -1, 30)
        standardTextureList(boekenkast.children)

        muurplank.scale.set(-6, 6, -6)
        muurplank.position.normalize().set(-18, -0, -0)
        standardTextureList(muurplank.children)


        stoel.scale.set(6, 6, 6)
        stoel.position.set(-4, -13, 0)
        stoel.rotation.set(0, 10, 0)
        standardTextureList(stoel.children)

        typemachine.scale.set(-6, 6, -6)
        typemachine.position.set(-7, -6, 0)
        standardTextureList(typemachine.children)

        bed.position.normalize().set(28, -14, 40)
        bed.scale.set(5,5,5)
        standardTextureList(bed.children)


        tafel.position.normalize().set(-10, -14, 1)
        tafel.scale.set(6,6,6)
        standardTextureList(tafel.children)


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
        wolk1.operation = (a) -> a

        wolk1.scale.set(10,10,10)

        wolk2 = obj.children[3]
        wolk2.position.normalize().set(100, -30, -150)
        wolk2.oldX = wolk2.position.x
        wolk2.operation = (a) -> a

        wolk2.scale.set(10,10,10)

        wolk3 = obj.children[0]
        wolk3.position.normalize().set(-200, -10, -200)
        wolk3.oldX = wolk3.position.x
        wolk3.operation = (a) -> a

        wolk3.scale.set(10,10,10)

        standardTextureList(obj.children)
        
        planken.scale.set(6, 6, 6)
        planken.position.set(8,1,-9)
        _.map(planken.children, (x) -> x.visible = false)
        standardTextureList(planken.children)


        room.position.y = -10
        room.scale.set(6,6,6)

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


        mistHold = 250
        
        paspop.scale.set(6,6,6)
        paspop.position.set(-16, -4, 16)
        standardTextureList(paspop.children)

        lamp.scale.set(-6,6,6)
        lamp.position.set
        

        # alle objecten verplaatsen
        sceneObj = [lamp, paspop, planken, typemachine, huisje, trees2, boekenkast, luieStoel, muurplank, bed, tafel, trees, objects[0], objects[1], stoel, wolk2, wolk3, light, wolk1, sun[0], room, ground]

        ThreeObj.translateAllX(sceneObj, 10)
        ThreeObj.translateAllY(sceneObj, 20)


        # Hier stopt de preloader.
        $('#preloader').fadeOut(1000)

        Setup.init(Cardboard.camera(), renderer, controls)((scene) ->
            # dit kan met tweener.
            wolk1.position.x = wolk1.oldX += wolk1.operation(.03)
            wolk2.position.x = wolk2.oldX += wolk2.operation(.03)
            wolk3.position.x = wolk3.oldX += wolk3.operation(.03)

            if scene.fog.far > mistHold
                scene.fog.far -= 0.1

            # De eerste fase
            if effects[0] == true
                time = 700
                counter = 0
                mistHold = 200

                createjs.Sound.play('lamp')

                lightEffect = ->
                    objects[0].visible = !objects[0].visible
                    objects[1].visible = !objects[1].visible

                    time /= 2

                    clearInterval(window.timer)

                    counter++
                    if counter < 7
                        clearInterval(window.timer)
                        window.timer = setInterval(lightEffect, time)

                TweenLite.to(huisje.position, 5, { y: -100 })

                window.timer = setInterval(lightEffect, time)

                firstEffect = false
                effects[0] = false


            if effects[1] == true
                clearInterval(window.timer)

                createjs.Sound.stop('happy')
                createjs.Sound.play('happySad')
                    .addEventListener('complete', -> createjs.Sound.play('sad'))

                
                # Roof top-part
                room.children[4].visible = true

                TweenLite.to(luieStoel.position, 5, { y: -100 })

                mistHold = 150

                TweenLite.to(light, 25, { intensity: .5 })

                effects[1] = false


            if effects[2] == true
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

                effects[2] = false


            if effects[3] == true
                mistHold = 75

                TweenLite.to(light, 25, { intensity: 0 })
                TweenLite.to(planken.children[0], 1, { visible: true })
                TweenLite.to(planken.children[1], 1, { visible: true, delay: 3 })
                TweenLite.to(planken.children[2], 1, { visible: true, delay: 5 })
                TweenLite.to(planken.children[3], 1, { visible: true, delay: 6 })
                TweenLite.to(planken.children[4], 1, { visible: true, delay: 7 })
                TweenLite.to(planken.children[5], 1, { visible: true, delay: 8 })
                TweenLite.to(planken.children[6], 1, { visible: true, delay: 9 })

                effects[3] = false


            if effects[4] == true
                mistHold = 0
                effects[4] = false

            if scene.fog.far <= 10
                $('canvas').fadeOut(1000)

                # fade in credentials.
                $('#credits').fadeIn(1000)
                

        )(sceneObj)
    ))))))))))))))))

