
from flask import Flask, render_template, request, redirect, url_for
from Enfermedades import Enfermedades

#SE INICIA EL SERVIDOR 
app = Flask(__name__)

# Instancia de la clase Enfermedades
enfermedades_instancia = Enfermedades()

#FUNCION QUE DEVUELVE ALGO EN LA APAGINA
@app.route('/') #PAGINA PRINCIPAL
def Index():
    return render_template('index.html')

# Procesa los síntomas cuando se hace clic en el botón de diagnóstico
@app.route('/procesar_sintomas', methods=['POST'])
def procesar_sintomas():
    if 'diagnostico' in request.form:
        enfermedades_instancia = Enfermedades()
        sintomas_pacientes = request.form.getlist('sintoma')
        print("Síntomas del paciente:", sintomas_pacientes)
        
        resultado_diagnostico = enfermedades_instancia.conclusion(sintomas_pacientes)

        # Devuelve el resultado al frontend y lo establece en el textarea
        return render_template('index.html', resultado=resultado_diagnostico)

    return redirect(url_for('index'))

#VERIFICACION
if __name__=='__main__':
    app.run(port = 2000, debug = True)



