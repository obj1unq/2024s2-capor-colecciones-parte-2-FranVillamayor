object espada{
	var fueUsado = false

     method serUsado(){
        fueUsado = true
    }

	method poder(personaje) {
		//return if(fueUsado) poder else poder * 0.5
		return personaje.poderBase() * self.factorPorUso() 
	}

	method factorPorUso() {
		return if(fueUsado) 0.5 else 1
	}
}

object collar {
	var usos = 0

    method serUsado() {
        usos += 1
    }

	method poder(personaje) {
		return 3 + self.extraPorNivel(personaje)
	}

	method extraPorNivel(personaje) {
		return if(personaje.poderBase() > 6) usos else 0 
	  
	}

}

object armadura {
	method poder(personaje) {
		return 6
	}

    method serUsado() {
      // no hace nada es para el polimorfismo
    }

}

object libro {
    var property hechizos = []
	method poder(personaje) {
		return if(self.tieneHechizo())
        {self.hechizoActual().poderDeMagia(personaje)}
        else 0
    }

    method tieneHechizo() {
        return not hechizos.isEmpty()
      
    }

    method serUsado() {
        hechizos.remove(self.hechizoActual())
    }

    method hechizoActual() {
      return hechizos.head()
    }
	
}

object bendicion {
    method poderDeMagia(personaje) {
        return 4
    }
  
}

object invisibilidad {
    method poderDeMagia(personaje) {
        return personaje.poderBase()
      
    }
  
}

object invocacion {
    method poderDeMagia(personaje) {
        return personaje.artefactoMasPoderosoEnCasa().poder(personaje)
    }
  
}