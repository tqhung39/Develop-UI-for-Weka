package com.thesis;
import static com.thesis.Glass.getDataSet;
import java.util.Random;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.SMO;
import weka.core.Instances;


public class WeathernominalSMO {
public static void main(String[] args) {
        String FILE_PATH = "C:\\Program Files\\Weka-3-8\\data\\";

        String TRAINING_DATA_SET_FILENAME = FILE_PATH + "weather.nominal.arff";
        String TESTING_DATA_SET_FILENAME = "";
        String PREDICTION_DATA_SET_FILENAME = "";

        Instances testingDataSet;

        try {
            Instances trainingDataSet = getDataSet(TRAINING_DATA_SET_FILENAME);
            if (!TESTING_DATA_SET_FILENAME.equals("")) {
                testingDataSet = getDataSet(TESTING_DATA_SET_FILENAME);
            } else {
                testingDataSet = null;
            }
            SMO svm = new SMO();
	    svm.buildClassifier(trainingDataSet);
            Evaluation eval = new Evaluation(trainingDataSet);
            if (testingDataSet != null) {
                eval.evaluateModel(svm, testingDataSet);
            } else {
                eval.crossValidateModel(svm, trainingDataSet, 10, new Random(1));
            }
            System.out.println("Classifier output: ");            
            System.out.println(eval.toSummaryString());
            System.out.println("Precision = "+eval.precision(0));
	    System.out.println("Recall = "+eval.recall(0));
            System.out.println(svm);  
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
