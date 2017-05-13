package convertAddr;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class convertAddress {
	
	public static class CAMapper
	  extends Mapper<LongWritable, Text, Text, Text> {
	  
	  @Override
	  public void map(LongWritable key, Text value, Context context)
	      throws IOException, InterruptedException {
	    
	    String add = value.toString();
	    String newadd;
		int endIndex = add.indexOf(",");
		if(endIndex==-1)
			newadd = add.toUpperCase();
		else
			newadd = add.substring(0, endIndex).toUpperCase();
		String t1 = newadd.replace("STREET", "ST");
		String t2 = t1.replace("AV;ENUE", "AVE");
		String t3 = t2.replace("ROAD", "RD");
		String t4 = t3.replace("DRIVE", "DR");
		String t5 = t4.replace("PLACE", "PL");
		String t6 = t5.replace("LANE", "LN");
		String t7 = t6.replace("BOULEVARD", "BLVD");
		String t8 = t7.replace("EAST", "E");
		String t9 = t8.replace("WEST", "W");
		String t10 = t9.replace("NORTH", "N");
		String t11 = t10.replace("SOUTH", "S");
		context.write(value, new Text(t11));
	}
	}


	  public static void main(String[] args) throws Exception {
	    if (args.length != 2) {
	      System.err.println("Usage: convertAddress <input path> <output path>");
	      System.exit(-1);
	    }
	    
	    Job job = new Job();
	    job.setJarByClass(convertAddress.class);
	    job.setJobName("Convert Address");

	    FileInputFormat.addInputPath(job, new Path(args[0]));
	    FileOutputFormat.setOutputPath(job, new Path(args[1]));
	    
	    job.setMapperClass(CAMapper.class);
	    job.setNumReduceTasks(0);
	    //job.setReducerClass(CWReducer.class);

	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(Text.class);
	    
	    System.exit(job.waitForCompletion(true) ? 0 : 1);
	  }

}
