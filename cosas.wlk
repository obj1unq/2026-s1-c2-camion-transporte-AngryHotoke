object knightRider {
	method peso() { 
		return 500 }
	method nivelPeligrosidad() { 
		return 10 }
}
object arenaDeGranel {
  var property peso = 0
  method nivelPeligrosidad() {
	return 1
  }
}
object bumblebee { 
	var property estaTransformado = null	
  method peso() {
	return 800
  }
  method estaTransformado(_valor) {
	estaTransformado = _valor
  }
  method nivelPeligrosidad() {
	if (self.estaTransformado()){
		return 15
	}else{
		return 30
	}
  }
}
object paqueteDeLadrillos {
  var cantidadDeLadrillos = 0
  method cantidadDeLadrillos(_cantidad) {
	cantidadDeLadrillos = _cantidad
  }
  method peso() {
	return 2*cantidadDeLadrillos
  }
  method nivelPeligrosidad() {
	return 2
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
}
object residuosRadioactivos {
  var property peso = 0
  method nivelPeligrosidad() {
	return 200
  }
}