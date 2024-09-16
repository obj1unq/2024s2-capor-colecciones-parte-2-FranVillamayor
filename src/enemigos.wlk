

object erethia {
    const habitantes = #{archibaldo, caterina, astra}

    method enemigosVenciblesPara(personaje) {
        return habitantes.filter({enemigo => personaje.leGanasA(enemigo)})
    }

    method moradasConquistablesPara(personaje) {
        return self.enemigosVenciblesPara(personaje).map({enemigo => enemigo.morada()}).asSet()
      
    }

    method esPoderoso(personaje) {
        return habitantes.all({enemigo => personaje.leGanasA(enemigo)})
      
    }
  
}
object archibaldo {
    method morada() {
        return palacio
      
    }

    method poder() {
        return 16  
    }
  
}

object caterina {
    method morada() {
        return fortaleza
      
    }

    method poder() {
        return 28
    }
  
}

object astra {
    method morada() {
        return torre
      
    }
    method poder() {
        return 14 
    }
  
}

object palacio {
  
}

object fortaleza {
  
}

object torre {
  
}