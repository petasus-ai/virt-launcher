FROM quay.io/kubevirt/virt-launcher:v1.8.1

ARG TARGETARCH
ENV ARCH=${TARGETARCH:-amd64}

# Copy both architecture-specific folders into temporary locations.
# In your source, organize the files as:
COPY ovmf-240524/${ARCH}/ /tmp/${ARCH}/

# Based on the current architecture, copy the proper files to the correct destination.
# For amd64 (x86) use "/usr/share/edk2/ovmf"
# For arm64 use "/usr/share/edk2/aarch64"
RUN if [ "$ARCH" = "amd64" ]; then \
        cp -a /tmp/amd64/. /usr/share/edk2/ovmf/; \
    elif [ "$ARCH" = "arm64" ]; then \
        cp -a /tmp/arm64/. /usr/share/edk2/aarch64/; \
    else \
        echo "Unknown architecture: $ARCH" && exit 1; \
    fi

# Optionally, you may remove the temporary directory to keep your image clean:
RUN rm -rf /tmp/${ARCH}/

# Copy all files from your local "ovmf" directory into the container path
# COPY ovmf-250409/${ARCH}/ /usr/share/edk2/ovmf

# Set the container’s entrypoint to run virt-launcher
ENTRYPOINT ["/usr/bin/virt-launcher"]
