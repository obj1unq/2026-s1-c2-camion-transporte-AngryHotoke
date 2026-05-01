import cosas.*

object camion {
	const property cosas = []
		
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
}
