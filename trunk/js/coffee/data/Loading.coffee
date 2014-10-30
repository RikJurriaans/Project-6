module 'Loader'

Loader.loadJson = (url) -> 
    xmlhttp = new XMLHttpRequest()
    xmlhttp.open("GET", url, false)
    xmlhttp.send()
    JSON.parse xmlhttp.response

