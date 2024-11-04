import peligro.*
import superpoderoses.*


class Equipo{

    const property equipo

    method miembroMasBulnerable(){
        return equipo.min({miembro => miembro.capacidadDeBatalla()})
    }

    method calidadDelEquipo(){
        return self.sumaCapacidades()/self.cantDeMiembros()
    }

    method sumaCapacidades(){
        return equipo.sum({miembro => miembro.capacidadDeBatalla()})
    }

    method cantDeMiembros(){
        return equipo.size()
    }

    method mejoresPoderes(){
        return equipo.map({miembro => miembro.mejorPoder()}).asSet()
    }

    method puedeAfrontarlo(peligro){
        return equipo.all({personaje => personaje.puedeAfrontarlo(peligro)})
    }


    method afrontarPeligro(peligro){
        const equipoAfrontador = self.losQuePuedenAfrontar(peligro)

        self.validarSonCantSuficienteParaAfrontarlo(peligro, equipoAfrontador.size())

        equipoAfrontador.forEach({personaje => personaje.afrontarPeligro(peligro)})

    }

    method validarSonCantSuficienteParaAfrontarlo(peligro, cantEquipo){
         if(peligro.cantPersQueSeBanca()>cantEquipo){
            self.error("No son suficientes para afrontar el peligro")
        }
    }



    method losQuePuedenAfrontar(peligro){
        return equipo.filter({personaje => personaje.puedeAfrontarlo(peligro)})
    }

    



}
