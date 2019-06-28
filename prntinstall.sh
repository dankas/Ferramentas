#!/bin/bash 
 
echo "   ********************************************************************* "
echo "   *********************************************************************  "
echo "   Script de instalação das impressoras do campus Pelotas.               "
echo "    - O padrão de compartilhamento é o [cpcxxxx]_[modelo da impressora]. "
echo "    - O compartilhamento pode ser conferido entrando no SGI.             " 
echo "                                                                         "
READ 
lpadmin -p $1 -E -v smb://sgi/$1 -m drv:///sample.drv/generic.ppd
