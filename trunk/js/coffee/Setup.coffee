module 'Setup'

# Scene :: Scene -> ThreeObject -> undefined
add = (scene) -> (object) -> scene.add(object)

# Init :: camera, renderer, controls -> Function, Float -> Array -> Scene
Setup.init = (camera, renderer, controls = null) -> (renderFunc, frameRate = Render.framerate 30) ->
    scene = new THREE.Scene
    # scene.autoUpdate = false
    scene.fog = new THREE.Fog(0xffffff, .01, 10000)
    scene.fog.color.setHSL(0.5, 0, 1)

    # standard template for controls object
    if controls?
        controls = controls(scene, camera, renderer)

    renderloop = ->
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

        requestAnimationFrame(renderloop)


    requestAnimationFrame(renderloop)

    # add objects to the scene
    (objects) -> _.map(objects, (obj) -> 
        obj.depthWrite = false
        add(scene)(obj)
    )

