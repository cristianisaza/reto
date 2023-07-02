package meterManagerTest.meterPatch;

import com.intuit.karate.junit5.Karate;

public class MeterPatchRunner {

    @Karate.Test
    Karate meterPatch(){
        return Karate.run().relativeTo(getClass());
    }
}
