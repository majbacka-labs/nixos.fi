
# 🌐 Nixie on nixos.fi

> ⚠️ **This is informative repository only, the actual project is closed source**

Welcome to the forefront of infrastructure management with Nixie — your gateway to revolutionizing how you deploy, manage, and interact with your declarative infrastructure made with NixOS.

At the moment, in its simplicity, Nixie is a NixOS module that significantly simplifies the process of setting up and managing a network-based boot environment, while introducing a completely new approach to handling the deployment of your systems, making NixOS **truly declarative**.

In addition, you can imagine Nixie as a foundation on which we can build interfaces, potentially enabling inspection and management of the entire infrastructure from a single point, or even applications leveraging software running on your own infrastructure.

Dive into an ecosystem designed for core teams and developers alike, where efficiency and manageability are not just goals but guarantees.

## 📋 Overview

These servers, as part of the Nixie project, are already using the `nixie` module from our Nixie project:

| Hostname | Architecture | Format | Address | Details |
| :---:    |  :---:       | :---:  | :---:   | :---    |
| [hyperion](https://github.com/tupakkatapa/nix-config/blob/main/nixosConfigurations/hyperion/nixie.nix) | x86-64 | kexecTree | private | Router, dev's live setup |
| ~~boot~~ | ~~x86-64~~ | ~~kexecTree~~ | ~~core~~ | ~~boot.nixos.fi~~ | Public instance (TODO) |

They offer iPXE menus and netboot images with pre-determined contents. The project provides a semi-automatic setup for a well-thought-out, feature-rich netboot server, which makes it possible to boot NixOS configurations **directly from flakes**. Stored in Git, flakes offer a way to declare and manage system configurations in a reproducible and modular manner.

## 🤔 Why Nixie?

### Advantages

- **Hardware Independence**: Reduces costs and maintenance by making local storage redundant by default.
- **Transparency and Workflow**: Enhances collaboration with declarative, centralized configurations.
- **Enhanced Security**: Simplifies updates and patches management.
- **Scalability and Adaptability**: Facilitates seamless network growth.
- **Performance**: Benefits from operations running directly in RAM and reduced local storage I/O.

### Disadvantages

- **Dependency on Network**: Relies on robust network infrastructure.
- **Initial Setup Complexity**: Requires an understanding of networking and the Nix language.

## 🌎 Real-World Applications

- **Blockchain Infrastructure Management**: Deploy and manage consistent blockchain nodes with ease.
- **High-Performance Computing (HPC) Clusters**: Scale and integrate computing resources on-the-fly.
- **Software Development and Testing Environments**: Bridge the gap between development and production.
- **Educational Laboratories and Workshops**: Standardize setups for educational labs and workshops.
- **Secure and Manageable Kiosk Systems**: Deploy secure, manageable kiosk systems in public spaces.

## 🔍 Looking Ahead

For those interested in the details, let's dive into the documentation from here.

- [1. 📚 Applications](./docs/applications.md)

  Diverse applications of Nixie, including blockchain, high-performance computing, and more.

- [2. 💡 Concepts](./docs/concepts.md)

  Foundational concepts behind Nixie, such as netbooting, ephemeral environments, and declarative operating systems.

- [3. 📖 Details](./docs/details.md)

  Technical details of Nixie, featuring project scope, configuration examples, and features.

- [4. 🚀 Productization](./docs/product.md)

  Current and potential future user experiences for managing infrastructure with Nixie.

