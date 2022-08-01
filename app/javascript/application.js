import "@hotwired/turbo-rails"
import "controllers"


import "./best_in_place"
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap.min 
//= require jquery-ui
//= require best_in_place
//= require best_in_place.jquery-ui




$(document).ready(function() {
/* Activating Best In Place */
jQuery(".best_in_place").best_in_place();




});
