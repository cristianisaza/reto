package meterManagerTest.meterDelete;

import com.intuit.karate.junit5.Karate;

public class MeterGetRunner {
@Karate.Test
    Karate meterDelete(){
    return Karate.run().relativeTo(getClass());
}
}
