<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Raleway">
        <title>Weather Comparison</title>
    </head>
    <body>
        <div class="" id="chartContainer" style="width: 100%;">          
        </div>                    
                    <script>
                        function showChart(){
                var chartselected = document.getElementById("chartContainer");
            }
            window.onload = function () {
                var nbdata = JSON.parse(localStorage.getItem('nb'));
                var j48data = JSON.parse(localStorage.getItem('j48'));
                var smodata = JSON.parse(localStorage.getItem('smo'));             
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    theme: "light2",
                    title:{
                            text: "Comparison Chart"
                    },
                    axisX:{
                            title: 'Algorithm',
                            crosshair: {
                                    enabled: true,
                                    snapToDataPoint: true
                            }
                    },
                    axisY: {
                            title: 'Rate',
                            crosshair: {
                                    enabled: true
                            }
                    },
                    toolTip:{
                            shared:true
                    },  
                    legend:{
                            cursor:"pointer",
                            verticalAlign: "bottom",
                            horizontalAlign: "left",
                            dockInsidePlotArea: true,
                            itemclick: toogleDataSeries
                    },
                    data: [{
                            type: "line",
                            showInLegend: true,
                            name: "Precision",
                            markerType: "square",
                            color: "#F08080",
                            dataPoints: [
                               { label:"NaiveBayes", y: nbdata.precision},
                               { label:"J48", y: j48data.precision},
                               { label:"SMO", y: smodata.precision}
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Recall",
                            lineDashType: "dash",
                            dataPoints: [
                               { label:"NaiveBayes", y: nbdata.recall},
                               { label:"J48", y: j48data.recall},
                               { label:"SMO", y: smodata.recall}  
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Mean absolute error",
                            lineDashType: "shortDash",
                            color: "blue",
                            dataPoints: [
                               { label:"NaiveBayes", y: nbdata.mae},
                               { label:"J48", y: j48data.mae},
                               { label:"SMO", y: smodata.mae}  
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Root mean squared error",
                            lineDashType: "dash",
                            dataPoints: [
                               { label:"NaiveBayes", y: nbdata.rmse},
                               { label:"J48", y: j48data.rmse},
                               { label:"SMO", y: smodata.rmse}  
                            ]
                    }
                ]
            });
            chart.render();

            function toogleDataSeries(e){
                    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                            e.dataSeries.visible = false;
                    } else{
                            e.dataSeries.visible = true;
                    }
                    chart.render();
            }
            }
            
                    </script>
    </body>
</html>
