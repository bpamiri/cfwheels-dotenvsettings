component {
  function init(){
    this.title       = "dotenvsettings";
    this.author      = "Peter Amiri";
    this.description = "Based on Eric Peterson's CommandBox Module. This plugin reads vlaues from your .env file (or any other file you specify) and adds the values to CFWheels settings."
    this.version     = "1.4.5,2.0.0,2.1.0,2.2.0,2.3.0";
    return this;
  }

  function readDotEnvSettings(string fileName=".env"){
    envFilePath = getDirectoryFromPath(getBaseTemplatePath()) & arguments.fileName;
		if (fileExists(envFilePath)) {
			var envStruct = {};

			var envFile = fileRead(envFilePath);
			if (isJSON(envFile)) {
				envStruct = deserializeJSON(envFile);
			}
			else { // assume it is a .properties file
				var properties = createObject('java', 'java.util.Properties').init();
				properties.load(CreateObject('java', 'java.io.FileInputStream').init(envFilePath));
				envStruct = properties;
			}
      
			// Append to Settings
			for (var key in envStruct) {
				set("#key#"=envStruct[key]);
			}
		}
  }
}
