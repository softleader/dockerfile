# dockerfile

SoftLeader dockerfiles

## script

 */script* 提供了 batch script & shell script 來重新 deploy docker image & run container, 可以透過 `exec-maven-plugin` maven plugin 來執行:

 ```xml
<project>
	
	<properties>
		<docker.username>...</docker.username>
		<docker.password>...</docker.password>
	</properties>

	<build>
		<plugins>
			<plugin>
				<groupId>org.codehaus.mojo</groupId>
				<artifactId>exec-maven-plugin</artifactId>
				<version>1.6.0</version>
				<executions>
					<execution>
						<goals>
							<goal>exec</goal>
						</goals>
					</execution>
				</executions>
				<configuration>
					<executable>${basedir}/docker-deploy.${script.extension}</executable>
					<arguments>
						<!-- 這邊順序是跟 script 綁定的, 如果調整了請記得調整 script -->
						<argument>${docker.username}</argument> <!-- docker hub 登入的 username -->
						<argument>${docker.password}</argument> <!-- docker hub 登入的 password -->
						<argument>${project.artifactId}</argument> <!-- docker image & container 名稱 -->
						<argument>-p 8000:8000 --hostname ${project.artifactId}</argument> <!-- docker run 的更多參數 -->
					</arguments>
				</configuration>
			</plugin>
		</plugins>
	</build>

	<profiles>
		<profile>
			<id>Windows</id>
			<activation>
				<os>
					<family>Windows</family>
				</os>
			</activation>
			<properties>
				<script.extension>bat</script.extension>
			</properties>
		</profile>
		<profile>
			<id>unix</id>
			<activation>
				<os>
					<family>unix</family>
				</os>
			</activation>
			<properties>
				<script.extension>sh</script.extension>
			</properties>
		</profile>
	</profiles>
</project>
 ```

最後執行:

```
$ mvn clean package exec:exec
```