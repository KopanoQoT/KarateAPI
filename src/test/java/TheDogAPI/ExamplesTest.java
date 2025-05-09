package TheDogAPI;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;


class ExamplesTest {


    @Test
    void testParallel() {

        String threadsProperty = System.getProperty("karate.threads", "1");
        int threads = Integer.parseInt(threadsProperty);

        Results results = Runner.path("classpath:TheDogAPI/Breeds/getBreedById.feature", "classpath:TheDogAPI/Breeds/getBreeds.feature", "classpath:TheDogAPI/Votes/postVote.feature", "classpath:TheDogAPI/Votes/getAllVotes.feature", "classpath:TheDogAPI/Votes/getVoteById.feature")
                .outputCucumberJson(true)
                .parallel(threads);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "TheDogAPI");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
