LANGUAGE_SERVER = 4.6.0.2652
JAVASCRIPT_PLUGIN = 6.4.1.12828
JAVA_PLUGIN = 6.7.0.23054
PHP_PLUGIN = 3.9.0.6331
PYTHON_PLUGIN = 3.1.0.7619
HTML_PLUGIN = 3.2.0.2082

OUT_FILES = \
	out/sonarlint-language-server-$(LANGUAGE_SERVER).jar \
	out/sonar-javascript-plugin-$(JAVASCRIPT_PLUGIN).jar \
	out/sonar-java-plugin-$(JAVA_PLUGIN).jar \
	out/sonar-php-plugin-$(PHP_PLUGIN).jar \
	out/sonar-python-plugin-$(PYTHON_PLUGIN).jar \
	out/sonar-html-plugin-$(HTML_PLUGIN).jar \
	out/LSP-SonarLint.sublime-settings \
	out/LSP-SonarLint.sublime-commands \
	out/plugin.py \
	out/LICENSE \
	out/NOTICE

all: out/release.zip

out/release.zip: $(OUT_FILES)
	cd out && zip -q -r release.zip .

out/LSP-SonarLint.sublime-settings: out LSP-SonarLint.sublime-settings
	cp LSP-SonarLint.sublime-settings out/LSP-SonarLint.sublime-settings

out/LSP-SonarLint.sublime-commands: out LSP-SonarLint.sublime-commands
	cp LSP-SonarLint.sublime-commands out/LSP-SonarLint.sublime-commands

out/plugin.py: out plugin.py
	cp plugin.py out/plugin.py

out/LICENSE: out LICENSE
	cp LICENSE out/LICENSE

out/NOTICE: out NOTICE
	cp NOTICE out/NOTICE

fetch = curl --silent https://binaries.sonarsource.com/Distribution/$(1)/$(1)-$(2).jar -o out/$(1)-$(2).jar

out/sonarlint-language-server-$(LANGUAGE_SERVER).jar: out
	$(call fetch,sonarlint-language-server,$(LANGUAGE_SERVER))

out/sonar-javascript-plugin-$(JAVASCRIPT_PLUGIN).jar: out
	$(call fetch,sonar-javascript-plugin,$(JAVASCRIPT_PLUGIN))

out/sonar-java-plugin-$(JAVA_PLUGIN).jar: out
	$(call fetch,sonar-java-plugin,$(JAVA_PLUGIN))

out/sonar-php-plugin-$(PHP_PLUGIN).jar: out
	$(call fetch,sonar-php-plugin,$(PHP_PLUGIN))

out/sonar-python-plugin-$(PYTHON_PLUGIN).jar: out
	$(call fetch,sonar-python-plugin,$(PYTHON_PLUGIN))

out/sonar-html-plugin-$(HTML_PLUGIN).jar: out
	$(call fetch,sonar-html-plugin,$(HTML_PLUGIN))

out:
	mkdir -p out

clean:
	rm -rf out

.PHONY: all clean
