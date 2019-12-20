package com.thesis;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.functions.LibSVM;
import weka.classifiers.functions.SMO;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;


public class WeathernominalSMO {
	public static void main(String[] args) throws Exception{
		DataSource source = new DataSource("C:\\\\Program Files\\\\Weka-3-8\\\\data\\\\weather.nominal.arff");
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
		System.out.println("Precision = "+eval2.precision(0));
		System.out.println("Recall = "+eval2.recall(0));
	}
}
