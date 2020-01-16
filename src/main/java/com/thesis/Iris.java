package com.thesis;

import java.io.File;
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import java.util.Random;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Iris {
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
        public static ArrayList<String> getFile(String fileName) throws IOException{
            BufferedReader reader;
            ArrayList<String>dataset = new ArrayList<String>();
            try {
                reader = new BufferedReader(new FileReader("C:/Users/Admin/Documents/ThesisMaven/target/ThesisMaven-1.0-SNAPSHOT/upload/iris.2D.arff"));
                  String line = reader.readLine();
                while(line != null ) {
                    if (line.charAt(0) == '%'){
                        line = reader.readLine();
                        System.out.println(line);
                        continue;
                    }
                    dataset.add(line);
                    line = reader.readLine();
            }
            } catch (FileNotFoundException ex) {
            	Logger.getLogger(Iris.class.getName()).log(Level.SEVERE, null, ex);
            }
                   return dataset;
        }
    public static void main(String[] args) {
        String FILE_PATH = "C:\\Program Files\\Weka-3-8\\data\\";

        String TRAINING_DATA_SET_FILENAME = FILE_PATH + "iris.2D.arff";
        String TESTING_DATA_SET_FILENAME = "";


        Instances testingDataSet;

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
            System.out.println("Precision = "+eval.precision(0));
	    System.out.println("Recall = "+eval.recall(0));
            System.out.println(classifier);            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}