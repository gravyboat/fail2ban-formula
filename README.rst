fail2ban
========

Install and configure fail2ban and start the service.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.


Available states
================

.. contents::
    :local:

``fail2ban``
------------

Install the ``fail2ban`` package and enable the service.

``fail2ban.config``
-------------------

Manage the fail2ban configuration file.

Example Pillar:

.. code:: yaml

    fail2ban:
      config:
        name: /etc/fail2ban/jail.local
        source: salt://fail2ban/files/jail.local
        user: root
        group: root
        mode: 644
