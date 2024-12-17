####################################
Opinionated Vim plugin for DepoXy 🤙
####################################

About This Plugin
=================

This plugin configures other Vim plugins specifically for the
DepoXy Ambers development environment.

Mostly it creates map commands and sets global variables.

Consider all the config in this plugin to be *highly* opinionated.

- Learn more about DepoXy here:

  https://github.com/DepoXy/depoxy 🍯

Configures FZF
==============

When ``vim-depoxy`` is installed by DepoXy, it performs the following steps:

- Installs author's FZF command, forked from https://github.com/junegunn/fzf:

  https://github.com/landonb/fzf

- Installs the ``junegunn/fzf`` plugin:

  https://github.com/junegunn/fzf.vim

- And creates a symlink to the Go wrapper:

  ``plugin/fzf.vim -> ~/.kit/go/fzf/plugin/fzf.vim``

.. |fzf-config.vim| replace:: ``plugin/fzf-config.vim``
.. _fzf-config.vim: https://github.com/DepoXy/vim-depoxy/blob/release/plugin/fzf-config.vim

- See the config file for the available commands:

  |fzf-config.vim|_

Configures NERD Commenter
=========================

- Configures NERDCommenter:

  https://github.com/preservim/nerdcommenter

.. |nerdcommenter-config.vim| replace:: ``plugin/nerdcommenter-config.vim``
.. _nerdcommenter-config.vim: https://github.com/DepoXy/vim-depoxy/blob/release/plugin/nerdcommenter-config.vim

- See the config file for the available commands:

  |nerdcommenter-config.vim|_

Configures Async Map
====================

- Configures ``vim-async-map``

  https://github.com/embrace-vim/vim-async-map જ⁀➴

===========================  ============================  ==============================================================================
 Key Mapping                  Description                   Notes
===========================  ============================  ==============================================================================
 ``gf``                       Open file under cursor        When in insert mode, ``gf`` opens the file path under the cursor,
                              or selected                   or when text is selected, opens the file path for editing.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``gW``                       Open URL under cursor         When in insert mode, ``gW`` opens the URL under the cursor,
                              or selected                   or when text is selected, opens the text as a URL in the browser.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``3t``                       Insert today's date           Insert #-delimited reST header titled with time, e.g.,::

			                                                        ################
			                                                        YYYY-MM-DD HH-MM
			                                                        ################

			                                                      Because implemented using async mode mapper,
			                                                      completes immediately upon typing `3t`, if
			                                                      you type both characters within 100 msec.

===========================  ============================  ==============================================================================

.. |vim-async-map-config--gf-gW-3t.vim| replace:: ``plugin/vim-async-map-config--gf-gW-3t.vim``
.. _vim-async-map-config--gf-gW-3t.vim: https://github.com/DepoXy/vim-depoxy/blob/release/plugin/vim-async-map-config--gf-gW-3t.vim

- See the config file for more details:

  |vim-async-map-config--gf-gW-3t.vim|_

Installation
============

This plugin is installed by DepoXy.

