package base;

import java.util.concurrent.TimeUnit;

import org.junit.Test;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.amethystum.manage.BootApplication;
import com.amethystum.manage.common.utils.SpringContextUtil;
import com.amethystum.manage.modules.api.service.mybatis.Demo2Service;

@BenchmarkMode(Mode.AverageTime)
// 测试方法平均执行时间
@OutputTimeUnit(TimeUnit.MICROSECONDS)
// 输出结果的时间粒度为微秒
@State(Scope.Thread)
// 每个测试线程一个实例
//@Component
public class BaseBenchMarkTest extends BaseServiceTest{
	private static Logger log = LoggerFactory
			.getLogger(BaseBenchMarkTest.class);
  
	@Autowired
    private Demo2Service demo2Service;
	// 其实也可以放在static中。
    // 不过指明 @Setup 不会计算在总时间里
//    @Setup(Level.Trial)
//    public void init() {
//        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("application.xml");
//        helloService = ctx.getBean(HelloService.class);
//        commonService = ctx.getBean(CommonService.class);
//    }
//  @Benchmark
//  @BenchmarkMode(Mode.Throughput)
//  @OutputTimeUnit(TimeUnit.SECONDS)
//  public void stringLoop(){
////      String str = new String();
//      for(int i = 0; i<100; i++){
////    	  System.out.println(SpringContextUtil);
//    	  System.out.println(demo2Service);
//    	  System.out.println(BootApplication.getContext());
//    	  
//    	  demo2Service.selectList(null);
//      }
//
//
//  }
//	
//	@Benchmark
//	public String stringConcat() {
//		String a = "a";
//		String b = "b";
//		String c = "c";
//		String s = a + b + c;
//		log.debug(s);
//		return s;
//	}
// @Benchmark
//    @BenchmarkMode(Mode.Throughput)
//    @OutputTimeUnit(TimeUnit.SECONDS)
//    public void stringLoop(){
//        String str = new String();
//        for(int i = 0; i<100; i++){
//            str += "str\t";
//            str += "str\t";
//            str += "str\t";
//            str += "str\t";
//            str += "str\t";
//        }
//
//
//    }
//
//    @Benchmark
//    @BenchmarkMode(Mode.Throughput)
//    @OutputTimeUnit(TimeUnit.SECONDS)
//    public void builderLoop(){
//        StringBuilder builder = new StringBuilder();
//        for(int i = 0; i<100; i++){
//            builder.append("str\t");
//            builder.append("str\t");
//            builder.append("str\t");
//            builder.append("str\t");
//            builder.append("str\t");
//        }
//
//
//    }
//
//    @Benchmark
//    @BenchmarkMode(Mode.Throughput)
//    @OutputTimeUnit(TimeUnit.SECONDS)
//    public void bufferLoop(){
//        StringBuffer buffer = new StringBuffer();
//        for(int i = 0; i < 100; i++){
//            buffer.append("str\t");
//            buffer.append("str\t");
//            buffer.append("str\t");
//            buffer.append("str\t");
//            buffer.append("str\t");
//        }
//    }
    @Test
	public void test() {
    	try {
			// 使用一个单独进程执行测试，执行5遍warmup，然后执行5遍测试
			Options opt = new OptionsBuilder()
					.include(BaseBenchMarkTest.class.getSimpleName())
					.forks(1)
					.warmupIterations(5)
					.measurementIterations(5)
					.build();
				new Runner(opt).run();
		} catch (RunnerException e) {
			e.printStackTrace();
		}
	}
	
	
}
