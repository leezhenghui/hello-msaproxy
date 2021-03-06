job "subsvc-ref-job" {
  region = "bj"
  datacenters = ["dc-dev-01"]
  type = "batch"
  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "subsvc-ref-group" {
    count = 1 

    task "subsvc-ref-task" {
			leader = true
      driver = "raw_exec"
			config {
				command = "/usr/bin/curl"
				args = ["-X", "PUT", "-H", "Content-Type: application/json", "-d", "{\"name\": \"sub-svc-ref\",\"id\": \"sub-svc-ref\",\"tags\": [\"proxy-ref\"],\"subress\": \"10.10.10.100\",\"port\": 80,\"enable_tag_override\": false}",  "http://localhost:8500/v1/agent/service/register"]
			}   
      resources {
        cpu    = 50 # 50 MHz
        memory = 10 # 10 MB
      }
    }
  }
}
