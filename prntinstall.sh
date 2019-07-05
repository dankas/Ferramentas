#!/bin/bash 
	clear
echo "   ********************************************************************* "
echo "  	                                                                   
               ___                                                  
              / (_)                                                 
             |      __   _  _  _     _          __   __   _  _  _   
             |     /  \_/ |/ |/ |  |/ \_|   |  /    /  \_/ |/ |/ |  
              \___/\__/   |  |  |_/|__/  \_/|_/\___/\__/   |  |  |_/
                                  /|                                
                                  \|  
																	       
																		   "
echo "   ********************************************************************* "
echo "   Script de instalação das impressoras do campus Pelotas.               "
echo "    - O padrão de compartilhamento é o [cpcxxxx]_[modelo da impressora]. "
echo "    - O compartilhamento pode ser conferido entrando no SGI.             " 
echo "    - Em caso de erro 'Bad device-uri' instale o smbclient (apt install smbclient)." 
echo "    - O modelo da impressora está disponivel no CPCLISTA ou pode ser visto
			  na própria impressora."

	INDEX_MODELO_IMPRESSORA=-1
	CPC_IMPRESSORA="cpcxxxx"
	MODELO_IMPRESSORA=([1]="MPC300" [2]="SPC431" [3]="MP201" [4]="SP4510SF" [5]="MPCW2200" [6]="MPC401" [7]="MPC2003")
	echo $INDEX_MODELO_IMPRESSORA
	echo $CPC_IMPRESSORA
	echo ${MODELO_IMPRESSORA[1]}
	while :
		do
			if [[ $INDEX_MODELO_IMPRESSORA -lt 8 && $INDEX_MODELO_IMPRESSORA -gt 0 ]]
				then
					break;
			fi
			echo " 	Entre com o numero relacionado ao modelo da impressora/multifuncional: "
			echo "		1 - MPC 300sr."
			echo "		2 - SP  431."
			echo "		3 - MP  201."
			echo "		4 - SP  4510."
			echo "		5 - MPC 2200w."
			echo "		6 - MPC 401."
			echo "		7 - MPC 2003"

			read INDEX_MODELO_IMPRESSORA;
			#validar()

		done
echo ${MODELO_IMPRESSORA[$INDEX_MODELO_IMPRESSORA]}
echo "	Entre com o CPC da impressora/multifuncional:"
read CPC_IMPRESSORA
COMPARTILHAMENTO=${CPC_IMPRESSORA}_${MODELO_IMPRESSORA[$INDEX_MODELO_IMPRESSORA]}
echo $COMPARTILHAMENTO

	lpadmin -p $COMPARTILHAMENTO -E -v smb://sgi/$COMPARTILHAMENTO -m drv:///sample.drv/generic.ppd
