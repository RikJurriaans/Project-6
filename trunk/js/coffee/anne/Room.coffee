module 'Room'

Room.create = (fun) ->
    # the light for the chimney
    pointLight = new THREE.PointLight(0xffffff, 2, 100)
    pointLight.position.set(0,100,0)

    # light from the lamb
    lambLight = new THREE.PointLight(0xffffff, 2, 20)
    lambLight.position.set(25,20,-5)

    Loader.loadModel(Utils.model('room'), (obj) ->
        Loader.loadModel(Utils.model('stoel'), (stoel) ->
            fun(obj, [pointLight, lambLight, stoel])
        )
    )

