import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


$(document).ready(function() {
  $('#select-all').click(function() {
    var checked = this.checked;
    $('input[type="checkbox"]').each(function() {
      this.checked = checked;
    });
  })
});
