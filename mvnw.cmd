@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF)
@REM Maven Wrapper startup batch script
@REM ----------------------------------------------------------------------------
@IF "%__MVNW_ARG0_NAME__%"=="" (SET "BASE_DIR=%~dp0") ELSE (SET "BASE_DIR=%__MVNW_ARG0_NAME__%")
@SET MAVEN_PROJECTBASEDIR=%BASE_DIR%
@SET MAVEN_HOME=
@SET MVNW_REPOURL=https://repo.maven.apache.org/maven2

@SET WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
@SET WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
@SET WRAPPER_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar
@SET DOWNLOAD_URL=%WRAPPER_URL%

@IF EXIST %WRAPPER_JAR% (
    @SET INIT_SCRIPT=
) ELSE (
    @echo Downloading Maven Wrapper from %DOWNLOAD_URL%
    @powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR:\"=%')"
)

@FOR /F "usebackq tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") DO (
    @IF "%%A"=="distributionUrl" SET "DISTRIBUTION_URL=%%B"
)

@SET MAVEN_OPTS=%MAVEN_OPTS%

@IF "%JAVA_HOME%"=="" (SET JAVACMD=java.exe) ELSE (SET JAVACMD="%JAVA_HOME%\bin\java.exe")

@%JAVACMD% ^
  -classpath %WRAPPER_JAR% ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR:~0,-1%" ^
  "-Dmaven.home=%MAVEN_HOME%" ^
  %WRAPPER_LAUNCHER% %*
