/**
 * 
 */
      
    function drawChart () {
    var data = google.visualization.arrayToDataTable([
        ['State', '','population'],
        ['MA-11', 200,34],
        ['MA-14', 0,34],
        ['MA-15', 0,43],
        ['MA-12', 0,34],
        ['MA-10', 0,0],
        ['MA-13', 0,0],
        ['MA-04', 0,0],
        ['MA-01', 0,0],
        ['MA-02', 0,0],
        ['MA-03', 0,0],
        ['MA-05', 0,0],
        ['MA-06', 0,0],
        ['MA-07', 0,0],
        ['MA-08', 0,0],
        ['MA-09', 0,0],



        
    ]);

    

    var geochart = new google.visualization.GeoChart(document.getElementById('chart_div1'));
    var options = {
        region:'MA',
        legend:"none",
        width: 556,
        height: 347,
        resolution: 'provinces',
        colorAxis: {
            minValue: 0,
            maxValue: 15,
            colors: ['gray', 'gray']
        }
    };
    

    var stateSelector = document.querySelector('#state');    
    function updateChart () {
        var index = this.selectedIndex;
        document.querySelector('.results').innerHTML = index;

        var selectedState = this.options[index].value;

        var view = new google.visualization.DataView(data);
        view.setColumns([0, {
            type: 'number',
            calc: function (dt, row) {
                return (dt.getValue(row, 0) == selectedState) ? 1 : 0;
            }
        }]);

        geochart.draw(view, options);
    }

    if (document.addEventListener) {
        stateSelector.addEventListener('change', updateChart, false);
    }
    else if (document.attachEvent) {
        stateSelector.attachEvent('onchange', updateChart);
    }
    else {
        stateSelector.onchange = updateChart;

    }

function selectHandler() {
          var selectedItem = geochart.getSelection()[0];
          if (selectedItem) {
            var topping = data.getValue(selectedItem.row, 0);
          }
     var jsonfile ={json:JSON.stringify(topping)};
	 

     $.ajax({
    	
    	 type:'GET',
    	 url:"/MedecinPatients/jsonStat",
    	 data:jsonfile,
    	 dataType:"json",
    	 success: function(response) {
	    	
    	 }
    	 
     });
	 window.location.assign("http://localhost:8080/MedecinPatients/NewFile1")


        }

        google.visualization.events.addListener(geochart, 'select', selectHandler);    
        geochart.draw(data, options);
      }
function drawChart1 () {
    var data = google.visualization.arrayToDataTable([
        ['State', ''],
        ['MR-15', 0],
        ['MR-14', 0],
        

        
    ]);
     
        


   
    var geochart = new google.visualization.GeoChart(document.getElementById('chart_div2'));
    var options = {
        region:'MR',
        legend:"none",
        width: 556,
        height: 347,
        resolution: 'provinces',
        colorAxis: {
            minValue: 0,
            maxValue: 15,
            colors: ['gray', 'gray']
        }
    };

    var stateSelector = document.querySelector('#state');    
    function updateChart () {
        var index = this.selectedIndex;
        document.querySelector('.results').innerHTML = index;

        var selectedState = this.options[index].value;

        var view = new google.visualization.DataView(data);
        view.setColumns([0, {
            type: 'number',
            calc: function (dt, row) {
                return (dt.getValue(row, 0) == selectedState) ? 1 : 0;
            }
        }]);

        geochart.draw(view, options);
    }

    if (document.addEventListener) {
        stateSelector.addEventListener('change', updateChart, false);
    }
    else if (document.attachEvent) {
        stateSelector.attachEvent('onchange', updateChart);
    }
    else {
        stateSelector.onchange = updateChart;
    }

    geochart.draw(data, options);
}

google.load('visualization', '1', {packages:['geochart'], callback: drawChart});
google.load('visualization', '1', {packages:['geochart'], callback: drawChart1});

