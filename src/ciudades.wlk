import wollok.game.*

object villaGesell {
	method image() = "ciudad.png"
	method position() = game.at(8,3)
	
	method nombre() = "Villa Gesell"
	method overPepitaAction() { /* polimorfismo con roque */ }
}

object buenosAires {
	method image() = "ciudad.png"
	method position() = game.at(1,1)
	
	method nombre() = "Buenos Aires"
	method overPepitaAction() { /* polimorfismo con roque */ }
}
