package cucumber_runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features="test/cucumber_feature/OrderReceiptPage.feature",
		glue="cucumber_stepDefinition.orderReceipt",
		plugin= {"pretty", "html:target/CucumberReports/OrderReceiptPage","junit:target/CucumberReports/OrderReceiptPage/junit.xml"}
		)
public class OrderReceiptPage_Runner {

}
