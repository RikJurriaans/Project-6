module 'Sound'

Sound.pause = (sound) -> sound.pause()
Sound.play = (sound) -> sound.play()
Sound.ended = (sound, callback) ->
    sound.addEventListener('ended', callback)

Sound.happy = Dom.selectElement('happy')
Sound.sad = Dom.selectElement('sad')
Sound.happySad = Dom.selectElement('happySad')
