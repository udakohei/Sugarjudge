// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap"
import "../stylesheets/application"

import Chart from 'chart.js/auto';

document.addEventListener('turbolinks:load', () => {
  let ctx = document.getElementById('myChart').getContext('2d');
  let myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: JSON.parse(ctx.canvas.dataset.labels),
    datasets: [{
      data: JSON.parse(ctx.canvas.dataset.data),
    }]
  },
  });
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
