# hours

This is a Rails 5.1 app I deploy on a DigitalOcean droplet for tracking my hours worked for PVTA.

It emails our payroll clerk, and my boss, the hours each week in a standard format.

It's secured with basic HTTP authentication.

This was also a way for me to become familiar with some of the cool new features of Rails 5.1:

+ encrypted secrets
+ Yarn
+ parameterized mailers
+ `form_with`

They're pretty awesome.

## development

To get going:

1. you'll want to start with Ruby 2.4.1.
1. `bundle install`, which may require installing sqlite3.
1. My `config/database.yml.example` is a decent template for DB configuration that you'll need in `config/database.yml`.
1. You'll need the `SECRET_KEY_BASE` set up in `config/secrets.yml` similarly to my `config/secrets.yml.example`.
1. Then you'll need my `secrets.yml.key`, or to generate your own secrets file anew. In that secrets file, you'll need something like:
    ```yml
    development:
      name: 'some username'
      password: 'some password'
    ```
    These will be the username and password with which you sign in to the website (HTTP basic auth).
1. Then `yarn install` will get you jQuery.
    For more information on installing yarn: https://yarnpkg.com/lang/en/docs/install/

Finally, for checking that emails work properly, you'll want mailcatcher.
I simply installed with `gem install mailcatcher` and then ran according to [their docs](https://mailcatcher.me/).
