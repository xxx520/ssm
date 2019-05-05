package base;

import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@BenchmarkMode(Mode.AverageTime)
// 测试方法平均执行时间
@OutputTimeUnit(TimeUnit.MICROSECONDS)
// 输出结果的时间粒度为微秒
@State(Scope.Thread)
// 每个测试线程一个实例
public class BaseBenchMarkTest {
	private static Logger log = LoggerFactory
			.getLogger(BaseBenchMarkTest.class);

	@Benchmark
	public String stringConcat() {
		String a = "a";
		String b = "b";
		String c = "c";
		String s = a + b + c;
		log.debug(s);
		return s;
	}
 @Benchmark
    @BenchmarkMode(Mode.Throughput)
    @OutputTimeUnit(TimeUnit.SECONDS)
    public void stringLoop(){
        String str = new String();
        for(int i = 0; i<100; i++){
            str += "str\t";
            str += "str\t";
            str += "str\t";
            str += "str\t";
            str += "str\t";
        }


    }

    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    @OutputTimeUnit(TimeUnit.SECONDS)
    public void builderLoop(){
        StringBuilder builder = new StringBuilder();
        for(int i = 0; i<100; i++){
            builder.append("str\t");
            builder.append("str\t");
            builder.append("str\t");
            builder.append("str\t");
            builder.append("str\t");
        }


    }

    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    @OutputTimeUnit(TimeUnit.SECONDS)
    public void bufferLoop(){
        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < 100; i++){
            buffer.append("str\t");
            buffer.append("str\t");
            buffer.append("str\t");
            buffer.append("str\t");
            buffer.append("str\t");
        }
    }
    /**
     * 
     * @param args
     * @throws RunnerException
     */
	public static void main(String[] args) throws RunnerException {
		// 使用一个单独进程执行测试，执行5遍warmup，然后执行5遍测试
		Options opt = new OptionsBuilder()
				.include(BaseBenchMarkTest.class.getSimpleName())
				.forks(1)
				.warmupIterations(5)
				.measurementIterations(5)
				.build();
		new Runner(opt).run();
	}
	
	
}
