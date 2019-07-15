#!/bin/bash 
	clear
echo -e " \e[01;37m  ********************************************************************* \e[00m"
echo -e " \e[01;37m 	                                                                   
               ___                                                  
              / (_)                                                 
             |      __   _  _  _     _          __   __   _  _  _   
             |     /  \_/ |/ |/ |  |/ \_|   |  /    /  \_/ |/ |/ |  
              \___/\__/   |  |  |_/|__/  \_/|_/\___/\__/   |  |  |_/
                                  /|                                
                                  \|  
																	       
  \e[00m"
echo -e "\e[01;37m   ********************************************************************* \e[00m"
echo -e "   \e[01;37mScript de instalação das impressoras do campus Pelotas\e[00m.               "
echo "    - O padrão de compartilhamento é o [cpcxxxx]_[modelo da impressora]. "
echo "    - O compartilhamento pode ser conferido entrando no SGI.             " 
echo "    - Em caso de erro 'Bad device-uri' instale o smbclient (apt install smbclient)." 
echo "    - O modelo da impressora está disponivel no CPCLISTA ou pode ser visto
			  na própria impressora."
	
	INDEX_MODELO_IMPRESSORA=-1
	CPC_IMPRESSORA="cpcxxxx"
	MODELO_IMPRESSORA=([1]="MPC300" [2]="SPC431" [3]="MP201" [4]="SP4510SF" [5]="MPCW2200" [6]="MPC401" [7]="MPC2003")
	
	#O usuário entra com o índice de um ARRAY que possui o nome correto do compartilhamento de cada modelo de impressora
	#Preferi fazer desta forma para minimizar possíveis erros de digitação dos usuários
	#Enquanto o usuário não entrar com uma opção dentro do "RANGE" o loop fica repetindo o pedido de opção correta.
	while :
		do
			if [[ $INDEX_MODELO_IMPRESSORA -lt 8 && $INDEX_MODELO_IMPRESSORA -gt 0 ]]
				then
					break;
			fi
			echo -e " 	\e[01;37mEntre com o numero relacionado ao modelo da impressora/multifuncional:\e[00m "
			echo "		1 - MPC 300sr."
			echo "		2 - SP  431."
			echo "		3 - MP  201."
			echo "		4 - SP  4510."
			echo "		5 - MPC 2200w."
			echo "		6 - MPC 401."
			echo "		7 - MPC 2003"

			read INDEX_MODELO_IMPRESSORA;
			#validar(), no futuro vou implantar uma validação de "tipo" da entrada, por enquanto uso a do intrepretador.
			#se alguem tentar entrar com uma string o interpretador gera erro e o menu repete. mas se entrar com um numero
			#com virgula o script quebra. 

		done

	echo -e "	\e[01;37mEntre com o CPC da impressora/multifuncional:\e[00m"

		read CPC_IMPRESSORA

	#Concatenação do CPC da impressora e o compartilhamento, isso gera o nome do compartilhamento no padrão 
	#correto: [cpcxxxx]_[modelo da impressora].

	COMPARTILHAMENTO=${CPC_IMPRESSORA}_${MODELO_IMPRESSORA[$INDEX_MODELO_IMPRESSORA]}

			
	echo -e "	\e[01;37mCompartilhamento selecionado:\e[00m \e[01;36m$COMPARTILHAMENTO\e[00m"
	echo "	Se estiver incorreto saia do script (CTRL+C) e rode-o novamente."
	sleep 3

	#Baixa o driver correspondente, por enquanto do meu PC e portanto se ele estiver off teremos erro.
	#No futuro será do SGI e estará sempre on-line.

	echo -e "	\e[01;37mBaixando driver:\e[00m"
	echo ""
		wget http://cpclista:8000/assets/ppd/$INDEX_MODELO_IMPRESSORA.ppd
	echo ""
	
	echo -e "\e[01;37mInstalando a impressora:\e[00m"
	
	#O lpadmin é o comando que instala a impressora, a opção "-P" está depreciada, mas é a melhor opção neste caso.
	
		lpadmin -p $COMPARTILHAMENTO -E -v smb://sgi/$COMPARTILHAMENTO -P $INDEX_MODELO_IMPRESSORA.ppd
