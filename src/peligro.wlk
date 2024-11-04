class Peligro{
    const property capacidadDeBatalla
    const property nivelComplejidad
    const property cantPersQueSeBanca


    var property desechosRadiactivos = false


    method puedeAfrontarlo(personaje){
        return self.parsonajeTieneMejorCapacidad(personaje) and self.sonDesechosManejables(personaje)
    }

    method parsonajeTieneMejorCapacidad(personaje){
        return personaje.capacidadDeBatalla() > capacidadDeBatalla
    }

    method sonDesechosManejables(personaje){
        return (not desechosRadiactivos) or personaje.manejaDesechosToxicos()
        
    }
   


}