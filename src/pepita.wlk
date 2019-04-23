import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad 

	var property position = game.at(3,3)
	method image() {
		if (energia > 100)
			return "pepita-gorda-raw.png"
		else
			return "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energia()
		game.removeVisual(comida)
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		} else {game.say(self, "Ya estoy en "+ unaCiudad.nombre() +"!")}
	}

	method irAComer(comida) {
		if (game.getObjectsIn(comida.position()).contains(comida)) {
			self.move(comida.position())
			self.come(comida)
		} else {game.say(self, "Ya me comí "+ comida.nombre() +"!")}
		
	}
	
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		var energiaRequerida = self.energiaParaVolar(position.distance(nuevaPosicion))
		if (energiaRequerida <= energia ) {
			energia -= energiaRequerida
			self.position(nuevaPosicion)
		} else {game.say(self, "Dame de comer primero!")}
	}	
}
