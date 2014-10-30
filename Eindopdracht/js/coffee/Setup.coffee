module 'Setup'

# Scene :: Scene -> ThreeObject -> undefined
add = (scene) -> (object) -> scene.add(object)

# Init :: camera, renderer, controls -> Function, Float -> Array -> Scene
Setup.init = (camera, renderer, controls = null) -> (renderFunc, frameRate = Render.framerate 30) ->
    scene = new THREE.Scene

    # standard template for controls object
    if controls?
        controls = controls(scene, camera, renderer)

    setInterval(->
        camera.updateProjectionMatrix()

        if controls?
            if controls.controls.freeze is false
                controls.controls.update()
            else controls.orbitControls.update()

        if renderer.effect?
            renderer.effect.render(scene, camera)
        else renderer.render(scene, camera)

        if renderFunc?
            renderFunc(renderer, camera, scene, controls)

    , frameRate)

    # add objects to the scene
    (objects) -> _.map(objects, add(scene))

