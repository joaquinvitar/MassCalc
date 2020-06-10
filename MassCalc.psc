// Subproceso de correción de valor
subproceso resultado<-errMacro()
	
	// corrige el error al intentar poner
	// un valor de tipo caracter o cadena
	// en un valor numérico
	// ----------------------------------
	
	// variables
	definir i,j como entero;
	definir resultado como real;
	definir cade,cade2,num,var como cadena;
	
	// inicialización
	num<-"0123456789.";
	cade<-"";
	cade2<-"";
	
	// proceso
	leer var;
	para i<-0 hasta longitud(var) con paso 1 hacer
		para j<-0 hasta longitud(num) con paso 1 hacer
			si subcadena(var,i,i)==subcadena(num,j,j) entonces
				cade<-subcadena(var,i,i);
				cade2<-concatenar(cade2,cade);
			finsi
		finpara
	finpara
	si cade2=="" entonces
		cade2<-"1";
	finsi
	resultado<-convertiranumero(cade2);
	
finsubproceso


// Proceso principal
Proceso MassCalc
	
	// variables
	definir i,j,menu como entero;
	definir res,kg,mt como real;
	definir actv como logico;
	definir titulo,barra,flecha como cadena;
	
	// inicialización
	actv<-verdadero;
	barra<-"|---------|---------|---------|---------|";
	flecha<-"";
	kg<-0;
	mt<-0;
	res<-0;
	
	dimension titulo[8];
	titulo[0]<-"";
	titulo[1]<-"";
	titulo[2]<-"        ___  ___              _____       _      ";
	titulo[3]<-"   _    |  \/  |             /  __ \     | |     ";
	titulo[4]<-" _| |_  | .  . | __ _ ___ ___| /  \/ __ _| | ___ ";
	titulo[5]<-"|_   _| | |\/| |/ _` / __/ __| |    / _` | |/ __|";
	titulo[6]<-"  |_|   | |  | | (_| \__ \__ \ \__/\ (_| | | (__ ";
	titulo[7]<-"        \_|  |_/\__,_|___/___/\____/\__,_|_|\___|";
	
	// -----------------------------------------------------------
	
	// animación
	limpiar pantalla;
	esperar 800 milisegundos;
	para i<-0 hasta (7) con paso 1 hacer
		esperar 50 milisegundos;
		escribir titulo[i];
	finpara
	
	esperar 1 segundo;
	para i<-0 hasta (7) con paso 1 hacer
		esperar 50 milisegundos;
		limpiar pantalla;
		
		para j<-0 hasta (7-i)-1 con paso 1 hacer
			escribir titulo[j];
		finpara
	finpara
	esperar 1 segundo;
	
	// menús
	escribir "** ¡Bienvenido! **";
	escribir "    ¯¯¯¯¯¯¯¯¯¯";
	escribir "// Con este programa podrás averiguar";
	escribir "// tu índice de masa corporal.";
	escribir "-------------------------------------";
	escribir "";
	escribir ">> Presione cualquier tecla para comenzar";
	esperar tecla;
	menu<-1;
	
	mientras actv==verdadero hacer
		segun menu hacer
			1:
				limpiar pantalla;
				escribir "// Lo único que debes hacer es ingresar";
				escribir "// tu peso (Kg) y tu altura (Mt).";
				escribir "---------------------------------------";
				escribir "";
				escribir sin saltar "-- Peso: ";
				kg<-errMacro();
				escribir sin saltar "-- Altura: ";
				mt<-errMacro();
				menu<-2;
			2:
				res<-kg/(mt^2);
				limpiar pantalla;
				escribir kg;
				escribir "** ¡Perfecto! Aquí están tus resultados. **";
				escribir "";
				para i<-0 hasta redon((res/1.25)-1) con paso 1 hacer
					flecha<-concatenar(flecha," ");
				finpara
				escribir flecha,"  >> Su IMC es: ",res;
				escribir flecha,"V";
				escribir barra;
				escribir "";
				si res<18.5 entonces
					escribir "** Estado: > Bajo peso < **";
					escribir "// Recomendación: Come con más frecuencia";
					escribir "// e ingiere comidas ricas en nutrientes!";
				sino si res<=24.9 entonces
						escribir "** Estado: > Saludable < **";
						escribir "// Recomendación: Estás bien! Mantente";
						escribir "// ejercitado y come sano.";
					sino si res<=29.9 entonces
							escribir "** Estado: > Sobrepeso < **";
							escribir "// Recomendación: Estás pasado! Haz";
							escribir "// ejercicio y empieza a comer sano!";
						sino si res>=30 entonces
								escribir "** Estado: > Obesidad < **";
								escribir "// Recomendación: Exceso de peso! Comienza";
								escribir "// ahora mismo a hacer ejercicio y comer sano!";
							finsi
						finsi
					finsi
				finsi
				escribir "------------------------------------";
				escribir "";
				escribir ">> Ingresa 1 para volver o 9 para salir";
				menu<-errMacro();
			9:
				escribir "";
				escribir "** Adiós! **";
				escribir "";
				actv<-falso;
		finsegun
	finmientras
	
FinProceso