object knightRider {
	const property bultos = 1
	method peso() { 
		return 500 }
	method nivelPeligrosidad() { 
		return 10 }
	method accidente() {
	  
	}
}
object arenaDeGranel {
	const property bultos = 1
  var property peso = 0
  method nivelPeligrosidad() {
	return 1
  }
  method accidente() {
	peso = peso + 20
  }
}
object bumblebee { 
	const property bultos = 2
	var property estaTransformadoEnAuto = null	
  method peso() {
	return 800
  }
  method estaTransformadoEnAuto(_valor) {
	estaTransformadoEnAuto = _valor
  }
  method nivelPeligrosidad() {
	if (self.estaTransformadoEnAuto()){
		return 15
	}else{
		return 30
	}
  }
  method accidente(){
	estaTransformadoEnAuto = estaTransformadoEnAuto.negate()
  }
}
object paqueteDeLadrillos {
  var property cantidadDeLadrillos = 0
  
  method peso() {
	return 2*cantidadDeLadrillos
  }
  method nivelPeligrosidad() {
	return 2
  }
  method bultos() {
	if(cantidadDeLadrillos <= 100){
		return 1
	}else{
		if(cantidadDeLadrillos >= 101 && cantidadDeLadrillos <= 300){
			return 2
		}else{
			return 3
		}
	}
  }
  method accidente() {
	if (cantidadDeLadrillos < 12){
		cantidadDeLadrillos = 0
	}else{
		cantidadDeLadrillos = cantidadDeLadrillos - 12
	}
  }
}
object bateriaAntiAerea {
  var property tieneMisiles = false
  method peso() {
	if (self.tieneMisiles()){
		return 300
	}else{
		return 200
	}
  }
  method nivelPeligrosidad() {
	if (self.tieneMisiles()){
		return 100
	}else{
		return 0
	}
  }
  method bultos() {
	if(tieneMisiles){
		return 2
	}else{
		return 1
	}
  }
  method accidente() {
	tieneMisiles = false
  }
}
object residuosRadioactivos {
	const property bultos = 1
  var property peso = 0
  method nivelPeligrosidad() {
	return 200
  }
  method accidente() {
	peso = peso + 15
  }
}
object contenedorPortuario {
  const property cosas = []
  method peso() {
	return 100 + cosas.sum({cosa => cosa.peso()})
  }
  method nivelPeligrosidad() {
	var cosaMasPeligrosa = null
	if (cosas.isEmpty()){
		return 0
	}else{
		cosaMasPeligrosa = cosas.max({cosa => cosa.nivelPeligrosidad()})
		return cosaMasPeligrosa.nivelPeligrosidad()
	}
  }
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
		self.error("Imposible cargar " + cosa + " al contenedor, ya se encuentra cargado.")
	  }
	}
	method validarDescarga(cosa) {
	  if(not cosas.contains(cosa)){
		self.error("Imposible descargar " + cosa + ". No se encuentra cargado en el contenedor.")
	  }
	}
	method bultos() {
	  return cosas.sum({cosa => cosa.bultos()}) + 1
	}
	method accidente() {
	  cosas.forEach({cosa => cosa.accidente()})
	}
}
object embalajeDeSeguridad {
	const property bultos = 2
  var property cosaEnvuelta = null
  method peso() {
	return self.cosaEnvuelta().peso()
  }
  method nivelPeligrosidad() {
	return self.cosaEnvuelta().nivelPeligrosidad() / 2
  }
  method accidente() {
	
  }
}