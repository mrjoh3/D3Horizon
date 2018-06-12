HTMLWidgets.widget({

  name: 'D3Horizon',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerText = x.message;
        
        var data = x.data;
        if (data.length == null) {
          data = [data];
        }
        
        console.log(data);
          
        var horizons = d3.select('#' + el.id).selectAll('.horizon')
            .data(data)
            .enter()
            .append('div')
            .attr('class', 'horizon')
            .each(function(d) {
                d3.horizonChart()
                    .height(x.horizon_height)
                    //.axis(x.axis)
                    .title(d.name)
                    .colors(['#313695', '#4575b4', '#74add1', '#abd9e9', '#fee090', '#fdae61', '#f46d43', '#d73027'])
                    .call(this, d.values);
            });

        if (x.axis !== null) {
          
            console.log(x.axis);

            //var padding = x.padding;
            var hz = data.length;
            
            var mindate = new Date(x.axis.min),
                maxdate = new Date(x.axis.max);
            
            var xaxis = d3.scaleTime()
                .range([0, 800])
                .domain([mindate, maxdate]);
            
            var bx = d3.select('#' + el.id).append("rect")    
                .attr("width", 800)
                .attr("height", x.horizon_height * hz);

             bx.append("g")
                .attr("transform", "translate(0," + x.horizon_height * hz + ")")
                .call(d3.axisBottom(xaxis)
                      //.ticks(d3.timeDay.every(180)));
                      .ticks(3));
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});