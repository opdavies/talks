.. raw:: pdf

   PageBreak standardPage

Operating system
================

**Personal**:

- Linux
- NixOS
- KDE Plasma

|

**Work**:

- Windows 10
- WSL (Ubuntu)
- Nix package manager

.. raw:: pdf

    TextAnnotation "Started with Ubuntu for work, used Pop!_OS for personal laptops and now on NixOS."
    TextAnnotation "Used to use Apple/macOS and switched full-time to Linux a few years ago.used Homebrew for package management."
    TextAnnotation "Automated things with Ansible."
    TextAnnotation ""
    TextAnnotation "Use Windows for Office, Teams, etc. Development is done within the WSL/Linux environment."

Nix and NixOS
=============

- Declarative
- Reproducable
- Nix Packages collection (``nixpkgs``) has over 80,000 packages
- Easy to add to and edit, and contribute to

.. raw:: pdf

   TextAnnotation "Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so if a package works on one machine, it will also work on another."
   TextAnnotation "Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you’re using. "
   TextAnnotation "80,000 packages including Vim and tmux plugins, PHP and node packages"
   TextAnnotation "Configuration file-driven. You declare the end state rather than the steps to get there."
   TextAnnotation "Replaced Ansible for me."

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``nix-env -iA php82``

.. raw:: pdf

   PageBreak

.. class:: centredtitle

``nix-shell --packages php82``

.. raw:: pdf

   PageBreak

.. class:: centredtitle

``nix-shell --packages php82
--command "php -v"``

.. raw:: pdf

   PageBreak standardPage

configuration.nix
=================

.. code-block:: nix
   :include: code/configuration.nix
   :linenos:


hardware-configuration.nix
==========================

.. code-block:: nix
   :include: code/hardware-configuration.nix
   :linenos:

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``sudo nixos-rebuild build
--flake .#nixedo``

.. raw:: pdf

   PageBreak standardPage

dotfiles
========

* System configuration files
* Usually hidden, filenames start with a dot (``.zshrc``, ``.gitconfig``, ``.config/``)
* Maintained on GitHub since July 2015
* https://opdavi.es/dotfiles
* Managed with Home Manager

.. raw:: pdf

    TextAnnotation "Similar to hidden files within projects like .gitignore."
    TextAnnotation "Manages user configuration instead of system configuration."
    TextAnnotation ""
    TextAnnotation "Used with NixOS and the Nix package manager in WSL."

home-manager/home.nix
=====================

.. code-block:: nix
    :include: code/home-manager.nix
    :linenos:

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``home-manager build
-f home-manager/home.nix
--flake .#wsl2``

.. raw:: pdf

   PageBreak standardPage
