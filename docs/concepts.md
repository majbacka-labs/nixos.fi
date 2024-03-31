
# Concepts of Nixie

## Introduction

Welcome to a beginner-friendly introduction to Nixie, our approach to managing infrastructure. The goal of this documentation is to explain the three foundational concepts behind it and to present the reasoning for the benefits and drawbacks discussed in the previous section. Let's dive into the concepts of netbooting, ephemeral environments, and declarative operating systems.

### Network Booting

Imagine turning on your computer and, instead of relying on its internal hard drive, it starts up via a network connection that delivers the operating system. [This is netbooting](https://networkboot.org/fundamentals/) — a technique that enables computers to download the operating system image from a remote server and boot into it, bypassing the need for local storage devices like hard drives or SSDs. This technology is also known as PXE (Preboot Execution Environment), or [iPXE](https://ipxe.org/), which is an open-source implementation of it.

The server can contain multiple operating system images, such as different Linux flavors, and at the time of booting, you can choose which one you want to boot into from a menu, just like demonstrated [here](https://netboot.xyz/docs/).

### Ephemeral Environments

When you netboot an operating system, the resulting system is referred to as an [ephemeral](https://dictionary.cambridge.org/dictionary/english/ephemeral) environment. In computing, this means that the system operates completely in RAM and exists only momentarily, for as long as you keep the computer running. Any changes or files do not persist beyond the immediate session unless intentionally saved to a disk. This concept is akin to live USB instances, which are meant for testing, repairing, and installing a persistent operating system.

### Declarative Operating Systems

Operating systems that emphasize specifying *what* the system should be like, rather than *how* to achieve that state. They offer precise control over system configurations and software packages before the system is booted for the first time. This declarative approach ensures that systems can be replicated flawlessly across different machines and environments.

Although there are only a few such operating systems available, NixOS stands out as particularly popular. It utilizes the Nix package manager and Nix expressions to manage and deploy software in a declarative and reproducible manner. Storing NixOS configurations in Git represents a revolutionary way of enhancing collaboration and team workflows.

Learn more about NixOS at '[Introduction to Nix & NixOS](https://nixos-and-flakes.thiscute.world/introduction/)' or '[Zero to Nix](https://zero-to-nix.com/)'.

## The Big Picture

Only when we combine the declarative nature of NixOS with an ephemeral environment can we say that we have a truly declarative system. What do I mean by "truly declarative"? Isn't NixOS already declarative enough? It's that NixOS still allows for long-term changes outside of its configuration if it has been installed on an internal hard drive. Our approach enforces a truly declarative system, as non-declarative changes won't persist to the next session.

By integrating these core concepts, we have a entity that ensures that systems are always in a known, predefined state at boot, eliminating drift and providing a secure, predictable environment.  In addition to that, we gain ability to deploy and manage environments quickly and efficiently, without the mandatory need for local storage.

What happens is that pre-configured images are loaded directly into a machine's RAM from the network upon startup, making local storage redundant by default. With Nixie running locally, it is also possible to pre-select the appropriate image for each specific machine, eliminating the need for interaction during boot time.

So, instead of going through the installing and configuration process of an operating system and needed software, the workflow goes something like this:

  1. Create/update a NixOS configuration and push it to Git.
  2. Add a menu entry to Nixie, if not already there.
  3. Boot the target machine.

Updating these machines can be as easy as repeating steps 1 and 3 if you have the "build requests" feature enabled.

