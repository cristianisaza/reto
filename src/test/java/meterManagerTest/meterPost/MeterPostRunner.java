package meterManagerTest.meterPost;

import com.intuit.karate.junit5.Karate;

public class MeterPostRunner {
    @Karate.Test
    Karate meterPost(){
        return Karate.run("meter-post").relativeTo(getClass());
    }
}
