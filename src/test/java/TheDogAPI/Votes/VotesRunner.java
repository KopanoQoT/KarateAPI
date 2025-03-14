package TheDogAPI.Votes;

import com.intuit.karate.junit5.Karate;

class VotesRunner {

    @Karate.Test
    Karate testImages() {
        return Karate.run("postVote").relativeTo(getClass());
    }    

}
