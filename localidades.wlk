import personajes.*
class Localidad {
    var ejercito
    method potencialDefensivo() = ejercito.potencialTotal()
    method serOcupada(unEjercito)
}

class Aldea inherits Localidad {
    const property cantMaximaPersonajes  
    override method serOcupada(unEjercito){
        if (unEjercito.size() > cantMaximaPersonajes){
            ejercito = unEjercito.nuevoEjercitoFuerto(10)
        }
    }
}

class Ciudad inherits Localidad {
    override method serOcupada(unEjercito){
        ejercito = unEjercito
    }   
    override method potencialDefensivo() = super() + 300
}

class Ejercito {
    const property personajes = [] 
    method potencialTotal() = 
        personajes.sum({p => p.potencialOfensivo()})

    method puedeTomarLocalidad(localidad) = 
        self.potencialTotal() > localidad.potencialDefensivo()
   
    method invadir(localidad) {
       if (self.puedeTomarLocalidad(localidad)){
        localidad.serOcupada(self)
       }
    }

    method nuevoEjercitoFuerto(unaCantidad) {
        const nuevoEjercito = personajes.sortBy({p1,p2 => p1.potencialOfensivo() > p2.potencialOfensivo()}).take(unaCantidad)  
        personajes.removeAll(nuevoEjercito)
        return
        new Ejercito(personajes = nuevoEjercito)
    }
}