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
  let options = {
    indexAxis: 'y',
    plugins: {
      legend: {
        display: false
      },
      title: {
        display: true,
        text: 'カロリー収支',
        font: {
          size: 20
        }
      }
    }
  };
  let myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['必要カロリー量', '摂取カロリー量'],
    datasets: [{
      data: JSON.parse(ctx.canvas.dataset.data),
      backgroundColor: ['rgba(100, 100, 100, 1)', 'rgba(255, 100, 100, 1)']
    }]
  },
  options: options,
  },
  
  );
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
