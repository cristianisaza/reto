package meterManagerTest.meterGet;

import com.intuit.karate.junit5.Karate;

public class MeterGetRunner {
    @Karate.Test
    Karate meterGet(){
        return Karate.run().relativeTo(getClass());
    }
}
