# Concept of Nixie

## Introduction

Welcome to a beginner-friendly introduction to Nixie, our approach to managing infrastructure. The goal of this documentation is to explain the three foundational concepts behind it and present a clear understanding of the benefits and drawbacks of using them together. Let's first dive into the concepts of netbooting, ephemeral environments, and declarative operating systems.

### Network Booting

Imagine turning on your computer and, instead of relying on its internal hard drive, it starts up via a network connection that delivers the operating system. [This is netbooting](https://networkboot.org/fundamentals/) — a technique that enables computers to download the operating system image from a remote server and boot into it, bypassing the need for local storage devices like hard drives or SSDs. This technology is also known as PXE (Preboot Execution Environment), or [iPXE](https://ipxe.org/), which is an open-source implementation of it.

The server can contain multiple different operating system images, such as different Linux flavors, and at the time of booting your computer, you can choose which one you want to boot into from a menu, just like demonstrated [here](https://netboot.xyz/docs/).

### Ephemeral Environments

When you netboot an operating system, the resulting system can be referred to as an [ephemeral](https://dictionary.cambridge.org/dictionary/english/ephemeral) environment. In computing, this means that the system operates completely in RAM and is there only momentarily, for as long as you keep the computer running. Any changes or files do not persist beyond the immediate session unless intentionally written on a disk. This concept is also the same as in live USB instances, which are meant for testing, repairing, and installing the persistent operating system.

### Declarative operating systems

Operating systems, that emphasize specifying *what* the system should be like, rather than *how* to achieve that state. They offer precise control over system configurations and software packages before the system is booted for the first time. This declarative approach ensures that systems can be replicated flawlessly across different machines and environments.

Although there are only a few such operating systems available, NixOS stands out as particularly popular. It utilizes the Nix package manager and Nix expressions to manage and deploy software in a declarative and reproducible manner. Encouraging the storage of NixOS configurations in Git represents a revolutionary way of enhancing collaboration and team workflows.

Learn more about NixOS at '[Introduction to Nix & NixOS](https://nixos-and-flakes.thiscute.world/introduction/)' or '[Zero to Nix](https://zero-to-nix.com/)'.

## The Big Picture

Combining the precision of NixOS with the agility of ephemeral netbootable images offers a powerful solution for modern infrastructure challenges. These pre-configured images are loaded directly into a machine's RAM from the network upon startup. With Nixie running locally, it's possible to pre-select the appropriate image for each specific machine, eliminating the need for interaction during boot time. This approach to infrastructure management offers significant benefits along with a few drawbacks.

### Advantages

- **Hardware Independence**: The need for local storage becomes redundant by default, reducing costs and maintenance. An upcoming feature will also allow the operating system to optimize itself to the hardware automatically, improving [homogeneity](https://dictionary.cambridge.org/dictionary/english/homogeneity).

- **Transparency and Workflow**: The declarative nature of NixOS configurations, combined with the ephemeral approach, significantly enhances collaboration among and within teams. It ensures that configurations are truly declarative and centralized, facilitating a seamless and efficient workflow.

- **Enhanced Security**: Centralizing the source of images makes it easier to manage updates and security patches, providing a uniform security posture across all machines.

- **Scalability and Adaptability**: The system allows for seamless network growth, with new machines booting from pre-configured images without ever needing individual installations. In the best case, you just have to start a new machine.

- **Performance**: With operations running directly in RAM and a reduction in I/O operations to local storage, the system benefits from faster data processing and reduced latency.

### Disadvantages

- **Dependency on Network**: Ephemeral environments rely heavily on robust network infrastructure. Any network instability or downtime directly impacts the ability to boot and use machines, potentially leading to productivity loss in critical moments. This can be fixed by having a fallback operating system for each machine, either traditionally installed or planted in a boot partition with [rEFInd](http://www.rodsbooks.com/refind/) as a boot manager. rEFInd is the preferable solution since it can boot the exact same images that are available from the netboot server.

- **Initial Setup Complexity**: Setting up the netbooting environment via Nixie and transitioning your old setups to a declarative OS can be complex and time-consuming. At a minimum, it requires an intermediate understanding of networking and the Nix language. We could try to lower this threshold with the productization of Nixie; see the '[product](./product.md)' documentation. The only solution at the moment is to learn Nix, find someone who has, or use existing tools for creating the configurations, like [HomestakerOS by Ponkila](https://github.com/ponkila/HomestakerOS).


## Conclusion

Nixie presents a compelling case for reimagining infrastructures as ephemeral and truly declarative environments. With it, individuals or organizations can achieve unparalleled scalability and efficiency in managing their infrastructure.

While challenges such as network dependency and setup complexity still exist, the potential benefits are significant. As we continue to refine and simplify the implementation process, Nixie is ready to revolutionize the way we think about and manage our computing resources.

For a deeper dive into more technical aspects, please give my upcoming 'Netbooting NixOS' blog post a read at [blog.coditon.com](https://blog.coditon.com/).
