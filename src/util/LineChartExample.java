package util;
import java.io.File;
import java.util.ArrayList;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
  
public class LineChartExample {  
  
  private static final long serialVersionUID = 1L;  
  
  public LineChartExample(String title, ArrayList<String> a, String a2) {  
    //super("Line Chart");  
    // Create dataset  
    DefaultCategoryDataset dataset = createDataset(a,a2);  
    // Create chart  
    JFreeChart chart = ChartFactory.createLineChart(  
            "Cattle ", // Chart title  
            "Time", // X-Axis Label  
            "Number", // Y-Axis Label  
            dataset,  PlotOrientation.VERTICAL, true, true, false  
            );   

    ChartPanel panel = new ChartPanel(chart);  


    File BarChart = new File(title + "\\linechart.jpeg");
    try {
      ChartUtilities.saveChartAsJPEG(BarChart, panel.getChart(), 500, 500);
    }
    catch (Exception e) {
      e.printStackTrace();
     
  }  
    
  }
  private DefaultCategoryDataset createDataset(ArrayList<String> al,String a2) {  
  
    String series1 = "Temperature";  
    String series2 = "Humidity";
    String series3 = "Pulse";
  
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
  
    for(int i=0;i<al.size();i+=2){
    System.out.println(Double.parseDouble(al.get(i)));
    
    dataset.addValue(Double.parseDouble(al.get(i)),a2, al.get(i+1) );  
    }
  
  
    return dataset;  
  }  
  
 
  }  
  