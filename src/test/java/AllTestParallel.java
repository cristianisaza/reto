import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class AllTestParallel {

    @Test
    void testParallel(){

        Runner.path("classpath:meterManagerTest").tags("~@ignore").
                parallel(2);
    }
}
