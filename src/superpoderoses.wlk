class Personaje{
    var property estrategia
    var property espiritualidad

    const poderes
    method  capacidadDeBatalla(){ // = _la sumatoria de los capacidades que le aportan sus poderes_. 
        return poderes.sum({poder => poder.capacidadDeBatalla(self)})
    }

    // method capacidadDeBatalla(poder){ //no se si hace flta!
    //     return poder.capacidadDeBatalla(self)
    // }

    method mejorPoder(){
        return poderes.max({poder => poder.capacidadDeBatalla(self)})
    }


    method puedeAfrontarlo(peligro){
        return peligro.puedeAfrontarlo(self)
    }

    method manejaDesechosToxicos(){
        return poderes.any({poder => poder.cumpleCondicionRadiacion()})
    }

    method afrontarPeligro(peligro){
        self.validarpuedeAfrontar(peligro)
        estrategia += peligro.nivelComplejidad()

    }

    method validarpuedeAfrontar(peligro){
        if(not peligro.puedeAfrontarlo(self)){
            self.error("No puede afrontar el peligro.")
        }

    }

}

class Metahumano inherits Personaje{
    override method  capacidadDeBatalla(){
        return super() * 2
    }

    override method manejaDesechosToxicos(){
        return true
    }

    override method afrontarPeligro(peligro){
        super(peligro)
        espiritualidad += peligro.nivelComplejidad()
    }
}

class Mago inherits Metahumano(){
    var property poderAcumulado

    override method  capacidadDeBatalla(){
        return super() + poderAcumulado
    }
    override method afrontarPeligro(peligro){
        if (poderAcumulado>10) {super(peligro)}

        self.actualizarPoderAcumulado()
    }

    method actualizarPoderAcumulado(){
        if (poderAcumulado>5){
            poderAcumulado -= 5
        }else{ 
            poderAcumulado = 0
             }
        
    }

}



class Poder {
    method capacidadDeBatalla(personaje){ // = (agilidad + fuerza) * habilidadExpecial
        return (self.agilidad(personaje) + self.fuerza(personaje))* self.habilidadEspecial(personaje)
    }
    method agilidad(personaje)
    method fuerza(personaje)
    method habilidadEspecial(personaje)
    method cumpleCondicionRadiacion()

}
class Velocidad inherits Poder{
    const rapidez 

    override method agilidad(personaje){
        return personaje.estrategia() * rapidez
    }
    override method fuerza(personaje){
        return personaje.espiritualidad() * rapidez
    }
    override method habilidadEspecial(personaje){
        return personaje.espiritualidad() + personaje.estrategia()
    }
    override method cumpleCondicionRadiacion(){
        return false
    }

}
class Vuelo inherits Poder{
    const alturaMaxima
    const energiaParaDespegar

    override method agilidad(personaje){
        return personaje.estrategia() * alturaMaxima / energiaParaDespegar
    }
    override method fuerza(personaje){
        return personaje.espiritualidad() + alturaMaxima - energiaParaDespegar
    }
    override method habilidadEspecial(personaje){
        return personaje.espiritualidad() + personaje.estrategia()
    }
    override method cumpleCondicionRadiacion(){
        return alturaMaxima>200
    }
    
}
class PoderAplificador inherits Poder{
    const poderBase // un objeto
    const amplificador

    override method agilidad(personaje){
        return poderBase.agilidad(personaje) //???
    }
    override method fuerza(personaje){
        return poderBase.fuerza(personaje)
    }
    override method habilidadEspecial(personaje){
        return poderBase.habilidadEspecial(personaje) * amplificador
    }
    override method cumpleCondicionRadiacion(){
        return true
    }
}

