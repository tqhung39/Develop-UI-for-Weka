
<%@page import="java.util.Hashtable"%>
<%-- 
    Document   : classify
    Created on : Dec 15, 2019, 1:48:04 PM
    Author     : Admin
--%>
<%@page import="weka.core.Instances"%>
<%@page import="java.util.Random"%>
<%@page import="weka.core.converters.ConverterUtils.DataSource"%>
<%@page import="weka.classifiers.trees.J48"%>
<%@page import="weka.classifiers.Evaluation"%>
<%@page import="weka.classifiers.bayes.NaiveBayes"%>
<%@page import="weka.classifiers.functions.SMO"%>
<%@page import="weka.filters.Filter"%>
<%@page import="weka.classifiers.Classifier"%>
<%@page import="java.io.File"%>
<%@page import="weka.core.converters.ArffLoader"%>
<%@page import="weka.filters.unsupervised.attribute.StringToWordVector"%>
<%@page import="weka.core.Instances"%>
<%@page import="weka.classifiers.functions.SMO"%>
<%@page import="com.thesis.*"%>
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
        <style>
            body {
                font-family: "Raleway", "sans-serif";
            }
            table, th, td {
            padding: 10px;
            border: 1px solid black; 
            border-collapse: collapse;
            text-align: center;
            }
            .btn.btn-primary {
                margin-top: 20px !important;
            }
            .title {
                background-color: #FFF8DC;
            }
            .col-md-4 {
                background-color: #DCDCDC;
                margin-left: 20px;
                width: 30%;
                min-height: 500px;
                border-radius: 12px;
            }
            .btn {
                font-size: 20px;
                width: 50%;
                margin-left: 40px;
            }
            li {
                font-size: 20px;
                margin-bottom: 10px;
            }
            .navbar-brand {
                font-weight: 800;
                font-size: 30px;
            }
        </style>
        <title>Classify</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <a class="navbar-brand pl-5 text-light">Navbar</a>
</nav>
            <div class="container">
                <div id="classify">
                    </br>
                    <div class="row">
                    <div class="col-md-4 pt-3 bg-light">                       
                        <h4 class="pl-4">Choose:
                            <select id="classifierselect" class="ml-2">
                                <option value="nb">NaiveBayes</option>
                                <option value="j48">J48</option>
                                <option value="smo">SMO</option>
                            </select>
                        </h4>
                        </br>
                        <button class="btn btn-primary" type="button" onclick="getSelected()">Start</button>
                        </br>
                        <button class="btn btn-primary" id="stop-btn" type="button" onclick="">Stop</button>                         
                        </br>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" type="button" onclick="showChart()">Compare</button> 
                        </div>                   
                    <div class="col-md-7 ml-5 bg-light" id="glassnb" style="display:none">
                        <h1 class="text-primary" align="center">Classifier output: </h1>
                        <h5><%
                            Hashtable<String, Double> nb = new Hashtable<String, Double>();
                            Hashtable<String, Double> j48 = new Hashtable<String, Double>();
                            Hashtable<String, Double> smo = new Hashtable<String, Double>();
                            String FILE_PATH = "H:/Develop-UI-for-Weka/target/ThesisMaven-1.0-SNAPSHOT/upload/glass.arff";

                            String TRAINING_DATA_SET_FILENAME = FILE_PATH;
                            String TESTING_DATA_SET_FILENAME = "";
                            String PREDICTION_DATA_SET_FILENAME = "";

                            Instances testingDataSet;
                            Instances predictingDataSet;

                            Instances trainingDataSet = null;

                            StringToWordVector filter = new StringToWordVector();
                            ArffLoader loader = new ArffLoader();
                            loader.setSource(new File(TRAINING_DATA_SET_FILENAME));
                            Instances dataSet = loader.getDataSet();
                            int classIdx = dataSet.numAttributes() - 1;
                            dataSet.setClassIndex(classIdx);
                            filter.setInputFormat(dataSet);
                            trainingDataSet = Filter.useFilter(dataSet, filter);
                            if (!TESTING_DATA_SET_FILENAME.equals("")) {
                                filter = new StringToWordVector();
                                loader = new ArffLoader();
                                loader.setSource(new File(TESTING_DATA_SET_FILENAME));
                                dataSet = loader.getDataSet();
                                classIdx = dataSet.numAttributes() - 1;
                                dataSet.setClassIndex(classIdx);
                                filter.setInputFormat(dataSet);
                                testingDataSet = Filter.useFilter(dataSet, filter);
                            } else {
                                testingDataSet = null;
                            }
                            Classifier classifier = new NaiveBayes();
                            classifier.buildClassifier(trainingDataSet);
                            Evaluation eval = new Evaluation(trainingDataSet);
                            if (testingDataSet != null) {
                                eval.evaluateModel(classifier, testingDataSet);
                                nb.put("precision", eval.precision(0));                                
                                nb.put("recall", eval.recall(0));
                                nb.put("mae", eval.meanAbsoluteError());
                                nb.put("rmse", eval.rootMeanSquaredError());
                                System.out.println("cccccccccccccccccccccccccccccccccccc");
                                System.out.println(nb);
                            } else {
                                eval.crossValidateModel(classifier, trainingDataSet, 10, new Random(1));
                            }
                            System.out.println("* Naive Bayes Evaluation with Datasets *");
                            System.out.println(eval.toSummaryString());
                            System.out.print(" the expression for the input data as per alogorithm is ");
                            System.out.println(classifier);


                            %></h5>
                            <ul>        
                        <li>Correctly Classified Instances
                            <%=eval.correct()%>
                            <%
                                nb.put("precision", eval.precision(0));                                
                                nb.put("recall", eval.recall(0));
                                nb.put("mae", eval.meanAbsoluteError());
                                nb.put("rmse", eval.rootMeanSquaredError());
                                System.out.println(nb);
                                    %>
                            <%=eval.pctCorrect()%>%
                        </li>
                        <li>InCorrectly Classified Instances
                            <%=eval.incorrect()%>
                            <%=eval.pctIncorrect()%>%
                        </li>
                        <li>Kappa statistic
                            <%=eval.kappa()%>
                        </li>
                        <li>Mean absolute error
                            <%=eval.meanAbsoluteError()%>
                        </li>
                        <li>Root mean squared error
                            <%=eval.rootMeanSquaredError()%>
                        </li>
                        <li>Relative absolute error
                            <%=eval.relativeAbsoluteError()%>%
                        </li>
                        <li>Root relative absolute error
                            <%=eval.rootRelativeSquaredError()%>%
                        </li>
                        <li>Precision
                            <%=eval.precision(0)%>
                        </li>
                        <li>Recall
                            <%=eval.recall(0)%>
                        </li>
                            </ul>
                    </div>
                    <div class="col-md-4" id="glassj48" style="display:none">
                        <h1 style="color:red"align="center">Classifier output: </h1>
                        <h5>
                            <%
                                DataSource source = new DataSource("H:/Develop-UI-for-Weka/target/ThesisMaven-1.0-SNAPSHOT/upload/glass.arff");
                                Instances dataset = source.getDataSet();	
                                //set class index to the last attribute
                                dataset.setClassIndex(dataset.numAttributes()-1);
                                //create and build the classifier!
                                J48 tree = new J48();
                                tree.buildClassifier(dataset);

                                Evaluation eval1 = new Evaluation(dataset);
                                Random rand = new Random(1);
                                int folds = 10;

                                //Notice we build the classifier with the training dataset
                        //we initialize evaluation with the training dataset and then
                        //evaluate using the test dataset

                                //test dataset for evaluation
                                DataSource source1 = new DataSource("H:/Develop-UI-for-Weka/target/ThesisMaven-1.0-SNAPSHOT/upload/glass.arff");
                                Instances testDataset = source1.getDataSet();
                                //set class index to the last attribute
                                testDataset.setClassIndex(testDataset.numAttributes()-1);
                                //now evaluate model
                                //eval.evaluateModel(tree, testDataset);
                                eval1.crossValidateModel(tree, testDataset, folds, rand);
                                System.out.println(eval1.toSummaryString("Evaluation results:\n", false));

                                System.out.println("Correct % = "+eval1.pctCorrect());
                                System.out.println("Incorrect % = "+eval1.pctIncorrect());
                                System.out.println("AUC = "+eval1.areaUnderROC(1));
                                System.out.println("kappa = "+eval1.kappa());
                                System.out.println("MAE = "+eval1.meanAbsoluteError());
                                System.out.println("RMSE = "+eval1.rootMeanSquaredError());
                                System.out.println("RAE = "+eval1.relativeAbsoluteError());
                                System.out.println("RRSE = "+eval1.rootRelativeSquaredError());
                                System.out.println("Precision = "+eval1.precision(1));
                                System.out.println("Recall = "+eval1.recall(1));
                                System.out.println("fMeasure = "+eval1.fMeasure(1));
                                System.out.println("Error Rate = "+eval1.errorRate());
                            //the confusion matrix
                                System.out.println(eval.toMatrixString("=== Overall Confusion Matrix ===\n"));
                            %>
                        </h5>
                        <h2 align="left">Correctly Classified Instances
                            <%=eval1.correct()%>
                            <%=eval1.pctCorrect()%>%
                        </h2>
                        <h2 align="left">InCorrectly Classified Instances
                            <%=eval1.incorrect()%>
                            <%=eval1.pctIncorrect()%>%
                        </h2>
                        <h2 align="left">Kappa statistic
                            <%=eval1.kappa()%>
                        </h2>
                        <h2 align="left">Mean absolute error
                            <%=eval1.meanAbsoluteError()%>
                        </h2>
                        <h2 align="left">Root mean squared error
                            <%=eval1.rootMeanSquaredError()%>
                        </h2>
                        <h2 align="left">Relative absolute error
                            <%=eval1.relativeAbsoluteError()%>%
                        </h2>
                        <h2 align="left">Root relative absolute error
                            <%=eval1.rootRelativeSquaredError()%>%
                        </h2>
                        <h2 align="left">Precision
                            <%=eval1.precision(0)%>
                        </h2>
                        <h2 align="left">Recall
                            <%=eval1.recall(0)%>
                        </h2>
                    </div>
                    <div class="col-md-4" id="glasssmo" style="display:none">
                        <h1 style="color:red"align="center">Classifier output: </h1>
                        <h1>
                            <%
                                SMO svm = new SMO();
                                svm.buildClassifier(trainingDataSet);
                                Evaluation eval2 = new Evaluation(trainingDataSet);
                                if (testingDataSet != null) {
                                    eval2.evaluateModel(svm, testingDataSet);
                                } else {
                                    eval2.crossValidateModel(svm, trainingDataSet, 10, new Random(1));
                                }
                                System.out.println(eval2.toSummaryString());
                                System.out.print(" the expression for the input data as per alogorithm is ");
                                System.out.println(svm);
                                System.out.println("Precision = "+eval2.precision(0));
                                System.out.println("Recall = "+eval2.recall(0));
		
                            %>
                        </h1>                        
                        <h2 align="left">Correctly Classified Instances
                            <%=eval2.correct()%>
                            <%=eval2.pctCorrect()%>%
                        </h2>
                        <h2 align="left">InCorrectly Classified Instances
                            <%=eval2.incorrect()%>
                            <%=eval2.pctIncorrect()%>%
                            
                        </h2>
                        <h2 align="left">Kappa statistic
                            <%=eval2.kappa()%>
                        </h2>
                        <h2 align="left">Mean absolute error
                            <%=eval2.meanAbsoluteError()%>
                        </h2>
                        <h2 align="left">Root mean squared error
                            <%=eval2.rootMeanSquaredError()%>
                        </h2>
                        <h2 align="left">Relative absolute error
                            <%=eval2.relativeAbsoluteError()%>%
                        </h2>
                        <h2 align="left">Root relative absolute error
                            <%=eval2.rootRelativeSquaredError()%>%
                        </h2>
                        <h2 align="left">Precision
                            <%=eval2.precision(0)%>
                        </h2>
                        <h2 align="left">Recall
                            <%=eval2.recall(0)%>
                        </h2>
                    </div>
                    <div class="col-md-4" id="chartContainer" style="display: none; width: 100%;"></div>
                    </div>
                </div>
        </div>
        </div>
        <script>
            function saveResult() {
                var method = document.getElementById("classifierselect");
                var methodname = method.options[method.selectedIndex].text;
                console.log(methodname);
                var result = {};
            if (methodname === 'NaiveBayes') {
                nb = {
                    precision: <%=eval.precision(0)%>,
                    recall: <%=eval.recall(0)%>,  
                    mae: <%=eval.meanAbsoluteError()%>,
                    rmse: <%=eval.rootMeanSquaredError()%>           
            };
                result.nb = nb;
            }
            
            if (methodname === 'J48'){
                j48 = {
                    precision: <%=eval1.precision(0)%>,
                    recall: <%=eval1.recall(0)%>,  
                    mae: <%=eval1.meanAbsoluteError()%>,
                    rmse: <%=eval1.rootMeanSquaredError()%>
            };
                result.j48 = j48;
            }
            
            if (methodname === 'SMO') {
                smo = {
                    precision: <%=eval2.precision(0)%>,
                    recall: <%=eval2.recall(0)%>,  
                    mae: <%=eval2.meanAbsoluteError()%>,
                    rmse: <%=eval2.rootMeanSquaredError()%>
            };
                result.smo = smo;
                
            }
        localStorage.setItem('result', JSON.stringify(result)); 
       }  
            function getSelected(){
                var select = document.getElementById("classifierselect");
                var selected = select.options[select.selectedIndex].text;
                var nb = document.getElementById("glassnb");
                var j48 = document.getElementById("glassj48");
                var smo = document.getElementById("glasssmo");

                if (selected === 'NaiveBayes'){
                    nb.style.display = "block";
                    j48.style.display = "none";
                    smo.style.display = "none";
                } else if(selected === 'J48') {
                    nb.style.display = "none";
                    j48.style.display = "block";
                    smo.style.display = "none";
                } else {
                    nb.style.display = "none";
                    j48.style.display = "none";
                    smo.style.display = "block";
                }
                    saveResult();
		}
            function stopAlert(){
                alert('The classification has been stopped');
            }    
            function showChart(){
                var chartselected = document.getElementById("chartContainer");                
                if (chartselected.style.display === 'none'){
                    chartselected.style.display = 'block';
                } else {
                    chartselected.style.display = 'none';
                } 
            }
            window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    theme: "light2",
                    title:{
                            text: "Glass Result"
                    },
                    axisX:{
                            crosshair: {
                                    enabled: true,
                                    snapToDataPoint: true
                            }
                    },
                    axisY: {
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
                               { label:"NaiveBayes", y:0.4553},
                               { label:"J48", y:0.6667},
                               { label:"SMO", y:0.5932},
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Recall",
                            lineDashType: "dash",
                            dataPoints: [
                               { label:"NaiveBayes", y:0.7286},
                               { label:"J48", y:0.7143},
                               { label:"SMO", y:0.5000}  
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Mean absolute error",
                            lineDashType: "shortDash",
                            color: "blue",
                            dataPoints: [
                               { label:"NaiveBayes", y:0.1541},
                               { label:"J48", y:0.1026},
                               { label:"SMO", y:0.2137}  
                            ]
                    },
                    {
                            type: "line",
                            showInLegend: true,
                            name: "Root mean squared error",
                            lineDashType: "dash",
                            dataPoints: [
                               { label:"NaiveBayes", y:0.3399},
                               { label:"J48", y:0.2897},
                               { label:"SMO", y:0.3166}  
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
