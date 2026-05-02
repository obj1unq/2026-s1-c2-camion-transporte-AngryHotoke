import camion.*
import cosas.*

object almacen {
  const property cosasAlmacenadas = []

  method guardarCosasDelTransporte(transporte) {
    cosasAlmacenadas.addAll(transporte.cosas())
  }
  method agregarCosa(cosa) {
    cosasAlmacenadas.add(cosa)
  }
}

