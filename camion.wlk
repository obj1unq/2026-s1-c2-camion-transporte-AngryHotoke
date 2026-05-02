import cosas.*

object camion {
	const property cosas = []
	const taraCamion = 1000
		
	method cargar(cosa) {
		self.validarCarga(cosa)
		cosas.add(cosa)
	}
	method descargar(cosa) {
		self.validarDescarga(cosa)
	  cosas.remove(cosa)
	}
	method validarCarga(cosa) {
	  if(cosas.contains(cosa)){
		self.error("Imposible cargar " + cosa + " al camion, ya se encuentra cargado.")
	  }
	}
	method validarDescarga(cosa) {
	  if(not cosas.contains(cosa)){
		self.error("Imposible descargar " + cosa + ". No se encuentra cargado en el camion.")
	  }
	}
	method todoPesoEsPar() {
	  return cosas.all({cosa => cosa.peso() % 2 == 0})
	}
	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}
	method pesoTotal() {
	  return cosas.sum({cosa => cosa.peso()}) + taraCamion
	}
	method excesoDePeso() {
	  return self.pesoTotal() > 2500
	}
	method cosaConNivelDePeligrosidad(valor) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == valor})
	}
	method cosasConNivelDePeligrosidadMayorA(valor) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > valor})
	}
	method cosasConNivelDePeligrosidadMayorALaCosa(cosa) {
	  return self.cosasConNivelDePeligrosidadMayorA(cosa.nivelPeligrosidad())
	}
	method puedeCircularEnRutaConNP(valor) {
	  return cosas.all({cosa => cosa.nivelPeligrosidad() < valor}) && not self.excesoDePeso()
	}
	method tieneAlgoQuePeseEntre(unValor,otroValor) {
	  return cosas.any({cosa => cosa.peso().between(unValor, otroValor)})
	}
	method cosaMasPesada() {
	  return cosas.max({cosa => cosa.peso()})
	}
	method pesosDeTodasLasCosas() {
	  return cosas.map({cosa => cosa.peso()})
	}
	method cantidadTotalDeBultos() {
	  return cosas.sum({cosa => cosa.bultos()})
	}
	method accidente() {
	  cosas.forEach({cosa => cosa.accidente()})
	}
}
