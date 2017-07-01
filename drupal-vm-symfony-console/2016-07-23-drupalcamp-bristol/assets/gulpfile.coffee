gulp = require 'gulp'
plugins = require('gulp-load-plugins')()
del = require 'del'

config =
  sass:
    sourceDir: 'sass'
    pattern: '/**/*.sass'
    outputDir: 'css'

gulp.task 'styles', ->
  gulp.src config.sass.sourceDir + config.sass.pattern
    .pipe plugins.plumber()
    .pipe plugins.sass()
    .pipe plugins.refresh()
    .pipe gulp.dest config.sass.outputDir

gulp.task 'watch', ->
  plugins.refresh.listen()

  gulp.watch config.sass.sourceDir + config.sass.pattern, ['styles']

gulp.task 'clean', ->
  del.sync config.sass.outputDir

gulp.task 'build', ['clean', 'styles']

gulp.task 'default', ['build', 'watch']
