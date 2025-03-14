package TheDogAPI.Images;

import com.intuit.karate.junit5.Karate;

class ImagesRunner {

    @Karate.Test
    Karate testImages() {
        return Karate.run("postImage").relativeTo(getClass());
    }    

}
