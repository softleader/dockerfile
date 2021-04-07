# [Deprecated] openjdk18-openshift

請改使用 [`../azul-zulu`](../azul-zulu) 或 [`../adopt-openjdk`](../adopt-openjdk) 下的 Base Image

```
docker pull softleader/openjdk18-openshift
```

## Example of JIB Build

在 `build.gradle` 加上:

```
plugins {
	...
    id 'com.google.cloud.tools.jib' version '1.0.2'
}

...gradle

jib {
	from {
		image = 'softleader/openjdk18-openshift'
	}
	to {
		image = 'chinalife/my-image'
		tags = [System.nanoTime(), 'latest']
	}
	container {
		jvmFlags = ['-Xms512m', '-Xmx512m', '-Dspring.profiles.active=docker', '-Djava.security.egd=file:/dev/./urandom -jar']
		useCurrentTimestamp = true
		appRoot = "/home/jboss"
		ports = ['8080']
	}
}
```

然後執行:

```sh
# Builds to a container image registry.
$ gradle jib

# Builds to a Docker daemon.
$ gradle jibDockerBuild
```

> [More details about GoogleContainerTools/jib](https://github.com/GoogleContainerTools/jib/tree/master/jib-gradle-plugin)
