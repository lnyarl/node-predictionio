module.exports = (grunt)->

  grunt.initConfig
    coffee:
      tasks:
        expand: true
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: 'out/'
        ext: '.js'

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']
