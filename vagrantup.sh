#!/bin/bash
export VAGRANT_DEFAULT_PROVIDER='docker'
vagrant up pgsqlmaster
vagrant up pgsqlslave
vagrant up webserver
