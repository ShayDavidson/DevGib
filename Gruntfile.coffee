module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')
    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'src/coffee'
        src: '**/*.coffee'
        dest: 'build/js'
        ext: '.js'
    watch:
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee']
  )

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('compile', ['coffee'])
  grunt.registerTask('default', ['compile'])