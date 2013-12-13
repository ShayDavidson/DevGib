module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')
    sass:
      dist:
        files: [
          expand: true
          cwd: 'src/scss'
          src: ['*.scss']
          dest: 'build/css'
          ext: '.css'
        ]
    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'src/coffee'
        src: '**/*.coffee'
        dest: 'build/js'
        ext: '.js'
    watch:
      sass:
        files: 'src/scss/**/*.scss'
        tasks: ['sass']
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee']
  )

  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('compile', ['sass', 'coffee'])
  grunt.registerTask('default', ['compile'])