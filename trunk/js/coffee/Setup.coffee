module 'Setup'

# Scene :: Scene -> ThreeObject -> undefined
add = (scene) -> (object) -> scene.add(object)

# Init :: camera, renderer, controls -> Function -> Array -> Scene
Setup.init = (camera, renderer, controls = null) -> (renderFunc) ->
    scene = new THREE.Scene
    scene.fog = new THREE.Fog(0xeeeeee, 0.1, 300)

    console.log camera

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
            renderFunc(scene, renderer, camera, controls)

        requestAnimationFrame(renderloop)


    requestAnimationFrame(renderloop)

    # add objects to the scene
    (objects) -> _.map(objects, (obj) ->
        add(scene)(obj)
    )

