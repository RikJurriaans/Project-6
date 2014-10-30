module 'Light'

# dit kan wat polymorphischer worden.
Light.ambientLight = (color) -> new THREE.AmbientLight(color)
Light.directionalLight = (color) -> new THREE.DirectionalLight(color)
