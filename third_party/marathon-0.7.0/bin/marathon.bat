@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  marathon startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and MARATHON_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Dkotlinx.coroutines.debug=on"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\cli-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\vendor-ios-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\ddmlib-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\adam-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\base-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\core-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\usage-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\html-report-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\execution-timeline-0.7.0-SNAPSHOT.jar;%APP_HOME%\lib\ddmlib-27.1.2.jar;%APP_HOME%\lib\common-27.1.2.jar;%APP_HOME%\lib\adam-0.2.3.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.4.20.jar;%APP_HOME%\lib\ktor-network-jvm-1.4.1.jar;%APP_HOME%\lib\ktor-utils-jvm-1.4.1.jar;%APP_HOME%\lib\ktor-io-jvm-1.4.1.jar;%APP_HOME%\lib\kotlin-logging-1.7.6.jar;%APP_HOME%\lib\jackson-module-kotlin-2.9.4.1.jar;%APP_HOME%\lib\kotlin-reflect-1.4.20.jar;%APP_HOME%\lib\slf4k-api-1.0.0.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\kotlin-argparser-2.0.7.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.9.6.jar;%APP_HOME%\lib\bugsnag-3.6.1.jar;%APP_HOME%\lib\allure-environment-writer-1.0.0.jar;%APP_HOME%\lib\allure-testng-2.8.1.jar;%APP_HOME%\lib\allure-descriptions-javadoc-2.8.1.jar;%APP_HOME%\lib\allure-java-commons-2.8.1.jar;%APP_HOME%\lib\allure-model-2.8.1.jar;%APP_HOME%\lib\jackson-databind-2.9.7.jar;%APP_HOME%\lib\jackson-annotations-2.9.5.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.9.6.jar;%APP_HOME%\lib\commons-text-1.3.jar;%APP_HOME%\lib\koin-core-2.0.1.jar;%APP_HOME%\lib\allure-kotlin-commons-2.1.2.jar;%APP_HOME%\lib\gson-2.8.5.jar;%APP_HOME%\lib\rsync4j-all-3.1.2-12.jar;%APP_HOME%\lib\rsync4j-windows-x86-3.1.2-12.jar;%APP_HOME%\lib\rsync4j-windows-x86_64-3.1.2-12.jar;%APP_HOME%\lib\rsync4j-core-3.1.2-12.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\influxdb-java-2.13.jar;%APP_HOME%\lib\dd-plist-1.21.jar;%APP_HOME%\lib\axmlparser-1.0.jar;%APP_HOME%\lib\guava-28.1-jre.jar;%APP_HOME%\lib\sshj-0.26.0.jar;%APP_HOME%\lib\jansi-1.17.1.jar;%APP_HOME%\lib\parser-2.1.1.jar;%APP_HOME%\lib\imgscalr-lib-4.2.jar;%APP_HOME%\lib\google-analytics-java-2.0.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.4.20.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.3.9.jar;%APP_HOME%\lib\xenocom-0.0.7.jar;%APP_HOME%\lib\runtime-jvm-0.9.1.jar;%APP_HOME%\lib\kotlinx-serialization-runtime-0.20.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.4.20.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.25.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\kotlinx-serialization-runtime-common-0.20.0.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.4.20.jar;%APP_HOME%\lib\kotlin-runtime-1.0.2.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\jackson-core-2.9.7.jar;%APP_HOME%\lib\snakeyaml-1.18.jar;%APP_HOME%\lib\commons-lang3-3.7.jar;%APP_HOME%\lib\tika-core-1.19.1.jar;%APP_HOME%\lib\aspectjrt-1.9.1.jar;%APP_HOME%\lib\joor-java-8-0.9.9.jar;%APP_HOME%\lib\testng-6.14.3.jar;%APP_HOME%\lib\converter-moshi-2.4.0.jar;%APP_HOME%\lib\retrofit-2.4.0.jar;%APP_HOME%\lib\msgpack-core-0.8.16.jar;%APP_HOME%\lib\logging-interceptor-3.11.0.jar;%APP_HOME%\lib\okhttp-3.11.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.60.jar;%APP_HOME%\lib\bcprov-jdk15on-1.60.jar;%APP_HOME%\lib\jzlib-1.1.3.jar;%APP_HOME%\lib\eddsa-0.2.0.jar;%APP_HOME%\lib\annotations-27.1.2.jar;%APP_HOME%\lib\kxml2-2.3.0.jar;%APP_HOME%\lib\protobuf-java-3.11.1.jar;%APP_HOME%\lib\annotations-16.0.2.jar;%APP_HOME%\lib\httpclient-4.5.3.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\bsh-2.0b6.jar;%APP_HOME%\lib\moshi-1.5.0.jar;%APP_HOME%\lib\okio-1.14.0.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\argparse4j-0.6.0.jar;%APP_HOME%\lib\processoutput4j-0.0.7.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.8.1.jar;%APP_HOME%\lib\error_prone_annotations-2.3.2.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.18.jar;%APP_HOME%\lib\httpcore-4.4.6.jar;%APP_HOME%\lib\commons-codec-1.9.jar


@rem Execute marathon
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %MARATHON_OPTS%  -classpath "%CLASSPATH%" com.malinskiy.marathon.cli.ApplicationViewKt %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable MARATHON_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%MARATHON_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
