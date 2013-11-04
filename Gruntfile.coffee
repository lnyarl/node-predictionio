module.exports = (grunt)->

  grunt.initConfig
    nodeunit:
      files: ['test/**/*_test.js']

  grunt.registerTask('default', ['coffee', 'nodeunit']);

};
