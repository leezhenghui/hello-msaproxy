## Introduction

The purpose of this repository aims to provide a hands-on architecture PoC(proof-of-concept) sample that demonstrate how to **build** and **run** a `microservices architecture`(MSA) application(multiple programming languages) with the capabilities of service registry, naming resolution, client service disovery, client load balance, traffic shapping, failure tolerance, etc. 

## PoC Scenario 

The sample contains Java and Node.js modules. In reality, the RPC framework usually are programming language specific, so the challenge for us is how to enable a MSA application with mixed-languages. This sample will show you the approach of proxy pattern.

### Overview

![PoC Scenario Overview](./docs/architecture-msaproxy-components.png)

### Run the Sample 

#### Steps

- Git clone the project

	On host:
  ```
  git clone git@github.com:leezhenghui/hello-msaproxy.git
  ```

- Gradle build/deploy distribution
  
	On host:
	```
  gradle deploy 
  ```

- Launch VM 
  
	On host:
	```
	cd ops
	vagrant up
  ```

- Provision the VM 
  
	On host:
	```
	vagrant provision 
  ```

- Start all nomad jobs 

  For each services, two intances will be created for a load balance, service discovery testing
  
	On host:

	```
  vagrant ssh
  ```

	In VM
	```
	cd /vagrant/bin
	./start_all_jobs.sh
	```

- Run the sample 

  In VM:

	```
	./click.sh
  ```

- Run benchmark 

  In VM:

	```
	./benchmark.sh
  ```

#### Result of Service Discovery and Load Balance

![loadbalance-result](./docs/loadbalance-result.png)
