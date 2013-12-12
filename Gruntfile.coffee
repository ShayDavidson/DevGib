module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')
    manifest: grunt.file.readJSON('manifest.json')
    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'src/coffee'
        src: '**/*.coffee'
        dest: 'build/js'
        ext: '.js'
    watch:
      coffee:
        files: 'src/coffee/**/*.coffee'
        tasks: ['coffee']
  )

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-chrome-compile')

  grunt.registerTask('compile', ['coffee'])
  grunt.registerTask('default', 'compile')