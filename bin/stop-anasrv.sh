#!/bin/bash

# ĉar tiu skripto estas ankaŭ lanĉata de radiko (root)
# kiel servo, necesas iom da manipulado por eltrovi
# la uzanton (ordinare revo aŭ revo-test)

# eltrovu uzanto-nomon kaj PID-dosieron
script=$(readlink -f "$BASH_SOURCE")
base=$(dirname "$script")

suffix=${base#/home/}
user=${suffix%%/*}

pidfile=/var/lock/swi.akrido.${user}

/sbin/start-stop-daemon --stop --retry=TERM/30/KILL/5 --pidfile $pidfile --name swipl
