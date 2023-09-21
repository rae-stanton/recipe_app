// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "@popperjs/core"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
    var images = document.querySelectorAll('img');
    images.forEach(function(img) {
        img.onerror = function() {
            img.src = 'https://static.toiimg.com/thumb/78028918.cms?width=680&height=512&imgsize=2041089';
        };
    });
});
