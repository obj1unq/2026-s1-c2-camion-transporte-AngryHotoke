import camion.*
import cosas.*
import destinos.*

object ruta9 {
    const nivelDePeligrosidadPermitido = 20
  method condicionesDeRutaCumplidasPor(transporte) {
    return transporte.puedeCircularEnRutaConNP(nivelDePeligrosidadPermitido)
  }
}
object caminoVecinal {
    var property pesoMaximoPermitido = 0
  method condicionesDeRutaCumplidasPor(transporte) {
    return transporte.pesoTotal() < pesoMaximoPermitido
  }
}