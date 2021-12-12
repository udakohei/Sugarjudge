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
        text: '糖質収支',
        font: {
          size: 20
        }
      }
    }
  };
  let myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['上限糖質量', '摂取糖質量'],
    datasets: [{
      data: JSON.parse(ctx.canvas.dataset.data),
      backgroundColor: ['rgba(100, 100, 100, 1)', 'rgba(255, 100, 100, 1)']
    }]
  },
  options: options,
  },
  
  );
})