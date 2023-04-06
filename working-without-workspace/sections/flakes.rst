.. raw:: pdf

   PageBreak standardPage

Nix Flakes
==========

* Per project
* Uses ``nixpkgs`` to create a development shell
* Can create build artifacts (phar?)
* Could replace Docker and Docker Compose

.. raw:: pdf

   TextAnnotation "Creates a temporary shell with the requirements for that project."

flake.nix
=========

.. code-block:: nix
   :include: code/flake.nix
   :linenos:
