import ArbolSintoma as ArbolSintoma
import math
import mysql.connector

class Enfermedades:
    def __init__(self):
        self.ArSintoma = ArbolSintoma.ArbolSintomas()
        # Se carga enfermedades con los datos de la base de datos
        # Cargar enfermedades desde la base de datos
        self.enfermedades = self.cargar_enfermedades_desde_bd()

        # Se carga pacientes_sintomas con los síntomas del frontend
        self.paciente_sintomas = []
        # En resulta se cargan los que no lleguen al 80% de la cantidad de síntomas
        self.resultado = []
        # Aquí se carga solo los que lleguen al 80% de la cantidad de síntomas
        self.enfermedad_encontrada = []

    def guardar_sintomas_paciente(self, sintomas_paciente):
        self.paciente_sintomas = sintomas_paciente

    def imprimir_paciente_sintomas(self):
        print("Síntomas del paciente:", self.paciente_sintomas)

    def cargar_enfermedades_desde_bd(self):
        # Configuración de conexión a la base de datos MySQL
        conn = mysql.connector.connect(
                    user='root',
                    password='contreras123',
                    host='127.0.0.1',
                    database='PrediccionEnfermedades'
        )

        # Crear un cursor para ejecutar consultas
        cursor = conn.cursor()

        # Consulta SQL para obtener las enfermedades y sus síntomas
        query = """
            SELECT E.nombre as enfermedad, S.nombre as sintoma, ES.porcentaje
            FROM ENFERMEDAD E
            JOIN EnfermedadSintoma ES ON E.id = ES.IDE
            JOIN SINTOMAS S ON ES.IDS = S.id
        """

        # Ejecutar la consulta
        cursor.execute(query)

        # Obtener los resultados
        resultados = cursor.fetchall()

        # Cerrar la conexión a la base de datos
        cursor.close()
        conn.close()

        # Estructurar los datos en un formato similar al utilizado en tu código
        enfermedades = []
        for resultado in resultados:
            nombre_enfermedad = resultado[0]
            sintoma = resultado[1]
            porcentaje = resultado[2]

            # Buscar si la enfermedad ya está en la lista
            enfermedad_existente = next(
                (e for e in enfermedades if e['nombre'] == nombre_enfermedad),
                None
            )

            # Si la enfermedad no existe, se agrega a la lista
            if not enfermedad_existente:
                enfermedad = {
                    'nombre': nombre_enfermedad,
                    'sintomas': {sintoma: porcentaje}
                }
                enfermedades.append(enfermedad)
            else:
                # Si la enfermedad ya existe, se agrega el nuevo síntoma
                enfermedad_existente['sintomas'][sintoma] = porcentaje

        return enfermedades

    # Aquí comienza el procesado de datos
    def hallar_enfermedad(self, sintomas_paciente, enfermedades):
        self.paciente_sintomas = sintomas_paciente

        for enfermedad in enfermedades:
            nombre_enfermedad = enfermedad['nombre']
            sintomas_enfermedad = enfermedad['sintomas']
            self.ArSintoma = ArbolSintoma.ArbolSintomas()

            for paciente in self.paciente_sintomas:
                if paciente in sintomas_enfermedad:
                    valor = sintomas_enfermedad[paciente]
                    self.ArSintoma.Insertar_sintoma(paciente, valor, True)
                else:
                    self.ArSintoma.Insertar_sintoma(paciente, 0, False)

            porcentaje_enfermedad = self.ArSintoma.Suma_Importancia_Nodos()
            porcentaje_arbol = self.ArSintoma.Suma_Nodos()
            limite_porcentaje=porcentaje_arbol/round(len(sintomas_enfermedad))*100
            
            if porcentaje_enfermedad>90:
                
                resultado_enfermedad = {
                'Nombre': nombre_enfermedad,
                'Porcentaje': f"{99}%"
                }
                self.enfermedad_encontrada.append(resultado_enfermedad)
            else:
                resultado_enfermedad = {
                'Nombre': nombre_enfermedad,
                'Porcentaje': f"{porcentaje_enfermedad}%"
                }
                self.resultado.append(resultado_enfermedad)
            #EL INGENIERO PIDIO QUE SE FILTRE A LOS MAYORES DEL 90%

            #EJEMPLO, 90% DEPROBABILIDAD DEIENE UNA ENFERMEDAD

                

    # Elimina las Keys de las listas
    def obtener_resultados(self, lista_resultados):
        resultados_string = ""
        for resultado_enfermedad in lista_resultados:
            nombre_enfermedad = resultado_enfermedad.get('Nombre')
            porcentaje_enfermedad = resultado_enfermedad.get('Porcentaje')
            resultados_string += f"{nombre_enfermedad} {porcentaje_enfermedad}\n"
        return resultados_string

    # Resultado Pulido

    def conclusion(self, sintomas_paciente):
        self.hallar_enfermedad(sintomas_paciente, self.enfermedades)

        if self.enfermedad_encontrada:
            # Si hay enfermedades encontradas, ordenar y devolver esos resultados
            resultados_ordenados = sorted(self.enfermedad_encontrada, key=lambda x: float(x['Porcentaje'].rstrip('%')), reverse=True)
            return self.obtener_resultados(resultados_ordenados)
        else:
            # Si no hay enfermedades encontradas, ordenar y devolver los resultados generales
            resultados_generales_ordenados = sorted(self.resultado, key=lambda x: float(x['Porcentaje'].rstrip('%')), reverse=True)
            return self.obtener_resultados(resultados_generales_ordenados)
