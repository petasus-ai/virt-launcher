FROM quay.io/kubevirt/virt-launcher:v1.4.0

# Copy all files from your local "ovmf" directory into the container path
COPY ovmf-250409/ /usr/share/edk2/ovmf

# Set the container’s entrypoint to run virt-launcher
ENTRYPOINT ["/usr/bin/virt-launcher"]
