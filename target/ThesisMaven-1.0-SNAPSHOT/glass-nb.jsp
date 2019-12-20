<%-- 
    Document   : view
    Created on : Jul 9, 2019, 9:40:09 PM
    Author     : Admin
--%>

<%@page import="java.util.Random"%>
<%@page import="weka.filters.Filter"%>
<%@page import="weka.classifiers.Evaluation"%>
<%@page import="weka.classifiers.Classifier"%>
<%@page import="weka.classifiers.bayes.NaiveBayes"%>
<%@page import="java.io.File"%>
<%@page import="weka.core.converters.ArffLoader"%>
<%@page import="weka.filters.unsupervised.attribute.StringToWordVector"%>
<%@page import="weka.core.Instances"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Glass-NaiveBayes</title>
    </head>
    <body>
        <h1>* Naive Bayes Evaluation with Datasets *</h1>
        <h3><%
            String FILE_PATH = "C:/Users/Admin/Documents/ThesisMaven/target/ThesisMaven-1.0-SNAPSHOT/upload/glass.arff";

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
            } else {
                eval.crossValidateModel(classifier, trainingDataSet, 10, new Random(1));
            }
            System.out.println("* Naive Bayes Evaluation with Datasets *");
            System.out.println(eval.toSummaryString());
            System.out.print(" the expression for the input data as per alogorithm is ");
            System.out.println(classifier);


            %></h3>

        <h2>
            <%=eval.toSummaryString()%>
        </h2>
    </body>
</html>
