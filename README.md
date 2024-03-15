<<<<<<< HEAD
https://docs.docker.com/build/building/multi-stage/
=======
## CI/CD

### Build production image of dv-rails (locally)

```docker build --target production -t stokwell/dv-rails:latest . ```

```docker run --env SECRET_KEY_BASE=secret -it -p 3000:3000 stokwell/dv:latest rails s```

### Containerisation

[Docker Rails Best Practicies](https://lipanski.com/posts/dockerfile-ruby-best-practices#dockerfile-for-a-rails-app-with-assets-and-private-dependencies) (Article)

[Least Privilege Container Builds with Kaniko on GitLab](https://www.youtube.com/watch?v=d96ybcELpFs&ab_channel=GitLabUnfiltered) (YouTube)

[Build Container Image - Feat. Carvel kbld, Buildpacks, and Lima (You Choose!, Ch. 1, Ep. 1)](https://www.youtube.com/watch?v=GDInFocQJTU&ab_channel=DevOpsToolkit) (YouTube)

### Image vulnerability scanning

[Scan Container Images with Clair V4 in CI/CD Pipeline](https://www.youtube.com/watch?v=fjlEGF4qyQ0&ab_channel=mkdev) (YouTube)

[Clair V4 installation guide for test purpose](https://quay.github.io/clair/howto/testing.html) (Repo)

### Application templating with Nomad Pack

[Nomad Pack and Templating](https://www.youtube.com/watch?v=5R8N2p4XSWs&ab_channel=HashiCorp) (YouTube)

## Nomad

### Talks

[Nomad: Past, Present, and Future](https://www.youtube.com/watch?v=JCwgvMXRCQg&ab_channel=HashiCorp) (YouTube)

[Nomad: Past, Present, and Future 2](https://www.youtube.com/watch?v=MbAXksROlv4&ab_channel=HashiCorp) (YouTube)

[How Nomad 1.3 Enables Running Work at the Edge](https://www.youtube.com/watch?v=Khcbr8zkp_Q&t=258s&ab_channel=HashiCorp) (YouTube)

### Tutorials

[Nomad at the Edge](https://www.youtube.com/watch?v=59z7gjNSUvs&ab_channel=HashiCorp) (YouTube)

[HashiCorp Nomad A Simpler Way to Orchestrate Your Containers](https://www.youtube.com/watch?v=BaRqLIaTfZU&ab_channel=HashiCorp) (YouTube)

[Nomad Networking Demystified](https://www.youtube.com/watch?v=s1Py5RD9bZo&list=LL&index=1&ab_channel=HashiCorp) (YouTube)

[Nomad - The Hard Way](https://www.youtube.com/watch?v=31rvngI7vUk&t=1623s&ab_channel=HashiCorp) (YouTube)

[Nomad CI/CD Developer Workflows and Integrations with GitLab (YouTube)](https://www.youtube.com/watch?v=jpTFZNFHz1o&t=948s&ab_channel=HashiCorp) (YouTube)

[Replacing Queues with Nomad Dispatch](https://www.hashicorp.com/blog/replacing-queues-with-nomad-dispatch) (Article)

[Building Immutable Server Images with SaltStack and Packer](https://www.jamesridgway.co.uk/building-immutable-server-images-with-saltstack-and-packer/) (Article)

[Nomad Task Driver for containerd](https://www.youtube.com/watch?v=DTdMjTgR3kg&ab_channel=HashiCorp) (YouTube)

### Start nomad in development mode localy 

install nomad

run ```nomad agent -dev -bind 0.0.0.0 -log-level INFO```

### Start nomad localy using Vargant for development

...

### Deploy Nomad Cluster with Terraform on AWS

[Complete Terraform Course](https://www.youtube.com/watch?v=7xngnjfIlK4&ab_channel=DevOpsDirective) (YouTube)

[Terraform Modules for Nomad Deployment](https://registry.terraform.io/modules/hashicorp/nomad/aws/latest) (Repo)

## Packer 

TBD

### Tutorials 

[Deploying Machines with MaaS and Packer - Metal as a Service + Hashicorp Packer Tutorial](https://www.youtube.com/watch?v=lEqD3mRcqSo&list=WL&index=6&t=144s&ab_channel=TechnoTim) (YouTube)

## Consul 

[Getting into HashiCorp Consul (Course)](https://www.youtube.com/watch?v=0H06VKvlTJQ&list=PL81sUbsFNc5b8i2g2sB_tG-PuZxEdlDpK&ab_channel=HashiCorp) (YouTube)
 
install consul with homebrew ```brew install consul```

verify installation ```consul version```

run ```consul agent -dev```

## Traefic 

[Traefik Blog Repositories](https://github.com/traefik-tech-blog) (Repo)

[Workshop: Advanced Load Balancing with Traefik 2.5](https://www.youtube.com/watch?v=eUlAS-FdELg&ab_channel=TraefikLabs) (YouTube)

[Simplifying Infrastructure and Network Automation with HashiCorp and Traefik](https://www.youtube.com/watch?v=7VtZEZAi6qU&ab_channel=TraefikLabs) (YouTube)

## OpenTelemetry

[OpenTelemetry: The Vision, Reality, and How to Get Started - Dotan Horovits, Logz.io](https://www.youtube.com/watch?v=qE1ggEmvz2Y&ab_channel=CNCF%5BCloudNativeComputingFoundation%5D) (YouTube)

## Usefull links and literature

[The Best DevOps Tools, Platforms, And Services In 2023?](https://www.youtube.com/watch?v=-zKYT2I_WhE&t=41s&ab_channel=DevOpsToolkit) (YouTube)

[DevOps is dead. Embrace platform engineering](https://www.youtube.com/watch?v=F8xXXVoLqoo&ab_channel=CNCF%5BCloudNativeComputingFoundation%5D) (YouTube)

[WHAT IS THE CORRECT WAY TO SET UP PUMA, RAILS AND NGINX WITH DOCKER?](https://www.appsloveworld.com/docker/100/23/what-is-the-correct-way-to-set-up-puma-rails-and-nginx-with-docker) (Article)

[Process vs Thread](https://www.youtube.com/watch?v=4rLW7zg21gI&ab_channel=ByteByteGo) (YouTube)

[How we migrated application servers from Unicorn to Puma](https://about.gitlab.com/blog/2020/07/08/migrating-to-puma-on-gitlab/) (Article)

[Git Workflows for Platform Engineers](https://www.youtube.com/watch?v=c8mw636b3ek&ab_channel=AllThingsOpen) (YouTube)

[ImmutableServer](https://martinfowler.com/bliki/ImmutableServer.html) (Article)

## Books 

[Infrastructure as Code](https://dl.ebooksworld.ir/books/Infrastructure.as.Code.2nd.Edition.Kief.Morris.OReilly.9781098114671.EBooksWorld.ir.pdf) (PDF)

[Practical Cloud Security: A Guide for Secure Design and Deployment](https://www.amazon.com/Practical-Cloud-Security-Secure-Deployment/dp/1492037516/) (Amazon)

[Multi-Cloud Architecture and Governance](https://www.oreilly.com/library/view/multi-cloud-architecture-and/9781800203198) (O'reilly)

## Something more to think about

[Is eBPF The End Of Kubernetes Sidecar Containers?](https://www.youtube.com/watch?v=7ZVQSg9HX68&ab_channel=DevOpsToolkit) (YouTube)

[Андрей Девяткин — Почему я советую людям не учить Ansible](https://www.youtube.com/watch?v=vTLHuyYAswo&ab_channel=DevOops) (YouTube)

[What Are Microservices Really All About? (And When Not To Use It)](https://www.youtube.com/watch?v=lTAcCNbJ7KE&ab_channel=ByteByteGo) (YouTube)

[Microservices explained - the What, Why and How?](https://www.youtube.com/watch?v=rv4LlmLmVWk&ab_channel=TechWorldwithNana) (YouTube)

[Non-Technical Challenges of Platform Engineering](https://www.youtube.com/watch?v=m6nlREbQ6LQ&t=665s&ab_channel=HashiCorp) (YouTube)

[Distributed Flexibility: Nomad and Vault in a Post-Kubernetes World](https://www.youtube.com/watch?v=U1zn5OO8dHs&ab_channel=HashiCorp)  (YouTube)

[You want a real DNS Server at home? (bind9 + docker)](https://www.youtube.com/watch?v=syzwLwE3Xq4&t=1432s&ab_channel=ChristianLempa) (YouTube)
>>>>>>> ba3e0e6 (Squashed commit)
