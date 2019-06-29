#!/bin/bash 
echo "   ********************************************************************* "
echo "  	                                                                   "
echo "   _____                                                                 " 
echo "  /  __ \                                                                "
echo "  | /  \/  ___   _ __ ___   _ __   _   _   ___   ___   _ __ ___          "
echo "  | |     / _ \ | '_ ` _ \ | '_ \ | | | | / __| / _ \ | '_ ` _ \         "
echo "  | \__/\| (_) || | | | | || |_) || |_| || (__ | (_) || | | | | |        " 
echo "   \____/ \___/ |_| |_| |_|| .__/  \__,_| \___| \___/ |_| |_| |_|        "
echo "                           | |                                           "
echo "                           |_|                                           "
echo "                                                                         "
echo "  *********************************************************************  "
echo "   ********************************************************************* "
echo "   Script de instalação das impressoras do campus Pelotas.               "
echo "    - O padrão de compartilhamento é o [cpcxxxx]_[modelo da impressora]. "
echo "    - O compartilhamento pode ser conferido entrando no SGI.             " 
echo "                                                                         "
	Modelo=7
	while [Modelo -eq 7 -or modelo -lt 1];
		do
		echo"Entre com o numero relacionado ao modelo da impressora:
					1	-MPC 300sr.
					2	-MPC401.
					3	-Sp 431.
					4	-4510.
					5	-MPc2200w.
					6	-Mp 201."
		read Modelo
		done



	lpadmin -p $1 -E -v smb://sgi/$1 -m drv:///sample.drv/generic.ppd
