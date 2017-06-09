include env_make
NS = garland
#VERSION ?= latest

REPO_BASENAME = docker-jnlp-slave-k8s

#
# all
#
build-allinone:
	$(call build_docker_container,./allinone/Dockerfile,allinone,$(VERSION_ALLINONE))

push-allinone:
	$(call push_docker_container,allinone,$(VERSION_ALLINONE))

#
# gradle
#
build-gradle:
	$(call build_docker_container,./gradle/Dockerfile,gradle,$(VERSION_GRADLE))

push-gradle:
	$(call push_docker_container,gradle,$(VERSION_GRADLE))


#
# Docker build def
#
define build_docker_container
		#
		# Builds a container
		#
		# $(1) - Dockerfile location
		# $(2) - container name postfix
		# $(3) - docker tag
		#
    docker build -f $(1) -t $(NS)/$(REPO_BASENAME):$(2)-$(3) .
endef

#
# Docker push def
#
define push_docker_container
		#
		# Push a container to the registry
		#
		# $(1) - container name postfix
		# $(2) - docker tag
		#
    docker push $(NS)/$(REPO_BASENAME):$(1)-$(2)
endef
