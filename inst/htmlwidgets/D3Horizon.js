HTMLWidgets.widget({

  name: 'D3Horizon',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerText = x.message;
        
        //var data = HTMLWidgets.dataframeToD3(x.data);
        var series = x.data;
        
        var horizonChart = d3.horizonChart()
          .height(x.horizon_height)
          .title(x.title)
          .colors(['#313695', '#4575b4', '#74add1', '#abd9e9', '#fee090', '#fdae61', '#f46d43', '#d73027']);
          
        var horizons = d3.select('#' + el.id).selectAll('.horizon')
          .data([series])
          .enter().append('div')
          .attr('class', 'horizon')
          .each(horizonChart);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});