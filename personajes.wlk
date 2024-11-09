class Personaje {
  const property fuerza
  const property inteligencia
  var rol  

  method rol() = rol

  method cambiarRol(unRol) {
    rol = unRol
  }

  method potencialOfensivo() = 
    fuerza * 10 + rol.extra()

  method esInteligente() 

  method esGrosoEnSuRol() = rol.esGroso(self)

  method esGroso() {
    self.esInteligente() or self.esGrosoEnSuRol()
  }
}

class Orco inherits Personaje {
  override method potencialOfensivo() = super() * 1.1
  override method esInteligente() = false 
}

class Humano inherits Personaje {
  override method esInteligente() = inteligencia > 50
}

object guerrero {
  method extra() = 100 
  method esGroso(personaje) = 
    personaje.fuerza() > 50 
}

class Cazador {
  const property mascota  

  method extra() = mascota.potencialOfensivo()
  method esGroso(personaje) = 
    mascota.esLongeva()
}

object brujo {
  method extra() = 0
  method esGroso(personaje) = true 
}

class Mascota {
  const property fuerza
  var edad
  const property tieneGarras

  method edad() = edad
  method aumentarEdad() {edad += 1}
  method potencialOfensivo() =
    if(tieneGarras) {fuerza*2} else {fuerza} 

  method esLongeva() = edad > 10
}