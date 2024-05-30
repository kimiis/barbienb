// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"



document.getElementById('button1').onclick = function() {
  document.getElementById('div1').classList.add('show');
  document.getElementById('div2').classList.remove('show');
  this.classList.add('active');
    document.getElementById('button2').classList.remove('active')
};

document.getElementById('button2').onclick = function() {
  this.classList.add('active');
  document.getElementById('button1').classList.remove('active');
  document.getElementById('div2').classList.add('show');
  document.getElementById('div1').classList.remove('show');
};
