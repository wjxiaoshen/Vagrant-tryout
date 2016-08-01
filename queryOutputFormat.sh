#!/bin/bash

CurrentTime=$(date)
Output=$(wget -O - http://checkip.dyndns.org/ | grep -Po '(?<=(<body>)).*(?=</body)')
echo "$CurrentTime | $Output" > /vagrant/outputFormat.txt
