var looking = {
    nod: function (callback) {
        var lookingUp = false; 
        var timer;

        gyro.frequency = 100;
        gyro.startTracking(function(o) {
            // document.getElementById("log").innerHTML = o.gamma; 
            if(o.gamma < 65 && o.gamma > 0 ) { // We are looking up
                lookingUp = true;
                clearInterval(timer);
                timer = window.setInterval(function () {
                    lookingUp = false; 
                }, 1000);
            }
            if(o.gamma > 80 && lookingUp == true) {
                clearInterval(timer);
                callback();
                gyro.stopTracking();
            }
        });
    }
};
