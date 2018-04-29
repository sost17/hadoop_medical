package datamining;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.WritableComparable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.SequenceFileInputFormat;
import org.apache.hadoop.mapreduce.lib.map.InverseMapper;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.SequenceFileOutputFormat;

import java.io.IOException;
import java.net.URI;
import java.util.StringTokenizer;

public class HDFS_API {
    static FileSystem fileSystem = null;
    static int min_support = 1;

    /**
     * 获取namenode url
     * */
    public static String hdfsUrl = "hdfs://master:9000";

    /**
     * 获取hdfs的句柄
     * */
    public static FileSystem getHdfs() throws Exception{
        //获取配置文件信息
        Configuration conf = new Configuration();
        //获取文件系统
        fileSystem = FileSystem.get(URI.create(hdfsUrl),conf);

        return fileSystem;
    }

    /**
     * 创建目录
     * */
    public static boolean makedir() throws Exception {
        fileSystem = getHdfs();
        //创建/input目录
        return fileSystem.mkdirs(new Path("/input/"));
    }

    /**
     * 写文件
     * */
    public static String writefile(String inputdata ,int datacount ) throws Exception {
        String writeput_data = "";
        fileSystem = getHdfs();
        min_support = datacount;
        //创建目录
        makedir();
        //创建文件路径
        Path p = new Path("/input/data.txt");
        //获得文件的输出流
        FSDataOutputStream out =fileSystem.create(p);

        //文件写入
        out.write(inputdata.getBytes("utf-8"));
        out.close();

        //执行mapreduce
        mapreduce();

        //获取分析结果
        writeput_data = download();

        return writeput_data;
    }

    /**
     * 下载文件
     * */
    public static String download() throws Exception {
        fileSystem = getHdfs();
        FSDataInputStream inFile = fileSystem.open(new Path("/output/part-r-00000"));
        byte buffer[] = new byte[256];
        int bytesRead = 0;
        String s = "";
        while((bytesRead = inFile.read(buffer))>0){
            s += new String(buffer,0,bytesRead);
//            out.write(new String(buffer, "utf-8").getBytes("utf-8"),0,bytesRead);
        }
        String[] line = s.split("\\n");
        String id = "";
        for(int i = 0 ; i < line.length ; i ++){
            if(Integer.valueOf(line[i].split("\\s")[0]) >= min_support){
                id += ","+ line[i].split("\\s")[1];
            }
        }
        inFile.close();

        //删除输出文件
        deletefileOnDrictory(new Path("/output"));

        return id;
    }

    /**
     * 删除文件
     * */
    public static void deletefileOnDrictory(Path tempDir) throws Exception {
        fileSystem = getHdfs();
        fileSystem.delete(tempDir,true);
    }

    /**
     * wordcount
     * */
    public static class WordCountMap extends
            Mapper<LongWritable, Text, Text, IntWritable> {
        private final IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(LongWritable key, Text value, Context context)
                throws IOException, InterruptedException {
            String line = value.toString();
            StringTokenizer token = new StringTokenizer(line);
            while (token.hasMoreTokens()) {
                word.set(token.nextToken());
                context.write(word, one);
            }
        }
    }
    public static class TokenizerMapper extends Mapper<Object, Text, Text, IntWritable>{

        private final static IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(Object key, Text value, Context context
        ) throws IOException, InterruptedException {
            StringTokenizer itr = new StringTokenizer(value.toString()," ,.\":\t\n");
            while (itr.hasMoreTokens()) {
                word.set(itr.nextToken().toLowerCase());
                context.write(word, one);
            }
        }
    }
    public static class IntSumReducer
            extends Reducer<Text,IntWritable,Text,IntWritable> {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values,
                           Context context
        ) throws IOException, InterruptedException {
            int sum = 0;
            for (IntWritable val : values) {
                sum += val.get();
            }
            result.set(sum);
            context.write(key, result);

        }
    }

    private static class IntWritableDecreasingComparator extends IntWritable.Comparator {

        public int compare(WritableComparable a, WritableComparable b) {
            return -super.compare(a, b);
        }
        public int compare(byte[] b1, int s1, int l1, byte[] b2, int s2, int l2) {
            return -super.compare(b1, s1, l1, b2, s2, l2);
        }
    }


    public static void mapreduce() throws Exception{
        fileSystem = getHdfs();
        fileSystem.getConf().set("dfs.permissions","false");
        Path tempDir = new Path("wordcount-temp-output");

        Job job = Job.getInstance(fileSystem.getConf(),"word count");
        job.setJarByClass(HDFS_API.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        job.setMapperClass(TokenizerMapper.class);
        job.setCombinerClass(IntSumReducer.class);
        job.setReducerClass(IntSumReducer.class);
        job.setOutputFormatClass(SequenceFileOutputFormat.class);
        FileInputFormat.addInputPath(job, new Path("/input/data.txt"));
        FileOutputFormat.setOutputPath(job,tempDir);

        job.waitForCompletion(true);

        Job sortjob = Job.getInstance(fileSystem.getConf(),"sort");
        FileInputFormat.addInputPath(sortjob,tempDir);
        sortjob.setInputFormatClass(SequenceFileInputFormat.class);
        sortjob.setMapperClass(InverseMapper.class);
        sortjob.setNumReduceTasks(1);
        FileOutputFormat.setOutputPath(sortjob,new Path("/output/"));
        sortjob.setOutputKeyClass(IntWritable.class);
        sortjob.setOutputValueClass(Text.class);
        sortjob.setSortComparatorClass(IntWritableDecreasingComparator.class);
        sortjob.waitForCompletion(true);
        deletefileOnDrictory(tempDir);
    }

}
