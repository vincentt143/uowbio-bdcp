//import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.htmlunit.HtmlUnitDriver
import org.openqa.selenium.JavascriptExecutor
import com.gargoylesoftware.htmlunit.BrowserVersion
import groovy.sql.Sql
import java.io.File
import java.io.IOException

this.metaClass.mixin(cuke4duke.GroovyDsl)

private final String LOREM_IPSUM_TEXT = "lorem ipsum dolor sit amet";
private final String FILE_HTML = "<div>" + LOREM_IPSUM_TEXT + "</div>";


Before() {
	def sql = Sql.newInstance("jdbc:postgresql://localhost:5432/bdcp-test", "grails", "grails", "org.postgresql.Driver")
	sql.execute("delete from user_store")
	sql.execute("INSERT INTO user_store (id,version, username, deactivated) VALUES ('-1','0','dpollum', 'false');")
  sql.execute("INSERT INTO user_store (id,version, username, deactivated) VALUES ('-2','0','chrisk', 'false');")
  browser = new HtmlUnitDriver(BrowserVersion.FIREFOX_3_6)
  JavascriptExecutor jsExecutor = (JavascriptExecutor) browser;
  //browser.setJavascriptEnabled(true)
  //browser = new HtmlUnitDriver()
  testFile = createTmpFile(FILE_HTML);
  
}

After() {
  browser.get("http://localhost:8080/BDCP/greenmail/clear")
  browser.close()
  browser.quit()
  
  def sql = Sql.newInstance("jdbc:postgresql://localhost:5432/bdcp-test", "grails", "grails", "org.postgresql.Driver")
  sql.execute("delete from user_store")
  sql.execute("INSERT INTO user_store (id,version, username, deactivated) VALUES ('-1','0','dpollum', 'false');")
  sql.execute("INSERT INTO user_store (id,version, username, deactivated) VALUES ('-2','0','chrisk', 'false');")
  sql.execute("delete from participant_form")
  sql.execute("delete from participant")
  sql.execute("delete from session")
  sql.execute("delete from component")
  sql.execute("delete from study_device_field")
  sql.execute("delete from study_device")
  sql.execute("delete from study")
  sql.execute("delete from project")
  sql.execute("delete from device_field")
  sql.execute("delete from device")
  sql.execute("delete from device_group")
  
  File tmpDir = new File(getTmpPath())
  File realDir = new File(getRealPath())
  File formsDir = new File(getUowBioFormsPath())
  
  tmpDir.deleteDir()
  realDir.deleteDir()
  formsDir.deleteDir()
}

private String getTmpPath()
{
	return ("web-app/tmp/")
}


private String getRealPath()
{
	return ("web-app/sessions/files/")
}

private String getUowBioFormsPath()
{
	return ("web-app/uowbio/forms")
}

private File createTmpFile(String content) throws IOException {
	File f = File.createTempFile("webdriver", "tmp");
	f.deleteOnExit();

	OutputStream out = new FileOutputStream(f);
	PrintWriter pw = new PrintWriter(out);
	pw.write(content);
	pw.flush();
	pw.close();
	out.close();

	return f;
  }
