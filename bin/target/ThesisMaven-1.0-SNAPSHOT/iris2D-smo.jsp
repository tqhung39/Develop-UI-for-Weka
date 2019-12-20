<%-- 
    Document   : glass-smo
    Created on : Nov 24, 2019, 9:35:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="weka.classifiers.Evaluation"%>
<%@page import="weka.classifiers.bayes.NaiveBayes"%>
<%@page import="weka.classifiers.functions.SMO"%>
<%@page import="weka.core.Instances"%>
<%@page import="weka.core.converters.ConverterUtils.DataSource"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iris2D-SMO</title>
    </head>
    <body>
        <h1>=== Summary ===</h1>
        <h1>
            <%
                DataSource source = new DataSource("C:\\Program Files\\Weka-3-8\\data\\iris.2D.arff");
		Instances dataset = source.getDataSet();
		dataset.setClassIndex(dataset.numAttributes()-1);
		NaiveBayes nb = new NaiveBayes();
		nb.buildClassifier(dataset);
		Evaluation eval = new Evaluation(dataset);
		eval.evaluateModel(nb, dataset);
		System.out.println(eval.toSummaryString());
		
		SMO svm = new SMO();
		svm.buildClassifier(dataset);
		Evaluation eval2 = new Evaluation(dataset);
		eval2.evaluateModel(svm, dataset);
		System.out.println(eval2.toSummaryString());
		
                %></h1>
        <h2>
            <%=eval2.toSummaryString()%>
        </h2>
        <h2>Precision
            <%=eval2.precision(0)%>
        </h2>
        <h2>Recall
            <%=eval2.recall(0)%>
        </h2>
    </body>
</html>
