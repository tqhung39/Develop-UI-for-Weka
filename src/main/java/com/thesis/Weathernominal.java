package com.thesis;

import java.io.File;
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import java.util.Random;


public class Weathernominal {
    public static Instances getDataSet(String fileName) {
        try {
            ArffLoader loader = new ArffLoader();
            loader.setSource(new File(fileName));
            Instances dataSet = loader.getDataSet();
            int classIdx = dataSet.numAttributes() - 1;
            dataSet.setClassIndex(classIdx);
            return dataSet;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        String FILE_PATH = "C:\\Program Files\\Weka-3-8\\data\\";
        String TRAINING_DATA_SET_FILENAME = FILE_PATH + "weather.nominal.arff";
        String TESTING_DATA_SET_FILENAME = "";
        String PREDICTION_DATA_SET_FILENAME = "";
        Instances testingDataSet;
        Instances predictingDataSet;
        try {
            Instances trainingDataSet = getDataSet(TRAINING_DATA_SET_FILENAME);
            if (!TESTING_DATA_SET_FILENAME.equals("")) {
                testingDataSet = getDataSet(TESTING_DATA_SET_FILENAME);
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
            System.out.println("Precision = "+eval.precision(0));
	    System.out.println("Recall = "+eval.recall(0));
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}