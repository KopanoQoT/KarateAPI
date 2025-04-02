function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

    var threads = karate.properties['karate.threads'] || '1'; // Default to 1 thread
    var retries = karate.properties['karate.retries'] || '0'; // Default to 0 retries
    var timeout = karate.properties['karate.timeout'] || '5000'; // Default to 5000 ms
    var parallel = karate.properties['karate.parallel'] || 'false'; // Default to false

    karate.log('Configuration - Threads:', threads, 'Retries:', retries, 'Timeout:', timeout, 'Parallel:', parallel);

      karate.configure('continueOnStepFailure', true);
      karate.configure('retry', { count: parseInt(retries), interval: 2000 });
      karate.configure('readTimeout', parseInt(timeout));
      karate.configure('connectTimeout', parseInt(timeout));
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,

     dogApiKey: 'live_XQuk7t74zdTkGliUObEDvozlizNJNVwmPjMPwsSY9ycUMyDAxNicy46MyoSINrPd',
     dogApiBaseUrl: 'https://api.thedogapi.com/v1',
     postVotePath:'/votes',
     votesPath:'/votes',
     getVotesPath:'votes',
     getAllVotesPath:'/votes',
     deleteVotesPath:'votes',
     getBreedPath:'/breeds'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }

  karate.configure('report', { showLog: true, showAllSteps: true });
  return config;
}