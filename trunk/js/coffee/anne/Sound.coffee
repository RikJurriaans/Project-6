module 'Sound'

Sound.pause = (sound) -> sound.pause
Sound.play = (sound) -> sound.play

Sound.happy = -> Dom.selectElement('happy')
Sound.sad = -> Dom.selectElement('sad')
Sound.happySad = -> Dom.selectElement('sad')

