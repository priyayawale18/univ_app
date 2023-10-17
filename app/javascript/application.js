// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require rails-ujs
//= require jquery
//= require materialize
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){
  $('#fade-out-target').fadeout(4000);
})