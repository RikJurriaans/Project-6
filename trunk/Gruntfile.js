module.exports = function(grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        less: {
            development: {
                options: {
                    paths: ['css/less'],
                    compress: true,
                    yuicompress: true,
                    optimisation: 2
                },
                files: {
                    'css/default.css' : 'css/less/default.less'
                }
            }
        },

        coffee: {
            compile: {
                files: {
                    'js/all.min.js': [
                                      'js/coffee/utils/Prelude.coffee', 
                                      'js/coffee/utils/Utils.coffee', 
                                      'js/coffee/utils/Dom.coffee', 
                                      'js/coffee/anne/Outside.coffee', 
                                      'js/coffee/anne/Sound.coffee', 
                                      'js/coffee/anne/Introscreen.coffee', 
                                      'js/coffee/interaction/Cardboard.coffee', 
                                      'js/coffee/interaction/Mouse.coffee', 
                                      'js/coffee/data/Loading.coffee', 
                                      'js/coffee/render/Shader.coffee', 
                                      'js/coffee/anne/Room.coffee', 
                                      'js/coffee/render/Render.coffee', 
                                      'js/coffee/geom/ThreeObj.coffee', 
                                      'js/coffee/camera/Camera.coffee', 
                                      'js/coffee/light/Light.coffee', 
                                      'js/coffee/interaction/Animation.coffee', 
                                      'js/coffee/Settings.coffee', 
                                      'js/coffee/Setup.coffee', 
                                      'js/coffee/Main.coffee']
                }
            }
        },

        concat: {   
		    dist: {
		        src: [
                    'js/vendor/jquery-2.1.1.min.js',
                    'js/vendor/three.min.js',
                    'js/vendor/TweenLite.min.js',
                    'js/vendor/Cardboard.js',
                    'js/vendor/underscore-min.js',
                    'js/vendor/StereoEffect.js',
                    'js/vendor/DeviceOrientationControls.js',
                    'js/vendor/OrbitControls.js',
                    'js/vendor/jph.js',
                    'js/vendor/soundjs-0.5.2.min.js',
                    'js/all.min.js'
                ],
		        dest: 'js/all.min.js',
		    }
		},

		watch: {
		    scripts: {
		        files: ['css/less/*.less', 'js/*/*.coffee', 'js/coffee/*.coffee', 'js/coffee/*/*.coffee', 'js/*/*.js'],
		        tasks: ['less', 'coffee', 'concat'],
		        options: {
		            spawn: false,
		        },
		    } 
		}


    });

    // 3. Where we tell Grunt we plan to use this plug-in.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // 4. Where we tell Grunt what to do when we type "grunt" into the terminal.
    grunt.registerTask('default', ['concat', 'watch']);

};







