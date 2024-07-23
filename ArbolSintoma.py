
class NodoSintoma:
    def __init__(self, nombre, importancia, rama=None):
        self.nombre = nombre
        self.importancia = importancia
        self.rama = rama
        self.izquierda = None
        self.derecha = None

class ArbolSintomas:
    def __init__(self):
        self.raiz = None

    def Insertar_sintoma(self, nombre, importancia, rama):
        nuevo_sintoma = NodoSintoma(nombre, importancia, rama)

        if self.raiz is None:
            self.raiz = nuevo_sintoma
        else:
            self._Insertar_sintoma(self.raiz, nuevo_sintoma)

    def _Insertar_sintoma(self, nodo_actual, nuevo_sintoma):
        if nuevo_sintoma.rama:
            if nodo_actual.derecha is None:
                nodo_actual.derecha = nuevo_sintoma
            else:
                self._Insertar_sintoma(nodo_actual.derecha, nuevo_sintoma)
        else:
            if nodo_actual.izquierda is None:
                nodo_actual.izquierda = nuevo_sintoma
            else:
                self._Insertar_sintoma(nodo_actual.izquierda, nuevo_sintoma)
    
    def Suma_Importancia_Nodos(self):
        if self.raiz is None:
            return 0
        return self._Suma_Importancia_Nodos_(self.raiz)

    def _Suma_Importancia_Nodos_(self,nodo_actual):
        if nodo_actual is None:
            return 0
        sumaDerecha=self._Suma_Importancia_Nodos_(nodo_actual.derecha)      
        return nodo_actual.importancia+sumaDerecha
        
            #return nodo_actual.importancia+sumaIzquierda
    def Suma_Nodos(self):
        return self._Suma_Nodos(self.raiz)

    def _Suma_Nodos(self, nodo_actual):
        if nodo_actual is None:
            return 0

        sumaDerecha = self._Suma_Nodos(nodo_actual.derecha)
        if nodo_actual.rama:
            return sumaDerecha + 1
        else:
            return sumaDerecha
