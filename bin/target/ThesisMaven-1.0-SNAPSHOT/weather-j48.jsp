<%-- 
    Document   : weather-j48
    Created on : Sep 25, 2019, 3:57:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="weka.core.Instances"%>
<%@page import="java.util.Random"%>
<%@page import="weka.core.converters.ConverterUtils.DataSource"%>
<%@page import="weka.classifiers.trees.J48"%>
<%@page import="weka.classifiers.Evaluation"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weather-J48</title>
    </head>
    <body>
        <h1>Evaluation results:</h1>
        <h1><%
                DataSource source = new DataSource("C:\\Program Files\\Weka-3-8\\data\\weather.nominal.arff");
		Instances dataset = source.getDataSet();	
		//set class index to the last attribute
		dataset.setClassIndex(dataset.numAttributes()-1);
		//create and build the classifier!
		J48 tree = new J48();
		tree.buildClassifier(dataset);
		
		Evaluation eval = new Evaluation(dataset);
		Random rand = new Random(1);
		int folds = 10;
		
		//Notice we build the classifier with the training dataset
        //we initialize evaluation with the training dataset and then
        //evaluate using the test dataset

		//test dataset for evaluation
		DataSource source1 = new DataSource("C:\\Program Files\\Weka-3-8\\data\\weather.nominal.arff");
		Instances testDataset = source1.getDataSet();
		//set class index to the last attribute
		testDataset.setClassIndex(testDataset.numAttributes()-1);
		//now evaluate model
		//eval.evaluateModel(tree, testDataset);
		eval.crossValidateModel(tree, testDataset, folds, rand);
		System.out.println(eval.toSummaryString("Evaluation results:\n", false));
		
		System.out.println("Correct % = "+eval.pctCorrect());
		System.out.println("Incorrect % = "+eval.pctIncorrect());
		System.out.println("AUC = "+eval.areaUnderROC(1));
		System.out.println("kappa = "+eval.kappa());
		System.out.println("MAE = "+eval.meanAbsoluteError());
		System.out.println("RMSE = "+eval.rootMeanSquaredError());
		System.out.println("RAE = "+eval.relativeAbsoluteError());
		System.out.println("RRSE = "+eval.rootRelativeSquaredError());
		System.out.println("Precision = "+eval.precision(1));
		System.out.println("Recall = "+eval.recall(1));
		System.out.println("fMeasure = "+eval.fMeasure(1));
		System.out.println("Error Rate = "+eval.errorRate());
	    //the confusion matrix
		System.out.println(eval.toMatrixString("=== Overall Confusion Matrix ===\n"));


            %></h1>
            
            <h2>
            <%=eval.toSummaryString()%>
            </h2>
            
            <h2>
            <%=eval.toMatrixString()%>
            </h2>
    </body>
</html>
