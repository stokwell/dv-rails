job "dv-rails" {
  datacenters = ["dc1"]

  // A collection of task to be co-located on the same node.
  // Shares volume mount and networking
  group "web" {
    count = 3
    // network {
    //   port "ingress" {
    //     static = 80
    //     to = 3000
    //   }
    // }

    // restart {
    //   interval = "1m"
    //   attempts = 3
    //   delay = "24h"
    //   mode = "fail"
    // }

    // task "dbmigrate" {
         // prestart - run before main task 
         // sidecar - run once or keep running 
    //   lifecycle {
    //     hook = "prestart"
    //     sidecar = false
    //   }

    //   driver = "docker"

    //   config {
    //     image = "stokwell/dv-rails:latest"
    //     command = "bash"
    //     args    = ["-c", "bundle exec rake db:migrate"]
    //   }
    // }
    //} 

    // tast "init" {
    //   lifecycle {
    //     hook = "prestart"
    //    }
    // ... task ...
    // }

    // tast "logging" {
    //   lifecycle {
    //     hook = "prestart"
    //     sidecar = true
    //    }
    // ... task ...
    // }

    // Any task without lifecycle stanza is the main task
    task "server" {
      driver = "docker"

      config {
        image = "stokwell/dv:3.0"
        command = "sh"
        args    = ["-c", "bundle exec puma"]
      }

      env {
        POSTGRESS_USER = "me"
        POSTGRESS_PASSWORD = "secret"
      }

      // overrides restart default restart group stanza
      restart {
        attempts = 1
      }

      resources {
        cpu    = 2000
        memory = 2000
      }

      // if task fails, then reschedule stanza is used. 
      // Nomad prefers to replace onto unused node
      // reschedule {
      //   attempts = 10
      //   interval = "30m"
      //   delay = "30s"
      //   delay_function = "exponential"
      //   max_delay = "120s"
      //   unlimited = false
      // }
    }
  }
}
