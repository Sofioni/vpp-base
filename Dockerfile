#ARG CONTRAIL_REGISTRY
#ARG CONTRAIL_CONTAINER_TAG
#FROM ${CONTRAIL_REGISTRY}/contrail-base:${CONTRAIL_CONTAINER_TAG}

FROM omermajeed/contrail-base:v1.0

RUN yum install -y libffi-devel libselinux-utils policycoreutils policycoreutils-python selinux-policy-base selinux-policy-targeted initscripts ethtool pciutils sudo contrail-vrouter-utils && \
    ldconfig

COPY *.sh ifup-* ifdown-* network-functions-vrouter* /
COPY license.txt /licenses/

#USER sofioni
MAINTAINER omer.majeed@sofioni.com
LABEL build-date=20190213
LABEL sofioni.tf-vpp.container.name=vpp-base
LABEL name=vpp-base \
      vendor="Sofioni" \
      version="1.0" \
      release="1" \
      summary="base container for TF-VPP" \
      description="other containers use it as base"
ENV NODE_TYPE=tf-vpp
LABEL sofioni.tf-vpp.pod=$NODE_TYPE
CMD ["/usr/bin/tail","-f","/dev/null"]
