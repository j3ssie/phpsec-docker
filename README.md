## phpsec-docker

Docker container for PHP Security scan with [phpcs-security-audit](https://github.com/FloeDesignTechnologies/phpcs-security-audit)

## Running

```shell
# /path/to/project
docker run -t -v /path/to/project:/opt/src/ j3ssie/phpcs-docker:latest --report=json

# or run with current folder
docker run -t -v `pwd`:/opt/src/ j3ssie/phpcs-docker:latest --report=json
```
