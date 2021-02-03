// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@fortawesome/fontawesome-free/js/all";
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../stylesheets/application";
require("bootstrap")
Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.onload = function(){
document.getElementById("file-input").onchange = function() {
    document.getElementById("photo-form").submit();
}};

// window.onload = function() {
  // document.querySelector('[data-bs-toggle="side-menu"]').addEventListener('click', function () {
    // document.querySelector('.side-menu').classList.toggle('open');
  // })
// }
document.addEventListener('turbolinks:load', () =>{
    document.querySelector('[data-bs-toggle="side-menu"]').addEventListener('click', function () {
        document.querySelector('.side-menu').classList.toggle('open')
    })
})
