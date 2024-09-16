


object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}

	method artefactoMasPoderoso(personaje) {
		return artefactos.max({artefacto => artefacto.poder(personaje)})
	}
	
}


object rolando {

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	var poderBase = 5

	method artefactoMasPoderosoEnCasa() {
		return casa.artefactoMasPoderoso(self)
	  
	}

	method poderBase() { //Se agrega para el test
	    return poderBase
	}

	method poderDeArtefactos() { //suma el poder de todos los artefactos
		return artefactos.sum({artefacto => artefacto.poder(self)})
	  
	}

	method luchar() { //Le envia una orden a cada artefacto -Acccion
		artefactos.forEach({artefacto => artefacto.serUsado()})
		poderBase = poderBase + 1
	  
	}

	method leGanasA(enemigo) {
		return enemigo.poder() < self.poderDePelea()
	  
	}

	method tieneArmaFatal(enemigo) {
		return artefactos.any({artefacto => artefacto.poder(self) > enemigo.poder()})
	  
	}

	method armaFatal(enemigo){
		return artefactos.find({artefacto => artefacto.poder(self) > enemigo.poder()})
  
	}

	method poderBase(_poderBase) { //se agrega el setter para el test
	  poderBase = _poderBase
	}

	method poderDePelea() {
		return poderBase + self.poderDeArtefactos()
	  
	}

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
		
}

