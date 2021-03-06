package cucumber_runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features="test/cucumber_feature/AdminGetUserPage.feature",
		glue="cucumber_stepDefinition.adminGetUser",
		plugin= {"pretty", "html:target/CucumberReports/AccountGetUserPage","junit:target/CucumberReports/AccountGetUserPage/junit.xml"}
		)
public class AdminGetUser_Runner {

}
