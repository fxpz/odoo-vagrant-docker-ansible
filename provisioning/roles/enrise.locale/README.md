# enrise.locale

This is a simple Ansible role which will add locales to your system.

## Requirements

- Tested on Ansible 1.5
- Tested on Ubuntu 14.04 (trusty), but it should work on any modern Debian based system.

## Dependencies

None.

## Example playbook

This role is pretty simple, and it has only one variable.

    - hosts: all
      sudo: yes
      roles:
        - { role: enrise.locale, locale_enabled_locales: [nl_NL.UTF-8, en_US.UTF-8] }

## Licence

MIT

## Feedback? Found a bug? Requests?

Let us have it! http://github.com/Enrise/ansible-role-locale/issues
