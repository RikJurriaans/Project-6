# Rik Jurriaans 2014.
# google cardboard experiment
#
# In this file we build the world.

# Hier begint de preloader.

buttonText = {
    flag: {
        en: 'Help I\'m English',
        nl: 'Help ik ben Nederlands'
    }
}

introintro = {
    en: '<a href="javascript:;" class="en language">Help! Ik spreek geen Engels</a>
        <h1>Tab on the screen and put your phone</h1>
        <h1>in the Google Cardboard</h1>
        <a href="javascript:;" class="putoncardboard">I\'m ready</a>'

    nl: '<a href="javascript:;" class="en language">Help! I don\'t speak dutch</a>
        <h1>Tap op het scherm en zet de telefoon</h1>
        <h1>in de Google Cardboard</h1>
        <a href="javascript:;" class="putoncardboard">Ik ben er klaar voor</a>'
}

introText = {
    en: '<h1>Anne\'s cardboard world.</h2> <p>Anne Frank was a girl with a lot of dreams. Unfortunately this dreams never came true... Discover how she would have felt when living in the back annex.</p> <a class="start" href="javascript:;">Nod to start</a>',
    nl: '<h1>Anne\'s kartonnen wereld.</h2> <p>Anne was een meisje met heel veel dromen. Helaas heeft zij deze niet waar kunnen maken... Ontdek nu hoe zij zich voelde toen ze in het achterhuis verbleef.</p> <a class="start" href="javascript:;">Knikken om te beginnen</a>'
}

outroText = {
    en: '<h1>The end</h2>
        <p>In worldwar 2 72 million people heve been killed, 6 million of them where Jewish, these people died from hunger, fatique, and much more terrible things. Something like this may never happen again.</p>
        <a class="replay" href="javascript:;">Nod to restart</a>'
    nl: '<h1>Einde</h2>
        <p>In de tweede wereldoorlog zijn 72 miljoen mensen van het leven beroofd, waarvan 6 miljoen van Joodse afkomst.
        Zij stierven in vernietigings kampen aan honger, uitputting, en andere vreselijke dingen.</p>
        <a class="replay" href="javascript:;">Knikken om opnieuw te starten</a>'
}

language = 'NL'


real = [1,2,3,5,7,12,15]
# real = [1,1,1,1,1,1,1]

times = (->
    times = _.map(real, (x) ->
        Utils.toMilliseconds(x) + 2
    )
)()


times = _.map(times, (x) -> x*5)

effects = _.map(times, (x) -> false)

soundsReady = 0


# play start sound.
Sound.initSounds(->
    soundsReady++
    if soundsReady == 5
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
    $('.start').off('click', startExperience)
    $('.divider').fadeOut(500)

    if language == 'NL'
        instance = createjs.Sound.play('intro')
    else
        instance = createjs.Sound.play('introEN')

    instance.addEventListener('complete', ->
        if language == 'NL'
            instance = createjs.Sound.play('room')
        else
            instance = createjs.Sound.play('roomEN')

        $('.split').fadeOut(2500)
        instance = createjs.Sound.play('happy', { loop:-1 })
        instance.volume = 0

        TweenLite.to(instance, 1000, { volume: 100 })

        # Make a list of events.
        events = _.map(times, (time, i) ->
            setInterval(->
                effects[i] = true
                clearInterval(events[i])
            , time)
        )
    )


switchLanguage = -> if language == 'EN' then language = 'NL' else language = 'EN'

changeText = ->
    $('.introscreen').html(introText[language.toLowerCase()])
    $('.credits').html(outroText[language.toLowerCase()])
    $('.introintro').html(introintro[language.toLowerCase()])

addEvents = ->
    $('.start').on('click', startExperience)
    $('.putoncardboard').on('click', startIntroscreen)
    $('.language').on('click', changeLanguage)

changeLanguage = ->
    switchLanguage()
    changeText()
    addEvents()

addEvents()

startIntroscreen = ->
    Cardboard.fullscreen()
    $('.introintro').fadeOut(1000)
    looking.nod(startExperience)

$('.putoncardboard').on('click', startIntroscreen)




standardTexture = ThreeObj.texture(Utils.texture 'flat-texture')
standardTextureList = (children) -> _.map(children, (x) -> x.material = standardTexture)


doRest = ->
    Loader.loadModel(Utils.model('dagboek'), (dagboek) -> Loader.loadModel(Utils.model('lamp'), (lamp) -> Loader.loadModel(Utils.model('paspop'), (paspop) -> Loader.loadModel(Utils.model('stoel'), (stoel) -> Loader.loadModel(Utils.model('planken'), (planken) -> Loader.loadModel(Utils.model('typemachine'), (typemachine) -> Loader.loadModel(Utils.model('huisje'), (huisje) -> Loader.loadModel(Utils.model('bed'), (bed) -> Loader.loadModel(Utils.model('tafel'), (tafel) -> Loader.loadModel(Utils.model('muur-plank'), (muurplank) -> Loader.loadModel(Utils.model('trees2'), (trees2) -> Loader.loadModel(Utils.model('trees'), (trees) -> Loader.loadModel(Utils.model('omgeving'), (obj) -> Room.create((room, objects) -> Loader.loadModel(Utils.model('luie-stoel'), (luieStoel) -> Loader.loadModel(Utils.model('boekenkast'), (boekenkast) -> 

        additional = new THREE.PointLight(0xffffff, 1, 13)
        additional.position.set(0,0,0)

        additional2 = new THREE.PointLight(0xffffff, .2, 0)
        additional2.position.set(1,-1,35)

        luieStoel.scale.set(-5, 5, -5)
        luieStoel.position.set(8, -15, 25)

        luieStoel.material = ThreeObj.texture(Utils.texture 'flat-texture')
        luieStoel.material.transparent = true
        luieStoel.material.alphaTest = 0.1

        luieStoel.rotation.set(0, -5.5, 0)

        boekenkast.scale.set(6, 6, 6)
        boekenkast.position.set(-17, -1, 30)
        standardTextureList(boekenkast.children)

        boeken = _.filter(boekenkast.children, (x) -> x.name.indexOf('boek') > -1)

        # _.map(boeken, (x) -> x.material = ThreeObj.texture(randomTexture()))

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

        dagboek.position.normalize().set(-10, -14, 1)
        dagboek.scale.set(6,6,6)
        standardTextureList(dagboek.children)

        dagboekLight = new THREE.PointLight(0xffffff, 0, 13)
        dagboekLight.position.normalize().set(-10, -10, 1)

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
        room.children[0].material = ThreeObj.texture(Utils.texture 'flat-texture')
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

        lamp.scale.set(-6,6,-6)
        lamp.rotation.set(0,-1,0)
        lamp.position.set(30,-1,0)
        standardTextureList(lamp.children)

        

        # alle objecten verplaatsen
        sceneObj = [dagboekLight, dagboek, additional, additional2, lamp, paspop, planken, typemachine, huisje, trees2, boekenkast, luieStoel, muurplank, bed, tafel, trees, objects[0], objects[1], stoel, wolk2, wolk3, light, wolk1, sun[0], room, ground]

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
                TweenLite.to(sun[0], 15, { intensity: 0 })
                TweenLite.to(additional, 12, { intensity: 0 })

                TweenLite.to(bed.children[0].position, 1, { y: -1, delay: .5, onComplete: -> bed.children[0].visible = false })
                TweenLite.to(bed.children[1].position, 1, { y: -1, delay: .3, onComplete: -> bed.children[1].visible = false })
                TweenLite.to(bed.children[2].position, 1, { y: -1, delay: .5, onComplete: -> bed.children[2].visible = false })
                TweenLite.to(bed.children[3].position, 1, { y: -1, delay: .6, onComplete: -> bed.children[3].visible = false })
                TweenLite.to(bed.children[4].position, 1, { y: -1, delay: .4, onComplete: -> bed.children[4].visible = false })
                TweenLite.to(bed.children[5].position, 1, { y: 0, delay: .4 })
                TweenLite.to(bed.children[6].position, 1, { y: -1, delay: .4, onComplete: -> bed.children[6].visible = false })
                TweenLite.to(bed.children[7].position, 1, { y: -1, delay: .4 })
                TweenLite.to(bed.children[8].position, 1, { y: -2, delay: .4 })

                # Roof top-part
                room.children[3].visible = true

                effects[2] = false


            if effects[3] == true
                TweenLite.to(stoel.position, .4, { y: -35, delay: .4, onComplete: -> stoel.visible = false })

                TweenLite.to(typemachine.position, 5, { y : -35 })
                TweenLite.to(tafel.position, 5, { y : -35, delay: 4 })

                TweenLite.to(dagboekLight, 7, { intensity: 1 })
                
                effects[3] = false


            if effects[4] == true
                TweenLite.to(additional2, 25, { intensity: 0 })

                createjs.Sound.play('hammering')

                TweenLite.to(light, 25, { intensity: 0 })
                TweenLite.to(planken.children[0], 1, { visible: true })
                TweenLite.to(planken.children[1], 1, { visible: true, delay: 3 })
                TweenLite.to(planken.children[2], 1, { visible: true, delay: 5 })
                TweenLite.to(planken.children[3], 1, { visible: true, delay: 6 })
                TweenLite.to(planken.children[4], 1, { visible: true, delay: 7 })
                TweenLite.to(planken.children[5], 1, { visible: true, delay: 8 })
                TweenLite.to(planken.children[6], 1, { visible: true, delay: 9 })

                TweenLite.to(dagboekLight, 5, { intensity: 0, delay: 5 })
                effects[4] = false


            if effects[5] == true
                _.map(boeken, (x) ->
                    delay = Math.random() + 1
                    TweenLite.to(x.position, 1, { x: "+=1", delay: delay })
                    delay = delay + (Math.random() + 1)
                    TweenLite.to(x.position, .5, { y: -10, delay: delay })
                )

                
                effects[5] = false


            if effects[6] == true
                effects[effects.length-1] = false

                createjs.Sound.stop('sad')

                if language == 'NL'
                    instance = createjs.Sound.play('outro')
                else
                    instance = createjs.Sound.play('outroEN')

                # fade in credentials.
                $('.credits').css({ opacity: 1 })
                $('.introscreen').css({ opacity: 0 })
                $('.split').fadeIn(1000)
                
                $('.start').on('click', -> window.location.reload())
                looking.nod(-> window.location.reload())


        )(sceneObj)
    )))))))))))))))))

