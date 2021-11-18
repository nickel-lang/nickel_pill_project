# Nickel Dogfooding
This project is used to write Nickel pills, document Nickel features and test features in real-world conditions.

# The project
A computing server that has a Web dashboard interface

Simple Python Flask application that reads the configuration from the generated JSON file.

# The configuration
- Environment
Set up environment variables from Flask application directly, reading from json
``` python3
app.config['ENVIRONMENT_VAR'] = "var name here"
```

- Restricted pages
Define routes that are restricted by "password" from ones that are not

- Security parameters
  - How many iterations in password Hashing algorithm
  - Download from a website:
    - Set which version to download from github
    - Set URL to download
    ```
        makeURL : Str -> Str -> Num -> Str = fun proto host port => "${proto}://${host}:${numToStr port}/";
    ```
    - Check the hash of the version downloaded

- Custom extension to use:
Set up a contract that forbid more than 4 characters in the extension name
