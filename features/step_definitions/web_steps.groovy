import static org.junit.Assert.*
import static org.junit.matchers.JUnitMatchers.*
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

import au.org.intersect.bdcp.Project;

this.metaClass.mixin(cuke4duke.GroovyDsl)



/**
 * This is a set of steps that do the usual things on web pages, such as filling in form fields, clicking buttons and links etc
 * This should not contain application-specific steps - they should go in their own step file.
 */

Given(~"I am on the home page") { ->
    browser.get("http://localhost:8080/BDCP")
}

Given(~"I follow \"(.*)\"") { String link->
	/**WebDriver driver = new HtmlUnitDriver();
	driver.get("http://localhost:8080/BDCP");*/
	WebElement element = browser.findElement(By.linkText(link))
	element.click()
}

When(~"I fill in \"(.*)\" with \"(.*)\"") { String field, String text ->
    fieldElement = browser.findElement(By.name(field))
    fieldElement.sendKeys(text)
}

When(~"I select \"(.*)\" from \"(.*)\"") { String value, String field ->
    fieldElement = browser.findElement(By.name(field))
	Select select = new Select(fieldElement)
	select.selectByVisibleText(value);
}

When(~"I press \"(.*)\"") { String button ->
    browser.findElementById(button).click()
}

Then(~"I should see \"(.*)\"") { String text ->
    assertThat(browser.findElementByTagName('body').text, containsString(text))
}

Then(~"I should see table \"(.*)\" with contents") { String tableId, cuke4duke.Table table ->
	webTable = browser.findElementsByCssSelector("table#${tableId} tbody tr").collect {
        def cols = it.findElementsByTagName('td')
        [cols[0].text, cols[1].text]
	}
	table.diffLists(webTable)
}