module 'Camera'

Camera.perspectiveCamera = -> 
    ding = new THREE.PerspectiveCamera(90, window.innerWidth / window.innerHeight, 0.000000000001, 10000)
    ding.position.z = 5
    ding

