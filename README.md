# Personal Dashboard & API

A personal statistics dashboard and API.

## Inspiration

I wrote about this a little while back [Personal API • Quantified Self](http://blog.hopkins.io/2013/06/08/personal-api/).

## Instructions

1. Run `rake db:setup` and answer the prompts.

2. Setup your `env` file to include the following variables: `JAWBONE_UP_EMAIL`, `JAWBONE_UP_PWD`, `WITHINGS_OAUTH_CONSUMER_KEY`, `WITHINGS_OAUTH_CONSUMER_SECRET`, `WITHINGS_OAUTH_TOKEN`, `WITHINGS_OAUTH_TOKEN_SECRET`, and `WITHINGS_USER_ID`.

3. Deploy to Heroku and ensure you've set all your config variables above on Heroku.

4. Next, setup Heroku Scheduler and add `rake refresh_jawbone` and `rake refresh_withings` to run every hour.

## Features

### Dashboard

The dashboard displays data related to sleep, steps, calories, mood, weight, and pulse. The data is pulled down from the Jawbone and Withings API. The dashboard itself is responsive so it looks decent on an iPhone or iPad.

### API

Generate an `APIKey` on the server to be used when querying specific resources. An example call to the API would be something like `http://api.hopkins.io/v0/steps?access_token=f5f9d468258eebf57a505ae528a725a7`. This would return all the expected JSON.

## Credit

- [Chart.js](https://github.com/nnnick/Chart.js) — Simple HTML5 Charts using the <canvas> tag.
- [jawbone-up-ruby](https://github.com/aaronpk/jawbone-up-ruby) — Ruby API client for the Jawbone UP.
- [simplificator-withings](https://github.com/simplificator/simplificator-withings) — A Ruby library for accessing WBS API data.
- [withings-api](https://github.com/webmonarch/withings-api) — Ruby library used to authenticate with the WBS API.
- [gridster.js](https://github.com/ducksboard/gridster.js) — Intuitive draggable layouts.

## Notes

- [Withings API • Quick Start Guide](http://blog.hopkins.io/2013/07/25/withings-api/)
- [Version 1.0.0 • Personal API](http://blog.hopkins.io/2013/07/18/version-100/)
- [Progress • Personal API](http://blog.hopkins.io/2013/06/23/progress/)
- [Personal API • Quantified Self](http://blog.hopkins.io/2013/06/08/personal-api/)

## Authors

Christopher Hopkins

- [http://twitter.com/hopkinschris](http://twitter.com/hopkinschris)
- [http://github.com/hopkinschris](http://github.com/hopkinschris)

## License

You may use the Dashboard project under the terms of the [MIT License](https://github.com/chocolit/dashboard/blob/master/LICENSE).
