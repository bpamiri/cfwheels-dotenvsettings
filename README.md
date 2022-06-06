CFWheels DotEnvSettings Plugin
==============================
This module reads secrets contained in a .env file (or other file you specify) and loads the values into the CFWheels settings. Based on Eric Peterson's CommandBox Module.

## LICENSE
Apache License, Version 2.0.

## SYSTEM REQUIREMENTS
- Lucee 5+
- ColdFusion 9+
- CFWheels 2+

---

# Instructions
Just drop the zip file into your `plugins` folder and restart your application or use the wheels cli to install

`box install cfwheels-plugin-dotenvsettings`

## USAGE
Create a .env file in your project root and add to .gitignore or your version control's equivalent (don't commit secrets to your repo!) The file can contain JSON or Java properties style key value pairs:

```js
// property style
MY_SECRET_KEY=somevalue
MY_OTHER_SECRET=shh

// json style
{
     "MY_SECRET_KEY"="somevalue"
    ,"MY_OTHER_SECRET"="shh"
};
```

The default file name supported is .env but you can use any file name you want. You could even have multiple files for various environment.

In your CFWheels app you can read in your secrets by adding `readDotEnvSettings()` to your application. The most logical point to do this would be in your `events\onApplicationStart.cfm` file, but you could do it in your environment specific `settings.cfm` files as well. You can then access the secrets contained in the file processed using `get("MY_SECRET_KEY")`.

If you want to customize the secrets file to use, you can specify the file name by passing in the file name like so `readDotEnvSettings(".env-second")`.
