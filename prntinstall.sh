#!/bin/bash 
 
echo   *********************************************************************
echo   	 
echo    _____                                                         
echo   /  __ \                                                        
echo   | /  \/  ___   _ __ ___   _ __   _   _   ___   ___   _ __ ___  
echo   | |     / _ \ | '_ ` _ \ | '_ \ | | | | / __| / _ \ | '_ ` _ \ 
echo   | \__/\| (_) || | | | | || |_) || |_| || (__ | (_) || | | | | |
echo    \____/ \___/ |_| |_| |_|| .__/  \__,_| \___| \___/ |_| |_| |_|
echo                            | |                                   
echo                            |_|                                   
echo   
echo   *********************************************************************
echo     Script de instalação das impressoras do campus Pelotas.
echo     - O padrão de compartilhamento é o [cpcxxxx]_[modelo da impressora].
echo     - O compartilhamento pode ser conferido entrando no SGI.
echo     
READ 
lpadmin -p $1 -E -v smb://sgi/$1 -m drv:///sample.drv/generic.ppd
