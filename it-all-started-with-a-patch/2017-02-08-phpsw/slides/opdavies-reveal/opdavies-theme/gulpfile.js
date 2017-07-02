'use strict'

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();
var del = require('del');

var config = {
  sass: {
    source: "sass",
    pattern: "/**/*.sass",
    destination: "css"
  }
};

var app = {};

app.sass = function (paths, filename) {
  return gulp.src(paths)
    .pipe(plugins.plumber())
    .pipe(plugins.sourcemaps.init())
    .pipe(plugins.sass({
      outputStyle: 'compressed'
    }))
    .pipe(plugins.concat(filename))
    .pipe(plugins.sourcemaps.write('.'))
    .pipe(gulp.dest(config.sass.destination));
};

gulp.task('styles', function () {
  return app.sass([
  	config.sass.source + config.sass.pattern,
  	'vendor/css/tomorrow-night-bright.css',
  ], 'style.css');
});

gulp.task('clean', function () {
  del.sync(config.sass.destination);
});

gulp.task('build', ['clean', 'styles']);

gulp.task('default', ['build']);

gulp.task('watch', ['build'], function () {
  gulp.watch(config.sass.source + config.sass.pattern, ['styles']);
});
