module 'Utils'

# image :: String -> String
Utils.image = (name) -> 'img/' + name + '.jpg'

# texture :: String -> String
Utils.texture = (name) -> 'img/textures/' + name + '.jpg'

Utils.model = (name) -> 'models/' + name + '.json'
