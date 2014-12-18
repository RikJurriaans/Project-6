module 'Sound'

Sound.initSounds = (rdy) ->
    createjs.Sound.alternateExtensions = ["mp3"]

    manifest = [
        { id: 'happy', src: 'sounds/background_sound/happy.ogg' }
        { id: 'happySad', src: 'sounds/background_sound/happy-sad.ogg' }
        { id: 'sad', src: 'sounds/background_sound/sad.ogg' }
        { id: 'lamp', src: 'sounds/soundeffects/lamp.ogg' }
        { id: 'hammering', src: 'sounds/soundeffects/hammering.ogg' }
        { id: 'intro', src: 'sounds/voiceover/intro.ogg' }
        { id: 'outro', src: 'sounds/voiceover/outro.ogg' }
        { id: 'room', src: 'sounds/voiceover/room.ogg' }

        { id: 'introEN', src: 'sounds/voiceover/introEN.ogg' }
        { id: 'outroEN', src: 'sounds/voiceover/outroEN.ogg' }
        { id: 'roomEN', src: 'sounds/voiceover/roomEN.ogg' }
    ]

    createjs.Sound.registerManifest(manifest, '')

    createjs.Sound.addEventListener('fileload', rdy)

