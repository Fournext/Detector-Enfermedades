create database PrediccionEnfermedades;
use PrediccionEnfermedades;

create table ENFERMEDAD(
id integer  not null primary key,
nombre varchar(30) not null
);

create table SINTOMAS(
id integer not null primary key,
nombre varchar(60)not null
);
create table EnfermedadSintoma(
IDE integer not null,
IDS integer not null,
porcentaje float8 not null,
 primary key(IDE,IDS),
foreign key(IDE) references ENFERMEDAD(id),
foreign key(IDS) references SINTOMAS(id));



-- INGRESANDO ENFERMEDADES
insert ENFERMEDAD values(1001,"DENGUE");
insert ENFERMEDAD values(1002,"ZIKA");
insert ENFERMEDAD values(1003,"CHIKUNGUNYA");
insert ENFERMEDAD values(1004,"COVID - 19");
insert ENFERMEDAD values(1005,"TUBERCULOSIS");
insert ENFERMEDAD values(1006,"NEUMONIA");
insert ENFERMEDAD values(1007,"HEPATITIS");
insert ENFERMEDAD values(1008,"SARAMPION");
insert ENFERMEDAD values(1009,"INFLUENZA");


insert ENFERMEDAD values(1010,"AMIGDALITIS");
insert ENFERMEDAD values(1011,"APENDICITIS");
insert ENFERMEDAD values(1012,"ANEMIA");
-- INGRESANDO SINTOMAS
insert SINTOMAS values(2001,"FIEBRE");
insert SINTOMAS values(2002,"DOLOR DE CABEZA");
insert SINTOMAS values(2003,"DOLOR DE OJOS");
insert SINTOMAS values(2004,"DOLOR MUSCULAR");
insert SINTOMAS values(2005,"NAUSEAS");
insert SINTOMAS values(2006,"MALESTAR GENERAL");
insert SINTOMAS values(2007,"SARPULLIDO EN LA PIEL");
insert SINTOMAS values(2008,"ESCALOFRIOS");
insert SINTOMAS values(2009,"FALTA DE APETITO");
insert SINTOMAS values(2010,"CANSANCIO");
insert SINTOMAS values(2011,"OJOS ROJOS");
insert SINTOMAS values(2012,"DOLOR EN ARTICULACIONES");
insert SINTOMAS values(2013,"DOLOR DE GARGANTA");
insert SINTOMAS values(2014,"TOS SECA");
insert SINTOMAS values(2015,"SECRECIONES NASALES");
insert SINTOMAS values(2016,"COMPLICACIONES AL RESPIRAR");
insert SINTOMAS values(2017,"DIARREA");
insert SINTOMAS values(2018,"PRESION EN EL PECHO");
insert SINTOMAS values(2019,"PERDIDA DE SENTIDOS GUSTO O OLFATO");
insert SINTOMAS values(2020,"SUDORES NOCTURNOS");
insert SINTOMAS values(2021,"TOS INTENSA PROLONGADA +15 DIAS");
insert SINTOMAS values(2022,"TOS CON SANGRE");
insert SINTOMAS values(2023,"TOS CON FLEMA");
insert SINTOMAS values(2024,"CONGESTION NASAL");
insert SINTOMAS values(2025,"RESPIRACION CON SILVIDOS");
insert SINTOMAS values(2026,"OJOS Y PIEL AMARILLOS");
insert SINTOMAS values(2027,"FATIGA");
insert SINTOMAS values(2028,"ORINA OSCURA");
insert SINTOMAS values(2029,"PUNTOS BLANCOS EN LA BOCA");
insert SINTOMAS values(2030,"DOLOR ABDOMINAL");
insert SINTOMAS values(2031,"PERDIDA DE PESO");
insert SINTOMAS values(2032,"DIFICULTAD PARA TRAGAR");
insert SINTOMAS values(2033,"ALMIGDALAS INFLAMADAS");
insert SINTOMAS values(2034,"VOMITO");
insert SINTOMAS values(2035,"PIEL PALIDA");
insert SINTOMAS values(2036,"MAREOS");
insert SINTOMAS values(2037,"EXTREMIDADES FRIAS");

insert SINTOMAS values(2038,"DOLOR DE DIENTES");

-- INGRESANDO PORCENTAJES DE RELACION SINTOMA ENFERMEDAD
-- DENGUE
insert into EnfermedadSintoma values(1001, 2001, 20); -- DENGUE "FIEBRE"
insert into EnfermedadSintoma values(1001, 2002, 20.0); -- DENGUE "DOLOR DE CABEZA"
insert into EnfermedadSintoma values(1001, 2003, 30); -- DENGUE "DOLOR DE OJOS"
insert into EnfermedadSintoma values(1001, 2004, 20); -- DENGUE "DOLOR MUSCULAR"
insert into EnfermedadSintoma values(1001, 2005, 10.0); -- DENGUE "NAUSEAS"
insert into EnfermedadSintoma values(1001, 2006, 10.0); -- DENGUE "MALESTAR GENERAL"
insert into EnfermedadSintoma values(1001, 2007, 10.0); -- DENGUE "SARPULLIDO EN LA PIEL"
insert into EnfermedadSintoma values(1001, 2008, 5.0);  -- DENGUE "ESCALOFRIOS"
insert into EnfermedadSintoma values(1001, 2009, 8.0);  -- DENGUE "FALTA DE APETITO"
insert into EnfermedadSintoma values(1001, 2012, 15);  -- DENGUE "DOLOR EN ARTICULACIONES"

-- ZIKA
insert into EnfermedadSintoma values(1002, 2001, 20); -- ZIKA "FIEBRE"
insert into EnfermedadSintoma values(1002, 2002, 25.0); -- ZIKA "DOLOR DE CABEZA"
insert into EnfermedadSintoma values(1002, 2010, 18.0); -- ZIKA "CANSANCIO"
insert into EnfermedadSintoma values(1002, 2011, 25.0); -- ZIKA "OJOS ROJOS"
insert into EnfermedadSintoma values(1002, 2012, 18); -- ZIKA "DOLOR EN ARTICULACIONES"
insert into EnfermedadSintoma values(1002, 2007, 25); -- ZIKA "SARPULLIDO EN LA PIEL" 

-- CHIKUNGUNYA
insert into EnfermedadSintoma values(1003, 2001, 20.0); -- CHIKUNGUNYA "FIEBRE"
insert into EnfermedadSintoma values(1003, 2002, 20.0); -- CHIKUNGUNYA "DOLOR DE CABEZA"
insert into EnfermedadSintoma values(1003, 2010, 20.0); -- CHIKUNGUNYA "CANSANCIO"
insert into EnfermedadSintoma values(1003, 2004, 20.0); -- CHIKUNGUNYA "DOLOR MUSCULAR"
insert into EnfermedadSintoma values(1003, 2012, 15.0); -- CHIKUNGUNYA "DOLOR EN ARTICULACIONES"
insert into EnfermedadSintoma values(1003, 2007, 25.0); -- CHIKUNGUNYA "SARPULLIDO EN LA PIEL"

-- COVID-19
insert into EnfermedadSintoma values(1004, 2001, 18.0); -- COVID-19 "FIEBRE"
insert into EnfermedadSintoma values(1004, 2002, 10.0); -- COVID-19 "DOLOR DE CABEZA"
insert into EnfermedadSintoma values(1004, 2010, 12.0); -- COVID-19 "CANSANCIO"
insert into EnfermedadSintoma values(1004, 2006, 10.0); -- COVID-19 "MALESTAR GENERAL"
insert into EnfermedadSintoma values(1004, 2013, 10.0); -- COVID-19 "DOLOR DE GARGANTA"
insert into EnfermedadSintoma values(1004, 2014, 20.0); -- COVID-19 "TOS SECA"
insert into EnfermedadSintoma values(1004, 2015, 10.0); -- COVID-19 "SECRECIONES NASALES"
insert into EnfermedadSintoma values(1004, 2016, 18.0); -- COVID-19 "COMPLICACIONES AL RESPIRAR"
insert into EnfermedadSintoma values(1004, 2017, 10.0); -- COVID-19 "DIARREA"
insert into EnfermedadSintoma values(1004, 2019, 30.0); -- COVID-19 "PERDIDA DE SENTIDOS GUSTO O OLFATO"
insert into EnfermedadSintoma values(1004, 2025, 20.0); -- COVID-19 "RESPIRACION CON SILVIDOS"
insert into EnfermedadSintoma values(1004, 2021, 30.0); -- COVID-19 "TOS INTENSA PROLONGADA +15 DIAS"
insert into EnfermedadSintoma values(1004, 2018, 20.0); -- COVID-19 "PRESION EN EL PECHO"

-- TUBERCULOSIS
insert into EnfermedadSintoma values(1005, 2001, 20.0); -- TUBERCULOSIS "FIEBRE"
insert into EnfermedadSintoma values(1005, 2010, 20.0); -- TUBERCULOSIS "CANSANCIO"
insert into EnfermedadSintoma values(1005, 2020, 18.0); -- TUBERCULOSIS "SUDORES NOCTURNOS"
insert into EnfermedadSintoma values(1005, 2008, 20.0); -- TUBERCULOSIS "ESCALOFRIOS"
insert into EnfermedadSintoma values(1005, 2009, 18.0); -- TUBERCULOSIS "FALTA DE APETITO"
insert into EnfermedadSintoma values(1005, 2021, 30.0); -- TUBERCULOSIS "TOS INTENSA PROLONGADA +15 DIAS"
insert into EnfermedadSintoma values(1005, 2022, 15.0); -- TUBERCULOSIS "TOS CON SANGRE"
insert into EnfermedadSintoma values(1005, 2016, 20.0); -- TUBERCULOSIS "COMPLICACIONES AL RESPIRAR"
insert into EnfermedadSintoma values(1005, 2018, 18.0); -- TUBERCULOSIS "PRESION EN EL PECHO"

-- NEUMONIA
insert into EnfermedadSintoma values(1006, 2001, 20.0); -- NEUMONIA "FIEBRE"
insert into EnfermedadSintoma values(1006, 2010, 15.0); -- NEUMONIA "CANSANCIO"
insert into EnfermedadSintoma values(1006, 2030, 18.0); -- NEUMONIA "DOLOR ABDOMINAL"
insert into EnfermedadSintoma values(1006, 2008, 20.0); -- NEUMONIA "ESCALOFRIOS"
insert into EnfermedadSintoma values(1006, 2009, 18.0); -- NEUMONIA "FALTA DE APETITO"
insert into EnfermedadSintoma values(1006, 2023, 15.0); -- NEUMONIA "TOS CON FLEMA"
insert into EnfermedadSintoma values(1006, 2016, 20.0); -- NEUMONIA "COMPLICACIONES AL RESPIRAR"
insert into EnfermedadSintoma values(1006, 2024, 15.0); -- NEUMONIA "CONGESTION NASAL"
insert into EnfermedadSintoma values(1006, 2018, 18.0); -- NEUMONIA "PRESION EN EL PECHO"
insert into EnfermedadSintoma values(1006, 2025, 15.0); -- NEUMONIA "RESPIRACION CON SILVIDOS"

-- HEPATITIS
insert into EnfermedadSintoma values(1007, 2001, 18.0); -- HEPATITIS "FIEBRE"
insert into EnfermedadSintoma values(1007, 2026, 30.0); -- HEPATITIS "OJOS Y PIEL AMARILLOS"
insert into EnfermedadSintoma values(1007, 2005, 20.0); -- HEPATITIS "NAUSEAS"
insert into EnfermedadSintoma values(1007, 2027, 18.0); -- HEPATITIS "FATIGA"
insert into EnfermedadSintoma values(1007, 2030, 20.0); -- HEPATITIS "DOLOR ABDOMINAL"
insert into EnfermedadSintoma values(1007, 2009, 18.0); -- HEPATITIS "FALTA DE APETITO"
insert into EnfermedadSintoma values(1007, 2017, 15.0); -- HEPATITIS "DIARREA"
insert into EnfermedadSintoma values(1007, 2028, 20.0); -- HEPATITIS "ORINA OSCURA"

-- SARAMPION
insert into EnfermedadSintoma values(1008, 2001, 15.0); -- SARAMPION "FIEBRE"
insert into EnfermedadSintoma values(1008, 2011, 20.0); -- SARAMPION "OJOS ROJOS"
insert into EnfermedadSintoma values(1008, 2007, 25.0); -- SARAMPION "SARPULLIDO EN LA PIEL"
insert into EnfermedadSintoma values(1008, 2029, 25.0); -- SARAMPION "PUNTOS BLANCOS EN LA BOCA"
insert into EnfermedadSintoma values(1008, 2014, 15.0); -- SARAMPION "TOS SECA"
insert into EnfermedadSintoma values(1008, 2015, 17.0); -- SARAMPION "SECRECIONES NASALES"

-- INFLUENZA
insert into EnfermedadSintoma values(1009, 2001, 18.0); -- INFLUENZA "FIEBRE"
insert into EnfermedadSintoma values(1009, 2014, 20.0); -- INFLUENZA "TOS SECA"
insert into EnfermedadSintoma values(1009, 2023, 18.0); -- INFLUENZA "TOS CON FLEMA"
insert into EnfermedadSintoma values(1009, 2013, 15.0); -- INFLUENZA "DOLOR DE GARGANTA"
insert into EnfermedadSintoma values(1009, 2027, 18.0); -- INFLUENZA "FATIGA"
insert into EnfermedadSintoma values(1009, 2004, 15.0); -- INFLUENZA "DOLOR MUSCULAR"
insert into EnfermedadSintoma values(1009, 2022, 15.0); -- INFLUENZA "TOS CON SANGRE"
insert into EnfermedadSintoma values(1009, 2018, 15.0); -- INFLUENZA "PRESION EN EL PECHO"
insert into EnfermedadSintoma values(1009, 2031, 10.0); -- INFLUENZA "PERDIDA DE PESO"
insert into EnfermedadSintoma values(1009, 2020, 15.0); -- INFLUENZA "SUDORES NOCTURNOS"

-- AMIGDALITIS
insert into EnfermedadSintoma values(1010,2001,20); -- AMIGDALITIS "FIEBRE"
insert into EnfermedadSintoma values(1010,2013,20); -- AMIGDALITIS "DOLOR DE GARGANTA"
insert into EnfermedadSintoma values(1010,2032,20); -- AMIGDALITIS "DIFICULTAD AL TRAGAR" 
insert into EnfermedadSintoma values(1010,2033,35); -- AMIGDALITIS "ALMIGDALAS INFLAMADAS"
insert into EnfermedadSintoma values(1010,2016,10); -- AMIGDALITIS "DIFICULTAD PARA RESPIRAR"

-- APENDICITIS
insert into EnfermedadSintoma values(1011,2030,40); -- APENDICITIS "DOLOR ABDOMINAL"
insert into EnfermedadSintoma values(1011,2001,20); -- APENDICITIS "FIEBRE"
insert into EnfermedadSintoma values(1011,2005,10); -- APENDICITIS "NAUSEAS"
insert into EnfermedadSintoma values(1011,2034,15); -- APENDICITIS "VOMITO"
insert into EnfermedadSintoma values(1011,2008,15); -- APENDICITIS "ESCALOFRIOS"

-- ANEMIA
insert into EnfermedadSintoma values(1012,2035,35); -- ANEMIA "PIEL PALIDA"
insert into EnfermedadSintoma values(1012,2010,40); -- ANEMIA "CANSANCIO"
insert into EnfermedadSintoma values(1012,2036,25); -- ANEMIA "MAREOS"
insert into EnfermedadSintoma values(1012,2037,20); -- ANEMIA "EXTREMIDADES FRIAS"


insert into EnfermedadSintoma values(1012,2038,20); -- ANEMIA "DOLOR DE DIENTES"


