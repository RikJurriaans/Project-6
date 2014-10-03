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
                    'js/all.min.js': ['js/coffee/Main.coffee'],
                }
            }
        },

        concat: {   
		    dist: {
		        src: [
                    'js/vendor/three.min.js',
                    'js/vendor/underscore-min.js',
                    'js/all.min.js'
                ],
		        dest: 'js/all.min.js',
		    }
		},

		uglify: {
		    build: {
		        src: 'js/all.min.js',
		        dest: 'js/all.min.js'
		    }
		},

		watch: {
		    scripts: {
		        files: ['css/less/*.less', 'js/*/*.coffee', 'js/*/*.js'],
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
    grunt.registerTask('default', ['concat', 'uglify', 'watch']);

};







