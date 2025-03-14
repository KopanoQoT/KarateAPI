function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
    karate.configure('continueOnStepFailure', true);
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
  return config;
}