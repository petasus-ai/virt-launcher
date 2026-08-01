# virt-launcher (retired)

`quay.io/edgestack/virt-launcher-mod` is no longer produced. The last tag is `v1.8.4`.

This repository overlaid firmware built from edk2 source onto the upstream KubeVirt launcher,
because at the time the CentOS Stream 9 base carried an older edk2 than the overlay.

That is no longer true. The overlay shipped `ovmf-240524` = `edk2-stable202405`; the CS9 launcher
base ships `edk2-aarch64-20241117-8.el9` = [`edk2-stable202411`][edk2], so the overlay moved guest
firmware backwards on both architectures. KubeVirt v1.9.0 builds its CS10 variant against
`edk2 20260221-3.el10`.

Use `quay.io/edgestack/virt-launcher`, built from
[`petasus-ai/kubevirt`](https://github.com/petasus-ai/kubevirt) alongside the rest of the control
plane. edgespray points `VIRT_LAUNCHER_IMAGE` at it via `kubevirt_launcher_image_repo`.

[edk2]: https://github.com/tianocore/edk2/releases/tag/edk2-stable202411
