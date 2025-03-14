package TheDogAPI.Breeds;

import com.intuit.karate.junit5.Karate;

class BreedsRunner {

    @Karate.Test
    Karate testImages() {
        return Karate.run("getBreeds").relativeTo(getClass());
    }    

}
