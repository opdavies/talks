.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

Z Shell

.. raw:: pdf

   PageBreak standardPage

Why zsh?
========

* Replacement for the ``bash`` shell
* Default on macOS
* Separate to "oh-my-zsh"
* OMZSH plugins and themes can be installed using ``zplug``
* Aliases
* Globbing and expanding

Aliases
=======

.. code-block:: bash
   :linenos:
   :include: code/aliases.sh

.. raw:: pdf

   TextAnnotation "Can be used to override default behaviour or to add new commands and shortcuts."

Globbing and expanding
======================

Changing a file prefix:

``mv index.{html,twig}``

``mv index.html index.twig``

|

Creating two files with different prefixes:

``touch my-component.{config.yml,twig}``

|

Creating a range of files:

``touch {1..10}.php``

Auto-expanding
==============

.. code-block:: bash
   :linenos:

   expand-alias-space() {
     [[ $LBUFFER =~ "\<(''${(j:|:)baliases})\$" ]]; insertBlank=$?
     if [[ ! $LBUFFER =~ "\<(''${(j:|:)ialiases})\$" ]]; then
       zle _expand_alias
     fi

     zle self-insert

     if [[ "$insertBlank" = "0" ]]; then
       zle backward-delete-char
     fi
   }

   zle -N expand-alias-space

   bindkey " " expand-alias-space

.. raw:: pdf

   TextAnnotation "More like snippets than aliases."
