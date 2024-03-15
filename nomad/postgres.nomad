job "postgres" {
  datacenters = ["dc1"]

  group "db" { 
    count = 1

    network {
      // mode = "bridge"
      port "db" {
        static = 5432
      }
    }

    // service {
    //   name = "postgres-service"
    //   port = "5432"

    //   connect {
    //     sidecar_service {}
    //   }
    // }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres:12.1"

        ports = ["db"]
      }

      env {
        POSTGRESS_USER = "me"
        POSTGRESS_PASSWORD = "secret"
      }

      resources {
        cpu    = 2000
        memory = 2000
      }
    }
  }
}