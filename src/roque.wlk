import pepita.*
import wollok.game.*

object roque {
	var property comidaLevantada
	var property position = game.at(0,0)
	method image() = "jugador.png"

	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method overPepitaAction() {
		if (comidaLevantada != null) {
			pepita.come(comidaLevantada) 
			self.soltarComida(comidaLevantada)
		}
	}
	method overFoodAction(comida) { self.levantarComida(comida) }
	
	method dropFood() {
		if (comidaLevantada != null) {
			comidaLevantada.position(self.position())
			game.addVisual(comidaLevantada)
			// no se le puede asignar el evento porque sino ni bien se coloca ya se dispara
			// game.whenCollideDo(comidaLevantada, { p => p.overFoodAction(comida) })
			comidaLevantada = null
		} else {game.say(self, "No tengo comida para soltar")}
	}
	method levantarComida(comida) {
		if (comidaLevantada != null) { self.soltarComida(comidaLevantada)}
		comidaLevantada = comida
		game.removeVisual(comida)
	}
	method soltarComida(comida) {
		comida.position(self.posicionAleatoria())
		game.addVisual(comida)
		game.whenCollideDo(comida, { p => p.overFoodAction(comida) })
		comidaLevantada = null
	}
	method posicionAleatoria() {
		/* retorna una posición aleatoria en el tablero, que no coincida
		 * con ninguno de los otros elementos existentes
		 */
		var randomX = 0.randomUpTo(game.width()).truncate(0)
		var randomY = 0.randomUpTo(game.height()).truncate(0)
		
		if (game.getObjectsIn(game.at(randomX, randomY)).isEmpty()) {
			return game.at(randomX, randomY)
		} 
		else {
			return self.posicionAleatoria()
		} 
	}
}