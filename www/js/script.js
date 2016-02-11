var table = [],
    height = [];
    
var parent = "#plot";

var parentDiv = d3.select(parent);
  
var parentWidth = g3.elementWidth(parentDiv),
    parentHeight = g3.elementHeight(parentDiv);

var margin = {
  top: parentHeight * 0.05, right: parentWidth * 0.2,
  bottom: parentHeight * 0.05, left: parentWidth * 0.2
};

var width = g3.chartLength(parentWidth, margin.left, margin.right),
    height = g3.chartLength(parentHeight, margin.top, margin.bottom);

var x = g3.scale({type: "linear", min: 0, max: width, space: 0}),
    x_normal = g3.scale({type: "linear", min: 0, max: width, space: 0});
var y = g3.scale({type: "linear", min: height, max: 0}),
    y_normal = g3.scale({type: "linear", min: height, max: 0});

d3.csv("data/data.csv", function(data) {
  
  table = data.map(objConvert);
  
  draw_plot(table, parent);
  
  $("#button").on("click", function() {
    console.log("clicked");
  });
  
  $("#tri").click({distribution: "tri"}, dist);
  $("#Normal").click({distribution: "normal"}, dist);
  $("#logis").click({distribution: "logis"}, dist);
  $("#Exponential").click({distribution: "exp"}, dist);
  $("#lognormal").click({distribution: "lognormal"}, dist);
  $("#Gamma").click({distribution: "gamma"}, dist);
  
});

draw_plot = function(data, parent, marginRatio) {

  // Add chart svg to parentDiv
  chart = g3.appendChart(parentDiv, parentWidth, parentHeight, margin);
  
  layers = function(chart, margin) {
      
    x_normal.domain(d3.extent(data, function(d) { return d.x_normal; }));
    y_normal.domain(d3.extent(data, function(d) { return d.y_normal; }));

    var pointOpacity = 0.4;
    
    var points = chart.selectAll(".point")
      .data(table)
      .enter().append("circle")
      .attr("class", function(d) { return "point"; })
      .attr("cx", function(d) { return x_normal(d.x_normal); })
      .attr("cy", function(d) { return y_normal(d.y_normal); })
      .attr("r", 3)
      .style("fill", "#222" )
      .style("fill-opacity", pointOpacity)
      .transition()
      .delay( function(d, i) {
        return 500 + 50 * i;
      })
      .duration(2000)
      .attr("cy", function(d) { return y_normal(d.y_d_normal); });
    
  };
  
  layers(chart, margin);
  
};

normal_dist = function() {
  
  var parentDiv = d3.select("#plot");
  
  var parentHeight = g3.elementHeight(parentDiv);
  
  var margin = {
    top: 0, right: 0,
    bottom: 0, left: 0
  };
  
  x_normal.domain(d3.extent(table, function(d) { return d.x_normal; }));
  y_normal.domain(d3.extent(table, function(d) { return d.y_normal; }));

  var points = d3.selectAll(".point");
  
  points.transition().duration(2000)
    .attr("cx", function(d) { return x_normal(d.x_normal); })
    .attr("cy", function(d) { return y_normal(d.y_normal); })
    .transition()
    .delay( function(d, i) {
      return 20 * i;
    })
    .duration(2000)
    .attr("cx", function(d) { return x_normal(d.x_normal); })
    .attr("cy", function(d) { return y_normal(d.y_d_normal); });
  
}

dist = function(event) {
  
  var x_var = "x_" + event.data.distribution,
      y_var = "y_" + event.data.distribution,
      y_d_var = "y_d_" + event.data.distribution;
  /*
  var x_var = event.data.x_var,
      y_var = event.data.y_var,
      y_d_var = event.data.y_d_var;
  */
  var parentDiv = d3.select("#plot");
  
  var parentHeight = g3.elementHeight(parentDiv);
  
  var margin = {
    top: 0, right: 0,
    bottom: 0, left: 0
  };
  
  x.domain(d3.extent(table, function(d) { return d[x_var]; }));
  y.domain(d3.extent(table, function(d) { return d[y_var]; }));
  
  var points = d3.selectAll(".point");
  
  points.transition().duration(2000)
    .attr("cx", function(d) { return x(d[x_var]); })
    .attr("cy", function(d) { return y(d[y_var]); })
    .transition()
    .delay( function(d, i) {
      return 2000 + 20 * i;
    })
    .duration(2000)
    .attr("cy", function(d) { return y(d[y_d_var]); });
  
};

objConvert = function(d) {

  var k = Object.keys(d);
  
  var o = {};
  
  for (i = 0; i < k.length; i++) {
    currentKey = k[i];
    o[currentKey] = +d[currentKey];
  }
  
  return(o);
  
};

$(document).ready(function(){
    $('.container-menu li').click(function() {
        $(this).siblings('li').removeClass('active');
        $(this).addClass('active');
    });
});