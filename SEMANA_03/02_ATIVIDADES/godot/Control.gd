extends Control

var atividade1 = ['item 1', 'item 2', 'item 3']
var atividade2 = []

var textoPadraoAtividade2
var textoPadraoAtividade3
var textoPadraoAtividade4

func inserirTextoAtividade3():
	# Atividade 3
	$ColorRect3/Atividade3.text = textoPadraoAtividade3 + 'Texto inserido automaticamente por função'
	
func _ready():
	# Atividade 1
	$ColorRect/Atividade1.text += str(atividade1)

	# Config atividade 2
	textoPadraoAtividade2 = $ColorRect2/Atividade2.text

	# Config atividade 3
	textoPadraoAtividade3 = $ColorRect3/Atividade3.text
	
	# Config atividade 4
	textoPadraoAtividade4 = $ColorRect4/Atividade4.text
	
	inserirTextoAtividade3()


func _on_Button_pressed():
	# Atividade 2
	if($ColorRect2/LineEdit.text):
		atividade2.append(str($ColorRect2/LineEdit.text))
		$ColorRect2/LineEdit.text = ''
		$ColorRect2/Atividade2.text = textoPadraoAtividade2 + str(atividade2)



func inserirTextoAtividade4(texto):
	# Atividade 4
	$ColorRect4/Atividade4.text = textoPadraoAtividade4 + texto


func _on_ButtonAtividade4_pressed():
	inserirTextoAtividade4(str($ColorRect4/LineEdit.text))
