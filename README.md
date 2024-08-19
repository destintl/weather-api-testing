# Karate API Automation Testing

## Test Framework
- BDD Style
- Gherkin Syntax

## [Local Run] Installation

### Install - Depedencies

- Install HomeBrew
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install [Java](https://www.oracle.com/id/java/technologies/javase/javase8-archive-downloads.html) (JDK)
  ```
  brew install openjdk@11
  ```
- Install [Maven](https://maven.apache.org/)
  ```
  brew install maven
  ```
  
## [Local Run] How To Run It?
Before run, enter your **appid** in variable **apiKey**

These are some steps to run test on local environment:
- `cd` to the base directory of this project
- run `mvn clean install`
- run all test case `mvn test`

## View the HTML report
1. Navigate to the Report Location:
    * Go to the `target/karate-reports` directory in your project folder.
2. Open the Report:
    * Open the `karate-summary.html` file in a web browser to view the test results.
