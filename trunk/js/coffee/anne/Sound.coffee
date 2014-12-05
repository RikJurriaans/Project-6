module 'Sound'

# Sound.pause = (sound) -> sound.pause()
# Sound.play = (sound) -> sound.play()
# Sound.ended = (sound, callback) ->
#     sound.addEventListener('ended', callback, false)

# loopSound = (sound) -> sound

# Sound.happy = loopSound(Dom.selectElement('happy'))
# Sound.sad = Dom.selectElement('sad')
# Sound.happySad = Dom.selectElement('happySad')
# Sound.lamp = Dom.selectElement('lamp')


Sound.initSounds = (rdy) ->
    createjs.Sound.alternateExtensions = ["mp3"]

    manifest = [
        { id: 'happy', src: 'sounds/background_sound/happy.ogg' },
        { id: 'happySad', src: 'sounds/background_sound/happy-sad.ogg' },
        { id: 'sad', src: 'sounds/background_sound/sad.ogg' }
        { id: 'lamp', src: 'sounds/soundeffects/lamp.ogg' }
    ]

    createjs.Sound.registerManifest(manifest, '')

    createjs.Sound.addEventListener('fileload', rdy)


    

